Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD16C433FE
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 987ED6124A
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 987ED6124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 418684071C;
	Fri,  5 Nov 2021 15:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUeUb-fhNqAY; Fri,  5 Nov 2021 15:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFE0140707;
	Fri,  5 Nov 2021 15:46:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58CA41BF5DA
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54DF740707
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:46:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oN596LT66M_F for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 15:46:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 226A8406F1
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 15:46:11 +0000 (UTC)
Received: from [77.244.183.192] (port=63408 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1mj1Pt-00FAlp-NV; Fri, 05 Nov 2021 16:46:09 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <27c59ddf-4bcb-86e1-91cf-28b45848d446@lucaceresoli.net>
 <CC4DEBFE-15CC-4593-9F6D-7775ECF08A71@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
Date: Fri, 5 Nov 2021 16:46:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CC4DEBFE-15CC-4593-9F6D-7775ECF08A71@benettiengineering.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/2] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Julien Olivain <ju.o@free.fr>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKT24gMDUvMTEvMjEgMTQ6MjQsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhp
IEx1Y2EsCj4gCj4+IElsIGdpb3JubyA1IG5vdiAyMDIxLCBhbGxlIG9yZSAxMjowNSwgTHVjYSBD
ZXJlc29saSA8bHVjYUBsdWNhY2VyZXNvbGkubmV0PiBoYSBzY3JpdHRvOgo+Pgo+PiDvu79IaSBH
aXVsaW8sCj4+Cj4+PiBPbiAwNC8xMS8yMSAxODoyMywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+
PiBIaSBMdWNhLAo+Pj4KPj4+PiBPbiAxMS80LzIxIDEwOjI2IEFNLCBMdWNhIENlcmVzb2xpIHdy
b3RlOgo+Pj4+IEhpIEdpdWxpbywKPj4+Pgo+Pj4+IHRoYW5rcyBmb3IgdGhlc2UgYW5kIHRoZSBv
dGhlciBvbGltZXggcGF0Y2hlcyB5b3UgYXJlIHNlbmRpbmcuIFRob21hcwo+Pj4+IGFwcGxpZWQg
dGhlbSBmYXN0ZXIgdGhhbiBJIGNvdWxkIHJldmlldyBhbmQgdGVzdCB0aGVtLi4uIGxldCBtZSB0
cnkgdGhpcwo+Pj4+IHRpbWUgOikKPj4+Cj4+PiBJJ3ZlIGp1c3Qgc2VudCB0aGUgdjIgc2VyaWVz
LCBkbyB3ZSB3YWl0IHVudGlsIHlvdSBnaXZlIGEgVGVzdGVkLWJ5OiA/Cj4+Cj4+IEp1c3Qgc2Vu
dCBteSBUZXN0ZWQtYnkgdG9vLCBidXQgSSBvbmx5IGJ1aWxkIHRlc3RlZCBzaW5jZSBJIGhhdmUg
bm8gbGltZQo+PiBib2FyZC4KPiAKPiBIYXZlIHlvdeKAmXZlIGdpdmVuIGEgdHJ5IG9uIGxpbWUy
IGF0IGxlYXN0PwoKTm8sIGFwb2xvZ2llcywgSSBkb24ndCBoYXZlIGFueSAibGltZSoiIGJvYXJk
Li4uIG5vIGxpbWUsIG5vIGxpbWUyLgoKSSBoYXZlIG9ubHkgYW4gQTIwIG1pY3JvIGJ1dCBpdCBo
YXMgbm8gTUFMSSBkZWZjb25maWcgaW4gQnVpbGRyb290IGFuZApzbyBpdCBkb2Vzbid0IGFwcGVh
ciBpbiB0aGlzIHNlcmllcy4KCi0tIApMdWNhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
