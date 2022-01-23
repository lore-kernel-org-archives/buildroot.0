Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BD6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 21:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60D560DA0;
	Sun, 23 Jan 2022 21:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brvFFN4OXGpH; Sun, 23 Jan 2022 21:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E887160D79;
	Sun, 23 Jan 2022 21:29:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 896001BF97A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8655340289
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWqWtsHs-p0k for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 21:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D5A240282
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 21:29:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s18so10100076wrv.7
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 13:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yR879uWm+EHiCz7bwCYQfqBsGHa6kCoXoHM1DfJ/M/I=;
 b=VoyWqsfViRdhGP+TlkI7hyjYt1OB6HBFZiF7UVzthqfPtccU+dQB5nUOtwbxtdaqkr
 0heefxCyk2fzQ80MGAocmicSvdsJ/CE7jJMTPA2r2Uv6xx2XQftApMTDwIFf9CKCRNiW
 7zD2RiD6HsYA6eaGiFvy/tWK8EJHZyTPgXRG1Agzinj2bOvVU/lhVAjYnOV1bMuszvxJ
 XLIkRdffpPVVJHUwX5ETGPf4VK+HYFHmxum1lWS1frT4C+A1Rosr7nDb/XI6AJz4n0/j
 KeCSLqiyWgnYpr8miFuYC3H+k5zp/6z812/5q+1jlTa5DD5SRtlm03T7ls5XlWcO9cww
 elaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yR879uWm+EHiCz7bwCYQfqBsGHa6kCoXoHM1DfJ/M/I=;
 b=E4vFNfWO8/ni0pPqUXqzQTW1nNMXG51dslqWc5cHNYIJpmIc8ZRLRkTdJ+IWWjYxv5
 dZYnIYwAgCUrJ0LBejkfIncGSEv7bgM1w+akfSrfPhmqss+ayOO8k9/os2rgvvdlxwvi
 N7Lst8naeR1Ji5EVRPvVBYmdSQb+cKxdjEDTwXiV+8KTLk5a6JIu97bW/UE5izyIwpz/
 esDnXJBLtaMW1k4iOVFfJPfo/vTbnfZPSQ2QpdK4wnSxoURmfyzXFBXxrJrUOi0SWUwb
 Pb0h+G6RnVFTnM2Azy9VWmuxafM1aw1LsyCYDbQe4fCa912NZxd60kcd8dL+CLyv8S0Y
 zNLw==
X-Gm-Message-State: AOAM5303prbMIquv3GqUF51knOZ8EPX6nkiRMVMhwzCbU2n3jRPZk5pq
 WImuSC5mBd1ZBTLjvQCEWHlp4GxaHrc=
X-Google-Smtp-Source: ABdhPJw3r0yr948toKrmOV8HOsRF7nUDI7Jic3HDX6Cp7x3EZiDvStPOI4gg3KtBSrnRap6alyqUAA==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr11863040wrf.431.1642973375437; 
 Sun, 23 Jan 2022 13:29:35 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id y2sm16555867wmj.13.2022.01.23.13.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 13:29:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 22:27:57 +0100
Message-Id: <20220123212757.781999-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xml-security-c: bump to version
 2.0.4
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.0.4 of the Apache XML Security for C++ has been released,
correcting support for OpenSSL earlier than 1.1.

Version 2.0.3 of the Apache XML Security for C++ has been released,
adding support for OpenSSL 3.0.0.

Drop patch (already in version) and so autoreconf

https://santuario.apache.org/cindex.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ariable-cache-option-for-getcwd-test.patch | 50 -------------------
 package/xml-security-c/xml-security-c.hash    |  4 +-
 package/xml-security-c/xml-security-c.mk      |  5 +-
 3 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch

diff --git a/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch b/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
deleted file mode 100644
index 26b53ba719..0000000000
--- a/package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 9d14fad412a497fe83cfc6ab594ddc612512f02a Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Thu, 4 Jun 2020 20:34:11 -0500
-Subject: [PATCH] autoconf variable cache option for getcwd test
-
-The cached variable allows cross compiled builds to successfully set the
-desired default for this value without invoking a test.
-
-Fixes:
-https://issues.apache.org/jira/browse/SANTUARIO-549
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- configure.ac | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b43d7a5..c3d4489 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -74,14 +74,18 @@ AC_CHECK_FUNCS([strcasecmp])
- 
- # Check whether getcwd can dynamically allocate memory.
- AC_MSG_CHECKING([whether getcwd(NULL, 0) works])
--AC_RUN_IFELSE([AC_LANG_PROGRAM([#include <stdlib.h>
--     #include <unistd.h>],
--[char *cwd = getcwd(NULL, 0);
--return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;])],
--     [AC_MSG_RESULT(yes)
--      AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
--         [Define to 1 if getcwd(NULL, 0) works])],
--     [AC_MSG_RESULT(no)])
-+AC_CACHE_VAL([xml_cv_func_getcwd_null],
-+[AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <stdlib.h>
-+     #include <unistd.h>
-+     char *cwd = getcwd(NULL, 0);
-+     return (cwd != NULL) ? EXIT_SUCCESS : EXIT_FAILURE;]])],
-+  [xml_cv_func_getcwd_null=yes],
-+  [xml_cv_func_getcwd_null=no])])
-+AC_MSG_RESULT([$xml_cv_func_getcwd_null])
-+if test $xml_cv_func_getcwd_null = yes; then
-+AC_DEFINE([XSEC_HAVE_GETCWD_DYN], [1],
-+  [Define to 1 if getcwd(NULL, 0) works])
-+fi
- 
- AC_LANG(C++)
- 
--- 
-2.17.1
-
diff --git a/package/xml-security-c/xml-security-c.hash b/package/xml-security-c/xml-security-c.hash
index d91ed86e9c..f4b7041a63 100644
--- a/package/xml-security-c/xml-security-c.hash
+++ b/package/xml-security-c/xml-security-c.hash
@@ -1,3 +1,3 @@
-# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.2.tar.gz.sha256
-sha256  c303a2b08cb9ca0f5594adcbb83829b1e793175d7114a82f7d78def8bb2e30df  xml-security-c-2.0.2.tar.gz
+# From http://www.apache.org/dist/santuario/c-library/xml-security-c-2.0.4.tar.gz.sha256
+sha256  a78da6720f6c2ba14100d2426131e0d33eac5a2dba5cc11bdd04974b7eb89003  xml-security-c-2.0.4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/xml-security-c/xml-security-c.mk b/package/xml-security-c/xml-security-c.mk
index fe761819ee..fda9af4798 100644
--- a/package/xml-security-c/xml-security-c.mk
+++ b/package/xml-security-c/xml-security-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XML_SECURITY_C_VERSION = 2.0.2
+XML_SECURITY_C_VERSION = 2.0.4
 XML_SECURITY_C_SITE = http://archive.apache.org/dist/santuario/c-library
 XML_SECURITY_C_LICENSE = Apache-2.0
 XML_SECURITY_C_LICENSE_FILES = LICENSE.txt
@@ -15,7 +15,4 @@ XML_SECURITY_C_CONF_ENV = \
 	xml_cv_func_getcwd_null=yes \
 	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
-# Patched configure.ac
-XML_SECURITY_C_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
