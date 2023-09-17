Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53817CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 21:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA1BA405D0;
	Sun, 17 Sep 2023 21:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA1BA405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBMx0OsUM1-I; Sun, 17 Sep 2023 21:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22A004118A;
	Sun, 17 Sep 2023 21:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A004118A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D28EA1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 21:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8160817AC
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 21:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8160817AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8IXqrHW9Mrbb for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 21:05:27 +0000 (UTC)
Received: from mail.light-speed.de (mail.light-speed.de
 [IPv6:2a01:238:43f2:8900:dd04:e3a0:ee11:a73d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A0EA81501
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0EA81501
Received: from bilbo.fritz.box (ip5f5a8b4a.dynamic.kabel-deutschland.de
 [95.90.139.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.light-speed.de (Postfix) with ESMTPSA id 7855A3D4246F;
 Sun, 17 Sep 2023 23:05:24 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 23:05:23 +0200
Message-Id: <20230917210523.1577198-1-mail@jens-maus.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jens-maus.de; s=mail; t=1694984724;
 bh=Ewn33+WPJexN4HnDubynedylPJQDbkA4IhjGRMdhhgU=;
 h=From:To:Cc:Subject:Date;
 b=nbZ4ASGYpvH81Zex7CHPeEVmgvsID6OjlZqRhH4MgY4Z5+0DqkFIjmhvHyd5xzV1+
 Wv5KO7F2Urw4qjls7XKXRIvvUTOLm2eTcXtneQ6I+KJCGMNHoaH5+86dtuAXqrlTvH
 tpPhXcM2RD7CDGHhbHJ/GsQ04qAJlRLQSLu8sWuk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=jens-maus.de header.i=@jens-maus.de
 header.a=rsa-sha256 header.s=mail header.b=nbZ4ASGY
Subject: [Buildroot] [PATCH 1/1] package/monit: update to 5.33.0
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
From: Jens Maus via buildroot <buildroot@buildroot.org>
Reply-To: Jens Maus <mail@jens-maus.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit updates monit to the latest 5.33.0 version which also
requires some additional patch to configure as well as enabled ipv6
support.

Signed-off-by: Jens Maus <mail@jens-maus.de>
---
 package/monit/0002-configure-fixes.patch | 24 ++++++++++++++++++++++++
 package/monit/monit.hash                 |  4 ++--
 package/monit/monit.mk                   |  8 +++++---
 3 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 package/monit/0002-configure-fixes.patch

diff --git a/package/monit/0002-configure-fixes.patch b/package/monit/0002-configure-fixes.patch
new file mode 100644
index 0000000000..74698e9927
--- /dev/null
+++ b/package/monit/0002-configure-fixes.patch
@@ -0,0 +1,24 @@
+diff -ruN monit-5.29.0.orig/configure.ac monit-5.29.0/configure.ac
+--- monit-5.29.0.orig/configure.ac	2021-08-24 18:15:35.000000000 +0200
++++ monit-5.29.0/configure.ac	2021-11-20 10:34:31.074783265 +0100
+@@ -8,7 +8,7 @@
+ # Example: 5.0_beta2
+ AC_INIT([monit], [5.29.0], [monit-general@nongnu.org])
+ AC_CONFIG_AUX_DIR(config)
+-AC_CONFIG_MACRO_DIR([m4])
++AC_CONFIG_MACRO_DIRS([m4 config])
+ AM_INIT_AUTOMAKE
+ AC_CONFIG_SRCDIR([src/monit.c])
+ AC_CONFIG_SUBDIRS([libmonit])
+diff -ruN monit-5.29.0.orig/libmonit/configure.ac monit-5.29.0/libmonit/configure.ac
+--- monit-5.29.0.orig/libmonit/configure.ac	2021-08-24 18:15:35.000000000 +0200
++++ monit-5.29.0/libmonit/configure.ac	2021-11-20 10:34:54.123439163 +0100
+@@ -4,7 +4,7 @@
+ 
+ AC_INIT([libmonit], [1.0], [monit-dev@tildeslash.com])
+ AC_CONFIG_AUX_DIR(config)
+-AC_CONFIG_MACRO_DIR([m4])
++AC_CONFIG_MACRO_DIRS([m4 config])
+ AM_INIT_AUTOMAKE
+ AC_CONFIG_SRCDIR([src])
+ 
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 26d665c083..1d9feca57b 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.26.0.tar.gz.sha256:
-sha256  87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2  monit-5.26.0.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.33.0.tar.gz.sha256
+sha256  1ace889c0183473a9d70160df6533bb6e1338dc1354f5928507803e1e2a863b5  monit-5.33.0.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 6d5d475813..69db62d711 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,26 +4,28 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.26.0
+MONIT_VERSION = 5.33.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 MONIT_CPE_ID_VENDOR = mmonit
 MONIT_SELINUX_MODULES = monit
+
 #
 # Touching Makefile.am:
 MONIT_AUTORECONF = YES
 
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
-	libmonit_cv_vsnprintf_c99_conformant=yes
+	libmonit_cv_vsnprintf_c99_conformant=yes \
+	ac_cv_ipv6=yes
 
 MONIT_CONF_OPTS += \
 	--without-pam \
 	--with-largefiles
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONIT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
+MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
 MONIT_DEPENDENCIES += openssl
 else
 MONIT_CONF_OPTS += --without-ssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
