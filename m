Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFB9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7064D6FC06;
	Thu,  6 Jan 2022 22:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKFV5l34r7_f; Thu,  6 Jan 2022 22:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6C2760A78;
	Thu,  6 Jan 2022 22:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 108421BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F24EC833C9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1oIKqUzxHze for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:24:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0579482ACD
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:24:53 +0000 (UTC)
Received: from [194.32.174.188] (port=51738 helo=[172.16.0.179])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1n5bBj-000AXa-PJ; Thu, 06 Jan 2022 23:24:51 +0100
To: Arnout Vandecappelle <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
 <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
 <5a11f784-6685-f33a-002d-654253e9bb61@mind.be>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <04340ad2-23fc-48e0-80da-54bded5158c8@lucaceresoli.net>
Date: Thu, 6 Jan 2022 23:24:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5a11f784-6685-f33a-002d-654253e9bb61@mind.be>
Content-Language: it-IT
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
Subject: Re: [Buildroot] [PATCH v2 0/5] Rename sunxi-mali-mainline* to
 sunxi-mali-utgard* and fix Mali loading
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMDYvMDEvMjIgMTk6MDMsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3Rl
Ogo+IAo+IAo+IE9uIDA1LzExLzIwMjEgMjM6MTcsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBX
aXRoIHRoaXMgcGF0Y2hzZXQgSSByZXNwaW4gdGhlIGZpcnN0IDIgcGF0Y2hlcy4gV2hpbGUgdGVz
dGluZyBvbgo+PiBoYXJkd2FyZQo+PiB0aGUgcGF0Y2hlcyB0aGV5IHdvcmssIGJ1dCBJJ3ZlIGxl
ZnQgYmFjayBhbiBlcnJvciB3aGlsZSBidW1waW5nIGxpbnV4Cj4+IHZlcnNpb24gdG8gNS4xNC4g
VGhlIGVycm9yIGlzIHRoYXQgTGludXgncyBzdW54aV9kZWZjb25maWcodXNlZCBieSBib3RoCj4+
IGEyMF9vbGludXhpbm9fbGltZS8yKSBlbmFibGVzIExpbWEgZHJpdmVyLCBidXQgaW4gdGhpcyAy
IGJvYXJkcyB3ZSB3YW50Cj4+IHRvIHVzZSBNYWxpIGRyaXZlciwgc28gd2hlbiBNYWxpIGRyaXZl
ciB0cmllcyB0byBsb2FkKGJlaW5nIGl0IGEgbW9kdWxlKSwKPj4gaXQgZmluZHMgdGhhdCBMaW1h
IGFscmVhZHkgaGFzIHRha2VuIGdwdSByZXNvdXJjZXMgYW5kIGZhaWwuIFNvIGhlcmUgSQo+PiBh
ZGQKPj4gMyBwYXRjaGVzLCAxIHRvIGFkZCBhIExpbnV4IGZyYWdtZW50IHRvIGRpc2FibGUgTGlt
YSBpbiBMaW51eCBhbmQgb3RoZXIgMgo+PiB0byB1c2UgdGhhdCBmcmFnbWVudCBpbiBhMjBfb2xp
bnV4aW5vX2xpbWUvMi4KPj4KPj4gR2l1bGlvIEJlbmV0dGkgKDMpOgo+PiDCoMKgIGJvYXJkL29s
aW1leC9hMjBfb2xpbnV4aW5vOiBhZGQgbGludXgtZGlzYWJsZS1saW1hLmZyYWdtZW50Cj4+IMKg
wqAgY29uZmlncy9vbGltZXhfYTIwX29saW51eGlub19saW1lMl9kZWZjb25maWc6IHVzZQo+PiDC
oMKgwqDCoCBsaW51eC1kaXNhYmxlLWxpbWEuZnJhZ21lbnQKPj4gwqDCoCBjb25maWdzL29saW1l
eF9hMjBfb2xpbnV4aW5vX2xpbWVfZGVmY29uZmlnOiB1c2UKPj4gwqDCoMKgwqAgbGludXgtZGlz
YWJsZS1saW1hLmZyYWdtZW50Cj4+Cj4+IE1pcXVlbCBSYXluYWwgKDIpOgo+PiDCoMKgIHBhY2th
Z2Uvc3VueGktbWFsaS11dGdhcmQ6IHJlbmFtZSBmcm9tIHN1bnhpLW1hbGktbWFpbmxpbmUKPj4g
wqDCoCBwYWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkLWRyaXZlcjogcmVuYW1lIGZyb20KPj4gwqDC
oMKgwqAgc3VueGktbWFsaS1tYWlubGluZS1kcml2ZXIKPiAKPiDCoEkgYXBwbGllZCB0aGVzZSB0
d28gcGF0Y2hlcyB0byBtYXN0ZXIuCj4gCj4gwqBMdWNhLCB5b3VyIHJldmlldyB3YXMgdmVyeSBt
dWNoIGFwcHJlY2lhdGVkIHNvIGlmIHlvdSBjb3VsZCBtYXliZQo+IHJldmlldyB0aGUgcmVzdCBv
ZiB0aGlzIHNlcmllcyBhcyB3ZWxsPyA6LSkKCkknbSBhZnJhaWQgSSdtIHVuYWJsZSB0byBkbyBz
byB0aGVzZSBkYXlzLiBIb3BlZnVsbHkgbmV4dCB3ZWVrLgoKLS0gCkx1Y2EKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
