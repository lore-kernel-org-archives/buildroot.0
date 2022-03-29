Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715B0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 22:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04BD540C2A;
	Tue, 29 Mar 2022 22:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrZdCuMmypfK; Tue, 29 Mar 2022 22:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5FC40C26;
	Tue, 29 Mar 2022 22:34:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 140701BF2F1
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 22:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 003C740C26
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 22:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRM7a8YrtOlG for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 22:34:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB3E54011A
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 22:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b31i1C+TXXQfP7oNZORREVTfoTsIyI4wobgcd2JP5xM=; b=a5c10p5TAz0RFGkWlveJyTlyqZ
 xCJxv/xOnY1a84Cq2391CSs2vQv76cQXqVCzAGBALerqptiGWEWOU4BxvOcGHniMJYu4OndDDaO44
 VcO3VX2z9ZHPsK9mXiyKpmpA05jdm3VSZ6YZ4UePptM9F5uMrtf1Sgvxy8LaNyIqac9YGBi2VQ4+A
 XRfr9F39DzS+zSED+RWSimOf56pbCO+QNIImN2QwxTHmO1fbaZZmIQAL7XqZJgrnWwJ9IP75+FWtw
 0pXFCLQ7Y7Ud+RhP+H2nIhm7c82Af6JgZLZel+y3hZ7O+npZkl0uRZSQKlkIVNvzqFGfCJEBjWkOw
 cOUGmyIw==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nZKPy-0003Tp-7H; Wed, 30 Mar 2022 00:34:26 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id f3ccc7c3;
 Tue, 29 Mar 2022 22:34:03 +0000 (UTC)
