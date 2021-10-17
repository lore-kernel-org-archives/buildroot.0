Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C22C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 18:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2744C60F70
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 18:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2744C60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE6E80EC8;
	Sun, 17 Oct 2021 18:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsH_xyUFBas1; Sun, 17 Oct 2021 18:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D5DE80E73;
	Sun, 17 Oct 2021 18:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8862D1BF352
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 18:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7215E605AD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 18:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ieTKKAxpc_J9 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 18:09:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3FA6605A6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 18:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=4cxLCPf0FqNnSG7uMR7YVnjimQnX4qCXtiHYIeiv+iU=; 
 b=h//6sqor1yblCAT32CaQSZ8e6r9z+cuJ+x3mqPLGUdoIj1mKOM4U3yNUjBWfp9wAQu2JMjGUWw0h1VHPg64VUdu3lacPD3ZQUgVDZWxDqp7EPmTb3bygcI6yc3/SU+9M4vC5UBUw13vkze6pMyo/QSwFHOFcPOTwlRcnk4J8MIrG0PweeKEXAkgTHo3HzF7FBem2OHaolOjeVnUyAHFRRdzAataE0lD5j5Ugkrl48B5dtdObjFaT/Xx3qKAngmwNQT4WfmpAeKFcjB0ZJFLoe7+obBFS+LG7ruakmX1KRdN/RNbNZUdI/H2pcjiUV90sOcOMsZEyCWfSiROlPdxkiw==;
Received: from 91-152-140-142.elisa-laajakaista.fi ([91.152.140.142]
 helo=momiji) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mcAb9-0003LM-9A; Sun, 17 Oct 2021 20:09:27 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 2d69f119;
 Sun, 17 Oct 2021 18:09:15 +0000 (UTC)
Date: Sun, 17 Oct 2021 20:09:15 +0200
Message-ID: <20211017200915.GC2555@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Adam Duskett <aduskett@gmail.com>
In-Reply-To: <20211015003909.2009551-1-aduskett@gmail.com>
References: <20211015003909.2009551-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: depend on
 host-python3
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
Cc: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4230719097022680823=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4230719097022680823==
Content-Type: multipart/signed; boundary="wkBj8XWtHVn/XFhI"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--wkBj8XWtHVn/XFhI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVGh1LCAxNCBPY3QgMjAyMSAxNzozOTowOSAtMDcwMCBBZGFtIER1c2tldHQgPGFkdXNrZXR0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gd2Via2l0Z3RrIGJ1aWxkcyB3aXRob3V0IGlzc3VlIHVzaW5n
IGhvc3QtcHl0aG9uMy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkdXNrZXR0
QGdtYWlsLmNvbT4KCkFja2VkLUJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdh
bGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayBiL3BhY2thZ2Uvd2Via2l0
Z3RrL3dlYmtpdGd0ay5tawo+IGluZGV4IDg3YWVmZmVhNDUuLmEzZGIyNDlhZTYgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gKysrIGIvcGFja2FnZS93ZWJr
aXRndGsvd2Via2l0Z3RrLm1rCj4gQEAgLTEzLDcgKzEzLDcgQEAgV0VCS0lUR1RLX0xJQ0VOU0Vf
RklMRVMgPSBcCj4gIAlTb3VyY2UvV2ViQ29yZS9MSUNFTlNFLUFQUExFIFwKPiAgCVNvdXJjZS9X
ZWJDb3JlL0xJQ0VOU0UtTEdQTC0yLjEKPiAgV0VCS0lUR1RLX0NQRV9JRF9WRU5ET1IgPSB3ZWJr
aXRndGsKPiAtV0VCS0lUR1RLX0RFUEVOREVOQ0lFUyA9IGhvc3QtcnVieSBob3N0LXB5dGhvbiBo
b3N0LWdwZXJmIFwKPiArV0VCS0lUR1RLX0RFUEVOREVOQ0lFUyA9IGhvc3QtcnVieSBob3N0LXB5
dGhvbjMgaG9zdC1ncGVyZiBcCj4gIAllbmNoYW50IGhhcmZidXp6IGljdSBqcGVnIGxpYmdjcnlw
dCBsaWJndGszIGxpYnNlY3JldCBsaWJzb3VwIFwKPiAgCWxpYnRhc24xIGxpYnhtbDIgbGlieHNs
dCBvcGVuanBlZyBzcWxpdGUgd2VicCB3b2ZmMgo+ICBXRUJLSVRHVEtfQ09ORl9PUFRTID0gXAo+
IC0tIAo+IDIuMzAuMgo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--wkBj8XWtHVn/XFhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYWxmywAKCRCRxVnb5MkS
O4aCAJ9uyhYduZ2Gaca933SgFRvfayPQQQCaAq0z4v9I5+h2oQTx1075n1T7BFY=
=ydMU
-----END PGP SIGNATURE-----

--wkBj8XWtHVn/XFhI--

--===============4230719097022680823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4230719097022680823==--
