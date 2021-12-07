Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACB4C433FE
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B04D04041B;
	Tue,  7 Dec 2021 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdoqk508s0Kh; Tue,  7 Dec 2021 21:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F142F40409;
	Tue,  7 Dec 2021 21:00:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17F371BF290
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 120FF40409
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ir1TXK66_L_m for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 21:00:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E49640406
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 21:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Ahns4OafhgMZzUE/t6H6v274IvA1AneBy2UHGlyQFE=; b=VAAYABJYSH8G2+Xfjp5W1b74X1
 bud0jznzJrZqcOZptunWjjU/u7XSCutA9tjur2MSGTaGE6fwJaVQlF2gggbfqYhQyvYg3kPNBlfn3
 AC33wpqGqapgbbeMQN9s1Mp5vJme1Yn+5hPRAkU/s/ShvbKuAcHd/aCh7BnHgk5zlf+nO57WmpvlF
 2LMTc1PhIUuZ90ItMhRAIiV5y0HjbpVigbdJAYFcKqXhr7oqe6BNJ5xGSVynfartUsrJE9cX3Upnj
 5c97quW+R9DlIK4QA3wqqwY9IHpOhHTUZ0Qr2rSgec49x77TDNsdLrrP+5OX3wkPAoPomLzV+wVHr
 kaBT770w==;
Received: from 91-152-140-131.elisa-laajakaista.fi ([91.152.140.131]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1muhZK-0007wG-OV; Tue, 07 Dec 2021 22:00:10 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id fa663b96;
 Tue, 7 Dec 2021 21:00:00 +0000 (UTC)
Date: Tue, 7 Dec 2021 23:00:00 +0200
Message-ID: <20211207230000.GD1275852@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20211207143429.2821436-1-james.hilliard1@gmail.com>
References: <20211207143429.2821436-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: select videorate
 when building with media-stream support
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
Content-Type: multipart/mixed; boundary="===============1794550269306627207=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1794550269306627207==
Content-Type: multipart/signed; boundary="MKOmyztc/CFLYyQ2"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--MKOmyztc/CFLYyQ2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAwNyBEZWMgMjAyMSAwNzozNDoyOSAtMDcwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gRml4ZXM6Cj4gRVJST1IgR1NUX1BJUEVMSU5F
IGdzdC9wYXJzZS9ncmFtbWFyLnk6ODU3OnByaXZfZ3N0X3BhcnNlX3l5cGFyc2U6IG5vIGVsZW1l
bnQgInZpZGVvcmF0ZSIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxh
cGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbiB8
IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmlu
Cj4gaW5kZXggODM1NzA1MWU5My4uMzY1MjNiZGI0MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dw
ZXdlYmtpdC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiBA
QCAtMTA5LDYgKzEwOSw3IEBAIGlmIEJSMl9QQUNLQUdFX1dQRVdFQktJVF9NVUxUSU1FRElBCj4g
IAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01FRElBX1NUUkVBTQo+ICAJYm9vbCAi
bWVkaWEtc3RyZWFtIHN1cHBvcnQiCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5T
X0JBU0VfUExVR0lOX1ZJREVPUkFURQo+ICAJaGVscAo+ICAJICBUaGlzIG9wdGlvbiBlbmFibGVz
IG1lZGlhLXN0cmVhbSBzdXBwb3J0Lgo+ICAKPiAtLSAKPiAyLjI1LjEKPiAKCkNoZWVycywK4oCU
QWRyacOhbgo=

--MKOmyztc/CFLYyQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYa/LUAAKCRCRxVnb5MkS
OzAAAJwNKDrcfu7c27Ag2uObJATge1W5jwCaAzCCc8cUD60DonXAQnCgu3sOA+A=
=tiT+
-----END PGP SIGNATURE-----

--MKOmyztc/CFLYyQ2--

--===============1794550269306627207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1794550269306627207==--
