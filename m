Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFE1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB7C160F59
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB7C160F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7862483658;
	Wed, 28 Jul 2021 21:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hmWaXd0qB7l; Wed, 28 Jul 2021 21:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A90982EBA;
	Wed, 28 Jul 2021 21:51:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12F6D1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022DD4062B
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRsU2OOc7ij2 for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 21:51:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3839404C1
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 21:51:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 24C5A89163; Wed, 28 Jul 2021 21:16:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 23:50:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bab8c1089983a4b5f0f2acfe5cad77b02d6f654
X-Git-Newrev: bbda38afbbfa79ff436e1a187bb267b8d9558036
X-Patchwork-Hint: ignore
Message-Id: <20210728211624.24C5A89163@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xml-security-c: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bbda38afbbfa79ff436e1a187bb267b8d9558036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for the Apache Santuario XML Security for C++ that
implementations the XML Digital Signature and Encryption
specifications.

Signed-off-by: Chris Simons <chris.simons@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...onf-variable-cache-option-for-getcwd-test.patch | 50 ++++++++++++++++++++++
 package/xml-security-c/Config.in                   | 16 +++++++
 package/xml-security-c/xml-security-c.hash         |  3 ++
 package/xml-security-c/xml-security-c.mk           | 21 +++++++++
 6 files changed, 92 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6533471736..cc830d4a2a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1834,6 +1834,7 @@ F:	package/valijson/
 F:	package/wpa_supplicant/
 F:	package/wireless_tools/
 F:	package/xen/
+F:	package/xml-security-c/
 F:	support/testing/tests/package/br2-external/openjdk/
 F:	support/testing/tests/package/test_openjdk.py
 F:	support/testing/tests/package/test_opkg/
diff --git a/package/Config.in b/package/Config.in
index 79b58facc3..adda6f5be9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1672,6 +1672,7 @@ menu "JSON/XML"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
 	source "package/xerces/Config.in"
+	source "package/xml-security-c/Config.in"
 	source "package/yajl/Config.in"
 	source "package/yaml-cpp/Config.in"
 endmenu
diff --git a/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch b/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
new file mode 100644
index 0000000000..26b53ba719
--- /dev/null
+++ b/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
@@ -0,0 +1,50 @@
+From 9d14fad412a497fe83cfc6ab594ddc612512f02a Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 4 Jun 2020 20:34:11 -0500
+Subject: [PATCH] autoconf variable cache option for getcwd test
+
+The cached variable allows cross compiled builds to successfully set the
+desired default for this value without invoking a test.
+
+Fixes:
+https://issues.apache.org/jira/browse/SANTUARIO-549
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ configure.ac | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b43d7a5..c3d4489 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,14 +74,18 @@ AC_CHECK_FUNCS([strcasecmp])
+ 
+ # Check whether getcwd can dynamically allocate memory.
+ AC_MSG_CHECKING([whether getcwd(NULL, 0) works])
+-AC_RUN_IFELSE([AC_LANG_PROGRAM([#include <stdlib.h>
+-     #include <unistd.h>],
+-[char *cwd = getcwd(NULL, 0);
+-return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;])],
+-     [AC_MSG_RESULT(yes)
+-      AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
+-         [Define to 1 if getcwd(NULL, 0) works])],
+-     [AC_MSG_RESULT(no)])
++AC_CACHE_VAL([xml_cv_func_getcwd_null],
++[AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>
++     #include <unistd.h>
++     char *cwd = getcwd(NULL, 0);
++     return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;]])],
++  [xml_cv_func_getcwd_null=yes],
++  [xml_cv_func_getcwd_null=no])])
++AC_MSG_RESULT([$xml_cv_func_getcwd_null])
++if test $xml_cv_func_getcwd_null = yes; then
++AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
++  [Define to 1 if getcwd(NULL, 0) works])
++fi
+ 
+ AC_LANG(C++)
+ 
+-- 
+2.17.1
+
diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
new file mode 100644
index 0000000000..4c01855292
--- /dev/null
+++ b/package/xml-security-c/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_XML_SECURITY_C
+	bool "xml-security-c"
+	depends on BR2_INSTALL_LIBSTDCPP # xerces
+	depends on BR2_USE_WCHAR # xerces
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XERCES
+	help
+	  The xml-security-c library is a C++ implementation of
+	  the XML Digital Signature and Encryption specifications.
+
+	  https://santuario.apache.org/cindex.html
+
+comment "xml-security-c needs a toolchain w/ C++, wchar, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR ||
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/xml-security-c/xml-security-c.hash b/package/xml-security-c/xml-security-c.hash
new file mode 100644
index 0000000000..d91ed86e9c
--- /dev/null
+++ b/package/xml-security-c/xml-security-c.hash
@@ -0,0 +1,3 @@
+# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.2.tar.gz.sha256
+sha256  c303a2b08cb9ca0f5594adcbb83829b1e793175d7114a82f7d78def8bb2e30df  xml-security-c-2.0.2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/xml-security-c/xml-security-c.mk b/package/xml-security-c/xml-security-c.mk
new file mode 100644
index 0000000000..fe761819ee
--- /dev/null
+++ b/package/xml-security-c/xml-security-c.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# xml-security-c
+#
+################################################################################
+
+XML_SECURITY_C_VERSION = 2.0.2
+XML_SECURITY_C_SITE = http://archive.apache.org/dist/santuario/c-library
+XML_SECURITY_C_LICENSE = Apache-2.0
+XML_SECURITY_C_LICENSE_FILES = LICENSE.txt
+XML_SECURITY_C_DEPENDENCIES = openssl xerces
+XML_SECURITY_C_INSTALL_STAGING = YES
+
+XML_SECURITY_C_CONF_ENV = \
+	xml_cv_func_getcwd_null=yes \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+# Patched configure.ac
+XML_SECURITY_C_AUTORECONF = YES
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
