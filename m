Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA18CA6004
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F73403D3;
	Tue,  6 Oct 2026 16:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAJtzjY6SKFC; Tue,  6 Oct 2026 16:25:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D5DE7405AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791303915;
	b=YGu/8QdQL0J3j1h01uPVl5eQj5mqD5lMkHTr0ut5mnIgMWVPiuZwKWLI+EH3DHGbhiqW
	 QGOBC/dSKuaavSyf1VZ+jTjI4ugjBCgu0CVJ4CW/S5cgeaqln6C23FXn+8EVlx/LojtK/
	 3ahniwR7JWov9iK95dOUywaoJeuxtjvdpIc7Tv3FByu2v4+UBGwpaUT27Lml0J1s0InJw
	 +rG073HJCXEo/y0DZGi8X/HU+IGJS+gaK/0YW2U5yndwFrX6AFxF00oQ2fXmN64iJgGT6
	 v7nfzrSJTLgpOV84yxh6QP08DgGUQhVO8I1yVf5rCNryYjAyDJLiZ0MMLLQQUrqMHeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791303915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g5l0conIgOptPru1lyyyT5aV7SfJTY6+r6+Fdl7pcW4=;
	b=pQ/FQK/Zt47xvvtm3POQSUj89WgJAQl3FBEV0Ir187W1gETlSTbYhgY7P0/V15tjHPgy
	 1ckC40kJjYmWPPr7PzxaOsj/0YytTG12WvrKtrABdtadltnnx3NroGb/H9osgcuSWLLzz
	 qyvZGXGuOMaGDi343iaHo2xhqA0n/ZZ5EL8B4I+a/jTuoeZyqRKxlh8kCS2oJAGf4KVDg
	 9PrsFOHwLimRCsDw0ffbedH+2q/XFnqriM7m+Ee67/5vSAptVHqIF1kB3DMB1g6EO3bnO
	 OV/8FjtHcE5DiN7Anu3/6W05rDxHXabI/o+dsdiZusugE+2WzAQ3GZ+G25CcT0papjA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791303914;
	bh=g5l0conIgOptPru1lyyyT5aV7SfJTY6+r6+Fdl7pcW4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PyiAASpVAGCNn7iRxOgD2Tmw93NJH4TV4Ra2CPMXMIMDe00jJUPF/mfgIo4oRrrJO
	 f21yyR3XvSEg/T6xwpM/IjroX3AeJZxTLWq1EYP9TTYolX2xgoKvAfYGMo3HDvwQtf
	 9ZDHg6/zFBs+0zquNcEi07mJ8K+9nY6+j9ygwfOPwi+bvkMPQGJt0foyBvBSAgq3eR
	 AKdMGtodtAQuy8SqgottalNew7YnoR5EJBjAOVlItPF6LaelO9ICCNCTQ8WRgXVxdy
	 vDahnW0r7w/5WaZWmnFTffG2/2k9tm2Rpm0JgL66epiLvG15AsYHFN1Hvy7SNlCu1h
	 otSPYQyWYJ6hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5DE7405AB;
	Tue,  6 Oct 2026 16:25:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB6FB34E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD87040274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvRaV719DYmZ for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:21:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D546F4009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303700;
 b=nXNVIk3G1PNtWsk5ykbrmACsMOdUelcGSwQsuH6ye9ye2qmhAKAXeuS2L2/Si1Rn51zQ
 Pi+S5EK3HTNUxBg0tjYIM3mtVN+z5nGRXrto0SPpxvCvTbQH5sV/WU6uuLC101MPc5nAB
 rFlo8ya2zuBq2ZiJl6X5orU3dlk4DGeORG0loer2ILh7gO76LgnqCHRwitdeb6J7cET21
 IQh/gvY5zV37lRpXgxIHt9pWt+5jIqFQ58R/gGpZYbDHz1OJLixmL3S3SbTH5nyDuptEr
 N6NFPMUMnpdn3fsEYr5yAOXpngTYbXMlt2hiMH+x0WkPEXF6zg4IwPpUF7tPw6egTgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303700;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=kQBEe36vnb8lzoH5COYz6nAVe0Z8zIzxbL/E7tXkNYE=;
 b=eIvf0vF0QqXVWvEPDIzQKttxFZhtPMg/55hLXYX+eaB1vGwVy5+hEN6UOKsjlq0H31va
 DGVT66MDQOEGaKNWBoOY4I9cOIu9TVsOixM8kr4ZGl1gFilRp7ahyp3jIIf7e9Y7nlA8n
 tJVUjNTuIHfgS3sODqd6xLpWmBpKngJVttl2L4RwjMEXd00kVU5HuxXuVJq+4IMr0WVSq
 0ipIjjB09i8s7Pg4oIWsdHV0RbtnVTEaDMVJkxmNFrvac458ioeH1xQzGDeuplFUfr+cu
 UOctGjitOeHHRyZyN2YefHgnfwDQu+Rnk3RCmJxHVNCQdhl1mgCfS/UCzdEwPY6LrIg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Eq24F2M/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Eq24F2M/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D546F4009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303670;
 bh=kQBEe36vnb8lzoH5COYz6nAVe0Z8zIzxbL/E7tXkNYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Eq24F2M/YfLq/t2jbKOD+v6VBeJWCjInODIEHaGcF/4nebroXTKcq5A6QxHCuGII5
 4bcff7Ri1DKKUVsjXSG+8e7LfZGYTuNZ/ZyYER23bFt9zAY18SiWBfTPBD1s34F1u3
 XCCUpktmatpY6oTLaXdzeOPUqy+qEz/qn5mRI+SWMJ4mFuxvi7pI7MYUODdj95/k5b
 lZRbk5Gq0h47D8mymbmXoz9L4Sh72dvC7CVqWAIKfQeyyjCLaFdUvDDPieemcff5/7
 Tqp0JMZfsM+3p8/qK3JqgPEdwWallMo8c2Fk6DtderNzIYBzCDLFSd74x3P41yHZM1
 wqB7HF17GeWaA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 TFpMCzOkzzeiPwgJlSTEZUSM9GydT2QhkrxNryJWk2cw8aUesyz31+J9pyIJ9RJg6DDlStxIKbr
 B4FnEFpEcMXTHZfBto9UNkagDVzsa+L/V12qaNg6/3aFeuKi+h4FIbErp/I9kDiXCNaRLBwudai
 cGxuTWOwfWn1nmBtmhVwl6HbE8NO7/enNyQq7l1/vjN5DtlBcGDDKAXX9P9BuiccCbIOValJPy3
 Q3BID3JgOTOkd6Lrn5Xyfm6pXEwiXp/1hNniGS8DjbHuSp0tc2mCnxYvFbnfabfQjNwljVeTcoK
 ynnKyIza0M6it0ZBSjI0iZm5OCGa4shu2ZmdA6ZEp4Syb8Crqrw9MyNQmN5Icg7VDpdcDHAsK0R
 2ygpqToTxoTmzc9XNVKOCHFUryS/kDZZqjb/8zAh1pXerFD0owiHvFyoU+S88VPSqc/V+vE9IkA
 JwKTekwU6FESNIT1Pu+Zjh0nd8nOmTnkO3dHlIIt2WIeF1gq1h9ptPT80nsM51j3WxMttoIIPnq
 KwD8qBpX5cBuXGDhIicaKbMhQ6Do8xTfweytmisnT/1AhgYN0q9DgEaqJ8bvEw5+5uPDY5WgQTY
 mv1pnw==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 35D58A4C42FC;
 Tue,  6 Oct 2026 18:21:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ug-000000000ir-0Ia7;
 Tue, 06 Oct 2026 16:21:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:19:43 +0200