Date: Wed, 30 Mar 2022 01:34:03 +0300
Message-ID: <20220330013403.GB1671742@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220329164036.4045575-1-james.hilliard1@gmail.com>
References: <20220329164036.4045575-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: fix software rendering
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5196453142426360195=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5196453142426360195==
Content-Type: multipart/signed; boundary="J5Y8qv3whuApwvD/"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--J5Y8qv3whuApwvD/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgSmFtZXMsCgpPbiBUdWUsIDI5IE1hciAyMDIyIDEwOjQwOjM2IC0wNjAwIEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiBXZSBuZWVkIHRvIGJhY2tw
b3J0IGEgcGF0Y2ggdG8gZml4IHNvZnR3YXJlIHJlbmRlcmluZyB3aXRoIGNvZy4KCkkgaGF2ZSBj
aGVycnktcGlja2VkIHRoaXMgZml4IChhbmQgb25lIG1vcmUpIGluIHRoZSBjb2ctMC4xMiBicmFu
Y2gsIGFuZCBJIGFtCnBsYW5uaW5nIHRvIHJlbGVhc2UgdmVyc2lvbiAwLjEyLjQgaW4gdGhlIG5l
eHQgaG91cnMuIFdEWVQgYWJvdXQgd2FpdGluZwp1bnRpbCB3ZSBoYXZlIHRoYXQgYW5kIHNraXAg
YWhlYWQgdG8gLjQgLS0gdGhhdCB3YXkgaXQgd2lsbCBub3QgYmUgbmVlZGVkIHRvCmltcG9ydCB0
aGlzIHBhdGNoIGluIEJ1aWxkcm9vdC4KCkNoZWVycywKLUFkcmlhbgogCj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gIC4u
LktfVkVSU0lPTi1tYWNyby1uYW1lLWFuZC1mZG8tYnVmZmVyLS5wYXRjaCB8IDQyICsrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvY29nLzAwMDEtRml4LVdQRV9GRE9fQ0hFQ0tfVkVSU0lPTi1t
YWNyby1uYW1lLWFuZC1mZG8tYnVmZmVyLS5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2NvZy8wMDAxLUZpeC1XUEVfRkRPX0NIRUNLX1ZFUlNJT04tbWFjcm8tbmFtZS1hbmQtZmRvLWJ1
ZmZlci0ucGF0Y2ggYi9wYWNrYWdlL2NvZy8wMDAxLUZpeC1XUEVfRkRPX0NIRUNLX1ZFUlNJT04t
bWFjcm8tbmFtZS1hbmQtZmRvLWJ1ZmZlci0ucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLmZlYzIxYzIyNWMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS9jb2cvMDAwMS1GaXgtV1BFX0ZET19DSEVDS19WRVJTSU9OLW1hY3JvLW5hbWUtYW5kLWZk
by1idWZmZXItLnBhdGNoCj4gQEAgLTAsMCArMSw0MiBAQAo+ICtGcm9tIDcxN2ZhZGIyZjE2ZmNi
MjhiM2I3MmRjNmQ3OTZjOGNlOWFlMTRhZmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zy
b206IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ICtEYXRlOiBT
YXQsIDI2IE1hciAyMDIyIDEzOjMwOjQ3IC0wNjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4IFdQ
RV9GRE9fQ0hFQ0tfVkVSU0lPTiBtYWNybyBuYW1lIGFuZCBmZG8gYnVmZmVyIHJlbGVhc2UKPiAr
IGZ1bmN0aW9uIG5hbWUuCj4gKwo+ICsoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBkMjcyMDEw
M2ZmOGE1YzNjNWMwNTY0ODc1ODZlZDBiNWFjZGMyYjkxKQo+ICsKPiArU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gK1tqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tOiBiYWNrcG9ydCBmcm9tIHVwc3RyZWFtIGNvbW1pdAo+ICs3MTdmYWRi
MmYxNmZjYjI4YjNiNzJkYzZkNzk2YzhjZTlhZTE0YWZjXQo+ICstLS0KPiArIHBsYXRmb3JtL3dh
eWxhbmQvY29nLXBsYXRmb3JtLXdsLmMgfCA2ICsrKy0tLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9wbGF0Zm9y
bS93YXlsYW5kL2NvZy1wbGF0Zm9ybS13bC5jIGIvcGxhdGZvcm0vd2F5bGFuZC9jb2ctcGxhdGZv
cm0td2wuYwo+ICtpbmRleCAwZmY5ZTZmLi40NmM1MTg1IDEwMDY0NAo+ICstLS0gYS9wbGF0Zm9y
bS93YXlsYW5kL2NvZy1wbGF0Zm9ybS13bC5jCj4gKysrKyBiL3BsYXRmb3JtL3dheWxhbmQvY29n
LXBsYXRmb3JtLXdsLmMKPiArQEAgLTYzLDcgKzYzLDcgQEAKPiArIAo+ICsgI2RlZmluZSBERUZB
VUxUX1pPT01fU1RFUCAwLjFmCj4gKyAKPiArLSNpZiBkZWZpbmVkKFdQRV9XTF9DSEVDS19WRVJT
SU9OKQo+ICsrI2lmIGRlZmluZWQoV1BFX0ZET19DSEVDS19WRVJTSU9OKQo+ICsgIyAgICBkZWZp
bmUgSEFWRV9TSE1fRVhQT1JURURfQlVGRkVSIFdQRV9GRE9fQ0hFQ0tfVkVSU0lPTigxLCA5LCAw
KQo+ICsgIyAgICBkZWZpbmUgSEFWRV9GVUxMU0NSRUVOX0hBTkRMSU5HIFdQRV9GRE9fQ0hFQ0tf
VkVSU0lPTigxLCAxMSwgMSkKPiArICNlbHNlCj4gK0BAIC0xNzA1LDggKzE3MDUsOCBAQCBzdGF0
aWMgdm9pZAo+ICsgc2htX2J1ZmZlcl9kZXN0cm95KHN0cnVjdCBzaG1fYnVmZmVyICpidWZmZXIp
Cj4gKyB7Cj4gKyAgICAgaWYgKGJ1ZmZlci0+ZXhwb3J0ZWRfYnVmZmVyKSB7Cj4gKy0gICAgICAg
IHdwZV92aWV3X2JhY2tlbmRfZXhwb3J0YWJsZV93bF9lZ2xfZGlzcGF0Y2hfcmVsZWFzZV9zaG1f
ZXhwb3J0ZWRfYnVmZmVyKHdwZV9ob3N0X2RhdGEuZXhwb3J0YWJsZSwKPiArLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYnVmZmVyLT5leHBvcnRlZF9idWZmZXIpOwo+ICsrICAgICAgICB3cGVfdmll
d19iYWNrZW5kX2V4cG9ydGFibGVfZmRvX2VnbF9kaXNwYXRjaF9yZWxlYXNlX3NobV9leHBvcnRl
ZF9idWZmZXIod3BlX2hvc3RfZGF0YS5leHBvcnRhYmxlLAo+ICsrICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnVmZmVyLT5leHBvcnRlZF9idWZmZXIpOwo+ICsgICAgIH0KPiArIAo+ICsgICAgIHds
X2J1ZmZlcl9kZXN0cm95KGJ1ZmZlci0+YnVmZmVyKTsKPiArLS0gCj4gKzIuMjUuMQo+ICsKPiAt
LSAKPiAyLjI1LjEK

--J5Y8qv3whuApwvD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYkOJWwAKCRCRxVnb5MkS
O+iEAJ9TixC1M5ZSpuFoJpHSZtp897/w1wCfaFIoRb0xag4MJZypqgytCFniBh8=
=B5T4
-----END PGP SIGNATURE-----

--J5Y8qv3whuApwvD/--

--===============5196453142426360195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5196453142426360195==--
