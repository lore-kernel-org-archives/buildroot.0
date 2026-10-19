Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47359606A326
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q9lLnMGA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0DDA605D9;
	Mon, 19 Oct 2026 17:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZMr_E2OTm9u; Mon, 19 Oct 2026 17:16:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C49BA606AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430177;
	b=BG4ic7QcSOwM1ncybCEQWeH5joqrenvT+2HJQ/WZxV1vvDQDRjObkCvwyJvlgsX4UivJ
	 A9fxl5eaVwnwXb3NJ60CNXNBMW0HA2eGf4N8ORrup1xBjI+ZGESGxGg0Zp1jiYyG6qrVN
	 uzlPkjRzNzNO3OKOTE9m+QHwYNn1j3FpXcl2A9m2FHB5QQyVpeK+/oqnql/vxBBTE0tVB
	 hRq6Dxx2X9r66rhDkRRa6dhjHB7eV3LFdK4Ex1p93+qDC0A4dJ4+pZhgUVoJYDoQXQ7Eq
	 f8gp8b6KP4HMHLVh6osOcaLOj+xBibhJvFj4XRIsdnz0FzwXsfkgKaJJ4w8kBcvHNVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430177;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tdtKRl0lwyQOCRQL3Sjwc7u7zGa9OTLpW1QhM5cdQYk=;
	b=GmUbFMjWxUlDV8iDI+HnbETyjk/bW6VmgYWbRi6ClT/N4X0WpoHHYvqwUNFoLdcglf05
	 SvyGAoc09Ke+FqH9ZR9EDbZ9oQFEKv/WyVDPozx2oiwIFAqby6GXTQE8ii2/4q070sfAI
	 Zn/5ktkah0P63f4bSoJ/r3o/etY4VHxK0w3OH3qQ0m/WB7QAAHlm4kjNeMACO0AJm6YCn
	 rfBi8dyRzl8vwyE3Uzpul76YalCHLDaWMFDPuuPU4VVXDYDLOyT5gEH6bCW37L/BERZ2x
	 /H/Wm49QbsnkSPBP+lSiW5FSbps0JfZie9xINn2HQpgIfyJ314rWHNO3ZQAZPqV/ViQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430177;
	bh=tdtKRl0lwyQOCRQL3Sjwc7u7zGa9OTLpW1QhM5cdQYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9lLnMGAknF1AShFzeuKyA64v0ROlfCbZGu5bdd7x4AQJ4FLYkQv7bSxSjVNnvbP5
	 rwVBHb6LpoTknz11sRHZm7QbUdWXvnp6BwBvIiXP6yFgpu2/lZBgTguSZUttk02Swm
	 ONLbKBRfrJeFTfr0T8mE4rsw/09inh/W5/OwGgjJCJNp5vT7RKeFLL/G5vmL2dTAJ9
	 p6dP/4rrqouQ71UKQzM/Yi9sIi19rpgNVOnjdjF/a4DHk2EQDf/KK2RVi6Ed+MlOG2
	 iZFNCANfkOWGF0pwqPUpOz6Autf4VloQ6xV/eBm47McbWy9FPxaJUiw/vNbpv3dPwk
	 TVpDFFXKlN36g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C49BA606AA;
	Mon, 19 Oct 2026 17:16:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 213E21E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 130816060C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZyuB4Tkyt4X for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:16:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 40FC2605D9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430174;
 b=E5SHBzSBud44FVLk2p+X1niz7Lj2RG/TnWB9dA5YN//fi6ct1L6SMtouq1pkrWBoMYp3
 WMAuRxrHYSujsPcXr0Z1rwKfvuVXWdqUdSY7Jk6L/k6lI0thHfa9fGeBnYDSPiINe8V3z
 0VnH1Ov6z0Vk1b34uS0yIt2NxdA/8prAvtU7GxSl+fvqmXOaSG2+C+oCtrgnTWBsDB/NG
 E6ndIEUy9Z0u6IWBl+PYMGmXU0Pw+8X3oho2mO/aqcp37XxMJuP4dyA148lo4WyXkyUhm
 wOSsc2ekqquwzZWJKUCuR0TVlikZo7w4Ki5novrPpZZiSrPeJP91kvS1Lq7rq26ss1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430174;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rbXzjfwqqYtGJwj2MtjsA4U7iobH0pdgXMaa1VGX3LQ=;
 b=GR4ogcYqPaJfHbAWQyWUz5Pkkxe6ItQwVqd5XnzcgJc1jTUJswNE0/p4i5rCsjO1XSpb
 UB2B2Yr7IpuQoGEaU5cFQZOJk45BxGITTqg1PUf76WKcTlaohez04UR748RV1/g49Uvzj
 L3BPs4u/rRU92RjFwFiaukuaB3n7Spxh48n05FHDqK96sT9MsEmwBq6klhdz1MfuwqwBX
 dpHrqVLqQh2dchDJNprltZRG6ORiMCfTDbYD6mDSQT2tRHHDv0VHEXl5RlRe67WAFjU9k
 /hI2jkTILSg8T/Y/38n84h7prH2jX+XaUWR8wTxnsrluGW+nrVzY+hVHozkIN59OSCw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40FC2605D9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:16:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9052E9876B; Mon, 19 Oct 2026 17:14:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b53c724eb25c32ba73e68e61219fc53f601b18f4
