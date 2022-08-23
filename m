Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64047C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 16:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07213409ED;
	Tue, 23 Aug 2022 16:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07213409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zV5cFLlKWCtm; Tue, 23 Aug 2022 16:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E832340992;
	Tue, 23 Aug 2022 16:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E832340992
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0538A1BF300
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 16:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D423F81B14
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 16:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D423F81B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jiislsjRTWrq for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 16:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A63881A4E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A63881A4E
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 16:46:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5cb:81c2:970c:cd58])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 4159520058D;
 Tue, 23 Aug 2022 18:46:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Aug 2022 18:46:11 +0200
Date: Tue, 23 Aug 2022 18:46:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220823164611.GI2167049@scaer>
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221043034.2736010-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661273173;
 bh=0Na5FderfsP3rssaoVZh2wmEo0Bl9nnMdVXg/86QlLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HAJcaE+GRhjvI+oe7yZX6tgBW8QYVJk8bQS01iBz5Tf/TyiuAWZW8CYgth5sR1y+r
 GznvxiJYg3TZ5JEj+/xv/vQR3h80UIE96HaqT9O5cpnvmrqq70SVsQMzBN3Cfs5z8x
 WVsVFBJSz0ZizaoB70QFomRKCneAvpu7Hl7ORPRhotEx/Loegz/OoaDvzQJRJcS+Ym
 4IaS4s1yjGdsuxTzOSuHZNRY80PVDKzh3cgJL9ntP9fDmzayQvJyKirZeqPLpPiKx8
 p19n0yFvJLija0S6l2T/7Ga3pIChL6VeNuIb0ODzOHpBKwIGUtqSKOE/e4SUBObMK3
 mF+aHwUt6mtNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HAJcaE+G
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
PiBzZWUgaHR0cHM6Ly9zeXN0ZW1kLmlvL1BPUlRBQkxFX1NFUlZJQ0VTLwoKR2l2ZW4gdGhlIGZl
ZWRiYWNrIG9uIHRoaXMgc2VyaWVzLCBhbmQgYWZ0ZXIgZGlzY3Vzc2luZyB3aXRoIHRoZSBvdGhl
cgptYWludGFpbmVycywgSSd2ZSBub3cgbWFya2VkIHRoaXMgc2VyaWVzIGFzIHJlamVjdGVkLiBT
b3JyeSBmb3IgdGhhdC4KCklmIHlvdSBiZWxpZXZlIHRoZSB1c2UtY2FzZSBpcyByZWFsbHkgaW1w
b3J0YW50LCB3ZSBjYW4gcmVjb25zaWRlciBpdCBpbgp0aGUgbGlnaHQgb2YgYSBuZXdlciBhbmQg
bW9yZSBjb21wbGV0ZSBzZXJpZXMgdGhhdCBhZGRyZXNzZXMgdGhlIGlzc3Vlcwp0aGF0IHdlcmUg
cmFpc2VkIGluIHRoaXMgcmV2aWV3LgoKVGhhbmsgeW91IQoKUmVnYXJkcywKWWFubiBFLiBNT1JJ
Ti4KCj4gRnJhbmNvaXMgUGVycmFkICgzKToKPiAgIHBhY2thZ2Uvc2tlbGV0b24taW5pdC1wb3J0
YWJsZTogbmV3IHNrZWxldG9uCj4gICBwb3J0YWJsZTogbmV3IGluaXQgc3lzdGVtCj4gICBwb3J0
YWJsZTogdHdlYWsgc29tZSBkZWZhdWx0IHZhbHVlcwo+IAo+ICBERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGZzL3NxdWFzaGZzL0NvbmZpZy5p
biAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2lmdXBkb3duLXNjcmlw
dHMvQ29uZmlnLmluICAgICAgICAgICAgfCAgMiArLQo+ICBwYWNrYWdlL3BrZy1nZW5lcmljLm1r
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+ICBwYWNrYWdlL3NrZWxldG9uLWluaXQt
cG9ydGFibGUvQ29uZmlnLmluICAgICAgfCAgNyArKysrKysKPiAgLi4uL3NrZWxldG9uLWluaXQt
cG9ydGFibGUubWsgICAgICAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKwo+ICBz
eXN0ZW0vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOCArKysrKysr
KysrKy0tLS0KPiAgOCBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9za2VsZXRvbi1pbml0LXBvcnRhYmxl
L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9za2VsZXRvbi1pbml0LXBv
cnRhYmxlL3NrZWxldG9uLWluaXQtcG9ydGFibGUubWsKPiAKPiAtLSAKPiAyLjMyLjAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
