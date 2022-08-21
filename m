Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C99CC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 807F681466;
	Sun, 21 Aug 2022 21:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 807F681466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzIIp1eMetlk; Sun, 21 Aug 2022 21:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF3781434;
	Sun, 21 Aug 2022 21:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF3781434
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66DCF1BF5B3
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4179D81434
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 21:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4179D81434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqY5zhC5tlPc for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 21:17:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5830B8142B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5830B8142B
 for <buildroot@busybox.net>; Sun, 21 Aug 2022 21:17:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0D21113F8A7;
 Sun, 21 Aug 2022 23:17:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 23:17:09 +0200
Date: Sun, 21 Aug 2022 23:17:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220821211709.GV2167049@scaer>
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221043034.2736010-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661116632;
 bh=iDc6kcL+1EDxdxgK7O32jUyvlwUmRyvSse+7srS4D2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CI2YEmSCo8XNmoGIziMhWUpKur9Qy61Daw3CudcBZhR1+mh5crfI9WM4LnEPhrjZL
 W6AtuXX/gjTte/PwYF5nBjVALItudtTPvg6zw6zW+ZVflnDwgvTu6163vDIOLNe+0p
 mSQ+sPnTxVE2yncef2K6E0q08SPAKivreUIfJ8fw1ekroAlF0vXmF0ayKyXu5fNIPW
 00CaxiDddn80UamiCIOqInoRpbLvPhuj5fr1dhDyX9Wdai3StVWUT5Nmdy22fGipEN
 D8+b7YcNlPfdiCfPzELB3kmUAWiYJPgr0SNbne/uvreVed+hSls+vbp7ijbtdJMNJl
 lb9440nbAzs8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CI2YEmSC
Subject: Re: [Buildroot] [PATCH 0/3] portable services: another use case of
 BR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAyLTIxIDA1OjMwICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFRoaXMgc2VyaWVzIGFsbG93cyB0byBidWlsZCBhIHJvb3RmcyBz
dWl0YWJsZSBmb3IgcG9ydGFibGUgc2VydmljZXMgd2l0aCBzeXN0ZW1kLgo+IAo+IEEgbmV3IHZh
bHVlIG9mICJJbml0IHN5c3RlbSIgaXMgaW50cm9kdWNlZCA6IEJSMl9JTklUX1BPUlRBQkxFLgo+
IEJSMl9JTklUX1BPUlRBQkxFIGlzIGxpa2UgQlIyX0lOSVRfTk9ORSwgYnV0IHdpdGggYWxsIEZP
T19JTlNUQUxMX0lOSVRfU1lTVEVNRCBleGVjdXRlZC4KPiAKPiBBIG5ldyB0eXBlIG9mIHNrZWxl
dG9uIGlzIHJlcXVpcmVkIDogQlIyX1BBQ0tBR0VfU0tFTEVUT05fSU5JVF9QT1JUQUJMRS4KPiAK
PiBzZWUgaHR0cHM6Ly9zeXN0ZW1kLmlvL1BPUlRBQkxFX1NFUlZJQ0VTLwoKSSBkb24ndCBzZWUg
YW55dGhpbmcgdGhhdCBjYW4ndCBiZSBhbHJlYWR5IG1hbmFnZWQgd2l0aCBleGlzdGluZwpjb25m
aWd1cmF0aW9uIG9wdGlvbnMuCgpBbGwgdGhhdCB0aGlzIG5ldyBzby1jYWxsZWQgaW5pdCBzeXN0
ZW0gZG9lcywgaXMgY2hhbmdlIHNvbWUgZGVmYXVsdHMgdG8KbWF0Y2ggYSBzcGVjaWZpYyB1c2Ut
Y2FzZS4gV2UgaGFkIHNpbWlsYXIgc3R1ZmYgYmFjayBpbiB0aGUgZGF5IChlLmcuIGFuCm9wdGlv
biB0byBkZWZpbmUgYSByb3V0ZXIsIG9uZSB0byBkZWZpbmUgc29tZXRoaW5nIGVsc2UsIGFuZCBz
byBvbiksIGFuZAp3ZSByZW1vdmVkIGFsbCBvZiB0aGVtLgoKR3JhbnRlZCwgcG9ydGFibGUgc2Vy
dmljZXMgYXJlIHNsaWdodGx5IGRpZmZlcmVudCwgYnV0IHN0aWxsIGFsbCB0aGF0CnRoaXMgc2Vy
aWVzIGV2ZW50dWFsbHkgZG9lcyBpcyBjaGFuZ2Ugc29tZSBkZWZhdWx0czsgaXQgZG9lcyBub3Qg
ZXZlbgplbmZvcmNlIHRoZSBzZXR0aW5ncyBzbyB0aGV5IGFyZSBub3QgZXZlbiByZXF1aXJlZC4K
CkV2ZW4gdGhlIG5ldyBza2VsZXRvbiBjYXNlIGNhbiBhbHJlYWR5IGJlIGhhbmRsZWQgYnkgcHJv
dmlkaW5nIGEgY3VzdG9tCnNrZWxldG9uLCBhbmQgaXQgaXMgYSB0cml2aWFsIG9uZSwgc28gZXZl
biB0aGF0IGlzIG5vdCBuZWVkZWQuCgpJZiB5b3Ugd2FudCB0byBidWlsZCBhIHBvcnRhYmxlIHNl
cnZpY2UsIGp1c3QgYnVpbGQgYSBzeXN0ZW0gd2l0aApzeXN0ZW1kIGFuZCB0aGUgcmVzdCBvZiB0
aGUgc2V0dGluZ3Mgc2V0IGFzIHJlcXVpcmVkIGZvciB0aGF0IHVzZS1jYXNlLgoKU28sIG15IHBv
c2l0aW9uIGlzIHRvIHJlamVjdCB0aGlzIG5ldyBwc2V1ZG8taW5pdCBzeXN0ZW0uCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKPiBGcmFuY29pcyBQZXJyYWQgKDMpOgo+ICAgcGFja2FnZS9za2Vs
ZXRvbi1pbml0LXBvcnRhYmxlOiBuZXcgc2tlbGV0b24KPiAgIHBvcnRhYmxlOiBuZXcgaW5pdCBz
eXN0ZW0KPiAgIHBvcnRhYmxlOiB0d2VhayBzb21lIGRlZmF1bHQgdmFsdWVzCj4gCj4gIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgZnMvc3F1
YXNoZnMvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdl
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2Uv
aWZ1cGRvd24tc2NyaXB0cy9Db25maWcuaW4gICAgICAgICAgICB8ICAyICstCj4gIHBhY2thZ2Uv
cGtnLWdlbmVyaWMubWsgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gIHBhY2thZ2Uv
c2tlbGV0b24taW5pdC1wb3J0YWJsZS9Db25maWcuaW4gICAgICB8ICA3ICsrKysrKwo+ICAuLi4v
c2tlbGV0b24taW5pdC1wb3J0YWJsZS5tayAgICAgICAgICAgICAgICAgfCAyMyArKysrKysrKysr
KysrKysrKysrCj4gIHN5c3RlbS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDE4ICsrKysrKysrKysrLS0tLQo+ICA4IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NrZWxldG9u
LWluaXQtcG9ydGFibGUvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Nr
ZWxldG9uLWluaXQtcG9ydGFibGUvc2tlbGV0b24taW5pdC1wb3J0YWJsZS5tawo+IAo+IC0tIAo+
IDIuMzIuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