Message-ID: <20261006162106.3439373-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 02/84] package/qt5/qt5opcua: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build is broken with the upcoming bump of OpenSSL to 4.0.3:

x509/openssl_symbols.cpp: In function 'QDateTime q_getTimeFromASN1(const ASN1_TIME*)':
x509/openssl_symbols.cpp:1244:31: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1244 |     size_t lTimeLength = aTime->length;

x509/openssl_symbols.cpp:1245:35: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1245 |     char *pString = (char *) aTime->data;

x509/openssl_symbols.cpp:1247:14: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1247 |     if (aTime->type == V_ASN1_UTCTIME) {

x509/openssl_symbols.cpp:1307:21: error: invalid use of incomplete type 'const ASN1_TIME' {aka 'const struct asn1_string_st'}
 1307 |     } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {

and mbed TLS since it was bumped from 2.28.10 to 3.6.3.1 with buildroot
commit 3481a9643fc7223e400ed877f08ade34d44e6b78 as seen by the
autobuilders.

The last release of the 5.x series dates back to 2020:
https://github.com/qt/qtopcua/releases/tag/v5.15.2

Fixes:
https://autobuild.buildroot.net/results/1f0/1f06b1efdde65fcd99ff79a63ed01b749788dec8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andreas Naumann <dev@andin.de>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  1 -
 package/qt5/Config.in              |  1 -
 package/qt5/qt5opcua/Config.in     |  9 ---------
 package/qt5/qt5opcua/qt5opcua.hash | 10 ----------
 package/qt5/qt5opcua/qt5opcua.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 package/qt5/qt5opcua/Config.in
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.hash
 delete mode 100644 package/qt5/qt5opcua/qt5opcua.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0c248095e5..dd40ff4357 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_QT5OPCUA
+	bool "qt5opcua has been removed"
+	select BR2_LEGACY
+	help
+	  The qt5opcua package has been removed because it is
+	  incompatible with OpenSSL >= 4.x and mbed TLS 3.x
+
 config BR2_PACKAGE_QT5KNX
 	bool "qt5knx has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 47cda03a86..8b29542988 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -203,7 +203,6 @@ N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
-F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
 N:	Andreas Ziegler <br025@umbiko.net>
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b837601dc6..8b4903a5ab 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -48,7 +48,6 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
-source "package/qt5/qt5opcua/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
 source "package/qt5/qt5quicktimeline/Config.in"
diff --git a/package/qt5/qt5opcua/Config.in b/package/qt5/qt5opcua/Config.in
deleted file mode 100644
index 2b0ba37af3..0000000000
--- a/package/qt5/qt5opcua/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_QT5OPCUA
-	bool "qt5opcua"
-	depends on BR2_PACKAGE_QT5
-	help
-	  Qt is a cross-platform application and UI framework for
-	  developers using C++.
-
-	  The Qt OPC UA module implements a Qt API to interact with
-	  OPC UA on top of a 3rd party OPC UA stack.
diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
deleted file mode 100644
index a325653f80..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.hash
+++ /dev/null
@@ -1,10 +0,0 @@
-# Hash locally calculated
-sha256  fa8e0e87aae6f321aecac2605e6ac1b858ba1ed4db3c4a78a193eb7b547ab224  qt5opcua-5.15.2-git4.tar.gz
-
-# Hashes for license files:
-sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
-sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
-sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
-sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
-sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
deleted file mode 100644
index ef51abddf8..0000000000
--- a/package/qt5/qt5opcua/qt5opcua.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# qt5opcua
-#
-################################################################################
-
-QT5OPCUA_VERSION = 5.15.2
-QT5OPCUA_SITE = https://code.qt.io/qt/qtopcua.git
-QT5OPCUA_SITE_METHOD = git
-QT5OPCUA_INSTALL_STAGING = YES
-QT5OPCUA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs) CC0-1.0
-QT5OPCUA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL LICENSE-CC0
-QT5OPCUA_SYNC_QT_HEADERS = YES
-
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-QT5OPCUA_DEPENDENCIES += mbedtls
-endif
-
-$(eval $(qmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
