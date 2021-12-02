Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E95C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 21:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E204340179;
	Thu,  2 Dec 2021 21:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZ7iJ41KR0gB; Thu,  2 Dec 2021 21:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C969C40A92;
	Thu,  2 Dec 2021 21:38:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B7291BF3BA
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 21:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58AF480F8A
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWK41TG7tySM for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 21:38:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB9F480F39
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 21:38:39 +0000 (UTC)
Received: from smtpclient.apple ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPA
 id stmnmQ7c5z3hmstmnmqWXr; Thu, 02 Dec 2021 22:38:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1638481118; bh=d94qs/oEC1FBLjsgtR3o+QWtl19K75AlvSdIqqZzwB8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ixLmvB8MlX66mVWVJjvTkOBHmq2O99th393IBxst2KndsYsfSRDEVMD3SYBicje85
 BZjN5WpGej3Z4NTOYJTtRX7Auv/RU8a9+Ep/Al+v3KknkxTyrZmIQrpA4N8ANDZ9Uk
 CmolzR/HQn/pTWiBLUbx9MRffUwmDeGnfTdvmc5/aETGhbQTw0XLP78Kv57zcySHFy
 faCb7PHxSg1Spcb65yOZ9lmwjt4Qv8HNz/qvJewtlFBFk5JdWrcOFk8OS7LsSKGy4R
 KpQV8m5VdGtovnrzHz/3GVXbe9s3eIwFfaOBp2xDZk7N4Z8c0GjqFrJGBW2xCQe4Wq
 OInw7gVqFqakA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 2 Dec 2021 22:38:37 +0100
Message-Id: <E2DB973E-9C90-49F0-8D20-DA9014FD05F2@benettiengineering.com>
References: <20211202213347.14374-1-peter@korsgaard.com>
In-Reply-To: <20211202213347.14374-1-peter@korsgaard.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (19B74)
X-CMAE-Envelope: MS4xfBxkVothtPcEDSRxZNEMeOjYJsv9h5PNEQFBwsZxYN3rRm9VGPAR9xfOOdJ4YO2yLDIQsxjhP9peF+Aq8cZPkKCxv2QUR54+BEs8JJhyPhtxJnSEzO6U
 +c0/tnhNRiNkUfzJkACXK7bZenue9pBPTsQ/sukTMN3ne/KtHhR241He9TVwWyKN5Utj7wfo4ibzw89TGG2RAy9SR4z1R+YjwYHdW18ukgTdzskI/X3e9qJQ
 15t8PpUP+rDMQOQxBMcRcrcfdOvzSwK/EuUsjod7RPvT6C2RCESANH0PC4evXyjn
Subject: Re: [Buildroot] [PATCH] package/libnss: security bump to version
 3.73
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgo+IElsIGdpb3JubyAyIGRpYyAyMDIxLCBhbGxlIG9yZSAyMjozNCwgUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBoYSBzY3JpdHRvOgo+IAo+IO+7v0ZpeGVz
IHRoZSBmb2xsb3dpbmcgc2VjdXJpdHkgaXNzdWU6Cj4gCj4gLSBDVkUtMjAyMS00MzUyNzogSGVh
cCBvdmVyZmxvdyBpbiBOU1Mgd2hlbiB2ZXJpZnlpbmcgRFNBL1JTQS1QU1MKPiAgREVSLWVuY29k
ZWQgc2lnbmF0dXJlcwo+IAo+IEZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgYWR2aXNvcnk6Cj4g
aHR0cHM6Ly93d3cubW96aWxsYS5vcmcvZW4tVVMvc2VjdXJpdHkvYWR2aXNvcmllcy9tZnNhMjAy
MS01MS8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFy
ZC5jb20+CgpZb3XigJl2ZSBiZWF0ZW4gbWUgb24gdGltZSA6LSkKClJldmlld2VkLWJ5OiBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KCkJlc3Qg
cmVnYXJkcwpHaXVsaW8gQmVuZXR0aQoKPiAtLS0KPiBwYWNrYWdlL2xpYm5zcy9saWJuc3MuaGFz
aCB8IDQgKystLQo+IHBhY2thZ2UvbGlibnNzL2xpYm5zcy5tayAgIHwgMiArLQo+IDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYm5zcy9saWJuc3MuaGFzaCBiL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5oYXNo
Cj4gaW5kZXggM2RjNmNiMTg1YS4uODAzYjIzNGM4MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xp
Ym5zcy9saWJuc3MuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5oYXNoCj4gQEAg
LTEsNCArMSw0IEBACj4gLSMgRnJvbSBodHRwczovL2Z0cC5tb3ppbGxhLm9yZy9wdWIvc2VjdXJp
dHkvbnNzL3JlbGVhc2VzL05TU18zXzcyX1JUTS9zcmMvU0hBMjU2U1VNUwo+IC1zaGEyNTYgIDZl
YTYwYTlmZjExM2U0OTNlYTJhYjI1ZjQxZWE3NWE5ZmJkMTBhZjc5MDNmMjZmNzAzZGFjODY4MDcz
MmQwMmUgIG5zcy0zLjcyLnRhci5nego+ICsjIEZyb20gaHR0cHM6Ly9mdHAubW96aWxsYS5vcmcv
cHViL3NlY3VyaXR5L25zcy9yZWxlYXNlcy9OU1NfM183M19SVE0vc3JjL1NIQTI1NlNVTVMKPiAr
c2hhMjU2ICA1NjZkM2E2OGRhOWIxMGQ3ZGE5ZWY4NGViNGZlMTgyZjhmMDRlMjBkODVjNTVkMWJm
MzYwYmIyYzAwOTZkOGU1ICBuc3MtMy43My50YXIuZ3oKPiAjIExvY2FsbHkgY2FsY3VsYXRlZAo+
IHNoYTI1NiAgYTIwYzFhMzJkMWY4MTAyNDMyMzYwYjQyZTkzMjg2OWY3YzExYzdjZGJhY2Y5Y2Fj
NTU0YzQyMjEzMmFmNDdmNCAgbnNzL0NPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJu
c3MvbGlibnNzLm1rIGIvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rCj4gaW5kZXggMmQ4ODBkMjMz
Ni4uNjUwNGYzMGQzMSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYm5zcy9saWJuc3MubWsKPiAr
KysgYi9wYWNrYWdlL2xpYm5zcy9saWJuc3MubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAjCj4gIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAKPiAtTElCTlNTX1ZFUlNJT04gPSAzLjcyCj4gK0xJQk5T
U19WRVJTSU9OID0gMy43Mwo+IExJQk5TU19TT1VSQ0UgPSBuc3MtJChMSUJOU1NfVkVSU0lPTiku
dGFyLmd6Cj4gTElCTlNTX1NJVEUgPSBodHRwczovL2Z0cC5tb3ppbGxhLm9yZy9wdWIvbW96aWxs
YS5vcmcvc2VjdXJpdHkvbnNzL3JlbGVhc2VzL05TU18kKHN1YnN0IC4sXywkKExJQk5TU19WRVJT
SU9OKSlfUlRNL3NyYwo+IExJQk5TU19ESVNURElSID0gZGlzdAo+IC0tIAo+IDIuMjAuMQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
