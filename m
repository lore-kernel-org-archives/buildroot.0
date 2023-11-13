Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0FCC4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4990B41DDA;
	Mon, 13 Nov 2023 21:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4990B41DDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4VCZAf6M0fb; Mon, 13 Nov 2023 21:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FAD742083;
	Mon, 13 Nov 2023 21:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FAD742083
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBD0B1BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C42F681E67
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C42F681E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5GAqgrWkHp6 for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:52:02 +0000 (UTC)
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C291081E61
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C291081E61
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPA
 id 2eqcrx5vL9iS52eqcrWQNl; Mon, 13 Nov 2023 22:51:59 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 13 Nov 2023 22:51:57 +0100
Message-Id: <8B3AF030-EE03-4ED4-81B8-55F70804CD48@benettiengineering.com>
References: <87o7fxe353.fsf@48ers.dk>
In-Reply-To: <87o7fxe353.fsf@48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (21B91)
X-CMAE-Envelope: MS4xfNMk5FFY4JAY/pXBVJvJF1eRiR+8630XrxqRhvK2wu0rG7nFtgihudKkRqAVAyzWyqxGTmy7ooSoKJ4+YL6XZfghKRRIy13rkUOk0ZYVlhzcsxY2oztK
 P/Sk1a/Td4HAF8xAFcff5K42sAN+LavDc8xwZJNxHmf9MrM38l2JXrQm7AAdMK817RWW5h4lU2rqBxk2+/hoiSnAasn37OcIr7ekcMJTi7L/AaSRlKrk0tkh
 w+tD5ILK+9evTZaxpMF2ivqsm5wholTLDLPhdscp45VzrWy3DOj/mC8RJDec1ZfI
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699912319; bh=GjhfTcunbgNlrfAFBK8vEgrqpzlPX48FuIEOqoI/pC4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=TisAGAFyrW8+iMERfzZ1vSATidAEdgJiYU1TGkOglotEu07GMidd9pv94FpBYymSO
 iSlL+n/nPy5rtnx+qFFcu4vw47+YGisWN/J96b+R3a1BCJ6WrHqhw6nRDjbw6DeIX2
 NwN79fk/Cff7TFLi977QbeMDf12ibvpEE7WSB1SWWnNWhsOlF0zIChT7Lm0/9VMWj6
 JDS9s6QXzzSv+QKd+zojtmuDvNCwPObvXxj+RADiE3Ped018oMupYhE5Pc7goJAhxt
 i1+DrpipVjbzRYIvYPgv2Ag/KiTIVFHoW7awxFqF1G9rWJ4uQeM4wVK4+KJzeBtVgh
 dJesZkq9yDPzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TisAGAFy
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to mongoose
 and swupdate
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDEzIG5vdiAyMDIzLCBhbGxlIG9yZSAyMjo0OCwgUGV0ZXIgS29yc2dhYXJk
IDxwZXRlckBrb3JzZ2FhcmQuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7vwo+PiAKPj4+Pj4+ICJH
aXVsaW8iID09IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPiB3cml0ZXM6Cj4gCj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVs
aW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPj4gREVWRUxPUEVSUyB8
IDIgKysKPj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+PiBkaWZmIC0tZ2l0
IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPj4gaW5kZXggNjkzNTBmYmI5NS4uYzBjM2VlZmJh
NiAxMDA2NDQKPj4gLS0tIGEvREVWRUxPUEVSUwo+PiArKysgYi9ERVZFTE9QRVJTCj4+IEBAIC0x
MjQxLDYgKzEyNDEsNyBAQCBGOiAgICBwYWNrYWdlL2xpYnRyYWNlZnMKPj4gRjogICAgcGFja2Fn
ZS9saW51eC10b29scy9saW51eC10b29sLXJ0bGEubWsuaW4KPiAKPiBIbW0sIHRoaXMgZG9lc24n
dCBzZWVtIHRvIGJlIGFnYWluc3QgbWFzdGVyPwoKT29wcywgeW914oCZcmUgcmlnaHQsIEkgaGF2
ZSBvdGhlciBwYXRjaGVzIGFkZGluZyBtZSwgdGhhdOKAmXMgd2h5LgoKPiAKPiBGaXhlZCB1cCBt
YW51YWxseSBhbmQgY29tbWl0dGVkLCB0aGFua3MuCgpUaGFuayB5b3UhCkdpdWxpbwoKPiAKPj4g
RjogICAgcGFja2FnZS9tYWxpLWRyaXZlci8KPj4gRjogICAgcGFja2FnZS9taW5pY29tLwo+PiAr
RjogICAgcGFja2FnZS9tb25nb29zZS8KPj4gRjogICAgcGFja2FnZS9tbWMtdXRpbHMvCj4+IEY6
ICAgIHBhY2thZ2UvbmZzLXV0aWxzLwo+PiBGOiAgICBwYWNrYWdlL3B5dGhvbi1saWJjb25mLwo+
PiBAQCAtMTI1OSw2ICsxMjYwLDcgQEAgRjogICAgcGFja2FnZS9zdW54aS1tYWxpLXV0Z2FyZC8K
Pj4gRjogICAgcGFja2FnZS9zdW54aS1tYWxpLXV0Z2FyZC1kcml2ZXIvCj4+IEY6ICAgIHBhY2th
Z2Uvc3VueGktdG9vbHMvCj4+IEY6ICAgIHBhY2thZ2Uvc3d1Z2VuZXJhdG9yLwo+PiArRjogICAg
cGFja2FnZS9zd3VwZGF0ZS8KPj4gRjogICAgcGFja2FnZS90cmFjZS1jbWQvCj4+IEY6ICAgIHBh
Y2thZ2UvdWRpc2tzLwo+PiBGOiAgICBwYWNrYWdlL3dpbGMtZHJpdmVyLwo+PiAtLQo+IAo+PiAy
LjM0LjEKPiAKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
PiAKPiAKPiAtLQo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