X-Git-Newrev: a8c315b62c0cda0045616bf81ac08ed09c343621
X-Patchwork-Hint: ignore
Message-Id: <20261019171451.9052E9876B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-snappy: bump version to
 0.7.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7947423375460000873=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7947423375460000873==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8c315b62c0cda0045616bf81ac08ed09c343621
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release on the
project homepage, hence the bump to 0.7.2.

The important change is that since 0.7.0, python-snappy uses
python-cramjam instead of nsappy.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               | 1 +
 package/python-snappy/Config.in          | 6 +-----
 package/python-snappy/python-snappy.hash | 4 ++--
 package/python-snappy/python-snappy.mk   | 7 ++++---
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb2d74b99f..2f10f855ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1146,6 +1146,7 @@ F:	support/testing/tests/package/test_python_pyroute2.py
 
 N:	Flaviu Nistor <flaviu.nistor@gmail.com>
 F:	package/python-cramjam/
+F:	package/python-snappy/
 
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
diff --git a/package/python-snappy/Config.in b/package/python-snappy/Config.in
index fd7f84050f..a0e8289680 100644
--- a/package/python-snappy/Config.in
+++ b/package/python-snappy/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_PYTHON_SNAPPY
 	bool "python-snappy"
-	depends on BR2_INSTALL_LIBSTDCPP # snappy
-	select BR2_PACKAGE_SNAPPY
+	select BR2_PACKAGE_PYTHON_CRAMJAM # runtime
 	help
 	  Python library for the snappy compression library from
 	  Google.
 
 	  http://github.com/andrix/python-snappy
-
-comment "python-snappy needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-snappy/python-snappy.hash b/package/python-snappy/python-snappy.hash
index c4dbc72077..2f40b6c531 100644
--- a/package/python-snappy/python-snappy.hash
+++ b/package/python-snappy/python-snappy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-snappy/json
-md5  fc84cfa3526fba06d66f0d0b2e764300  python-snappy-0.6.1.tar.gz
-sha256  b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a  python-snappy-0.6.1.tar.gz
+md5  04a4e58b0a932403bb285900e67c778d  python_snappy-0.7.2.tar.gz
+sha256  04bf182f9d9f67b7a846dae2f1df36180ceeee8d3380e4b6799deff5272c4978  python_snappy-0.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d007cb05f143d99d16d5cd0d1bf291daf037adb36800344e440ec26edb938f9a  LICENSE
diff --git a/package/python-snappy/python-snappy.mk b/package/python-snappy/python-snappy.mk
index e80aa861df..1b4b043f63 100644
--- a/package/python-snappy/python-snappy.mk
+++ b/package/python-snappy/python-snappy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SNAPPY_VERSION = 0.6.1
-PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
+PYTHON_SNAPPY_VERSION = 0.7.2
+PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
+PYTHON_SNAPPY_SITE = https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
 PYTHON_SNAPPY_SETUP_TYPE = setuptools
 PYTHON_SNAPPY_LICENSE = BSD-3-Clause
 PYTHON_SNAPPY_LICENSE_FILES = LICENSE
-PYTHON_SNAPPY_DEPENDENCIES = snappy
+PYTHON_SNAPPY_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))

--===============7947423375460000873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7947423375460000873==--
