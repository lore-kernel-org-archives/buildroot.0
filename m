Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D10C48291
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 15:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 608F984CFB;
	Fri,  2 Feb 2024 15:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 608F984CFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01g9Z2jxNFns; Fri,  2 Feb 2024 15:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8AEB84CF9;
	Fri,  2 Feb 2024 15:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8AEB84CF9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39ACE1BF2CB
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 15:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1215742656
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 15:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1215742656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9Z6tyVG43cL for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 15:56:18 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90ABD42597
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 15:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90ABD42597
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8C16135351D9; Fri,  2 Feb 2024 16:56:14 +0100 (CET)
Date: Fri, 2 Feb 2024 16:56:14 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zb0Qnnauhkwtp8Q0@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1706889374; bh=uAh3NVhgB7Su27yTDveu8E26vAkDgE8d1NEjrTBC6LQ=;
 h=Date:From:To:Subject:From;
 b=YNUnDljgEiaznsB4uNOzfv/BlDSlz6XrBmJfLPMzsgH/T7dahZd7b+uyf8Odqct/T
 KjAMQTPjSswkwtRBhqwqPg92vdOWyz7Z09UwuMxY+0UUn3KddEx0Zwjg9dIklXY2eY
 o5X/r2KsddL1PgTZYfYVcAfTQeC2azB8M8oZDUlu498fR8pm1eunxdICfemESd9WKq
 dgA6/j22TP43zKavUamR87stfGcSCORbU4dCUWjNc6qMOxo3lR55mSIWHv4ft17uoB
 wmHFE/QAo/Qy9bOs2QKJe6osTBRXumMEAVXJDlH7dnOytbAze/qvpXOq6ALI+d+06q
 5ySx+JoWekx5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=YNUnDljg
Subject: [Buildroot] [PATCH 1/2 v2] package/libjwt: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

JSON Web Tokens are an open, industry standard RFC 7519
method for representing claims securely between two parties.

This Library is used by Asterisk 20.6.0 and newer.
We need to use autotools to install pkgconfig file.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/Config.in          |  1 +
 package/libjwt/Config.in   |  9 +++++++++
 package/libjwt/libjwt.hash |  3 +++
 package/libjwt/libjwt.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/libjwt/Config.in
 create mode 100644 package/libjwt/libjwt.hash
 create mode 100644 package/libjwt/libjwt.mk

diff --git a/package/Config.in b/package/Config.in
index 426bd7d090..75a94177eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1846,6 +1846,7 @@ menu "JSON/XML"
 	source "package/libbson/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
+	source "package/libjwt/Config.in"
 	source "package/libroxml/Config.in"
 	source "package/libucl/Config.in"
 	source "package/libxml2/Config.in"
diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
new file mode 100644
index 0000000000..d6bca54adc
--- /dev/null
+++ b/package/libjwt/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBJWT
+	bool "libjwt"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_JANSSON
+	help
+	  JSON Web Tokens are an open, industry standard RFC 7519 
+	  method for representing claims securely between two parties.
+
+	  https://github.com/benmcollins/libjwt
diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
new file mode 100644
index 0000000000..2235fa3f99
--- /dev/null
+++ b/package/libjwt/libjwt.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  cb2fd95123689e7d209a3a8c060e02f68341c9a5ded524c0cd881a8cd20d711f  libjwt-1.15.3.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
new file mode 100644
index 0000000000..f7be28d206
--- /dev/null
+++ b/package/libjwt/libjwt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libjwt
+#
+################################################################################
+
+LIBJWT_VERSION = 1.15.3
+LIBJWT_SITE = $(call github,benmcollins,libjwt,v$(LIBJWT_VERSION))
+LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.gz
+LIBJWT_DEPENDENCIES = jansson openssl
+LIBJWT_AUTORECONF = YES
+LIBJWT_INSTALL_STAGING = YES
+LIBJWT_LICENSE = MPL-2.0
+LIBJWT_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
