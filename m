Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226C1C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9573404B9;
	Wed, 27 Jul 2022 10:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9573404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rp0GJ0VCEePP; Wed, 27 Jul 2022 10:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A63FD40260;
	Wed, 27 Jul 2022 10:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63FD40260
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6D21BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48DB380BDD
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DB380BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRWnZVecaay7 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:48:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B71A80BAE
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B71A80BAE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 57725865BD; Wed, 27 Jul 2022 10:34:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:14:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe522b9c17f2579a3c698354aa326962311053f2
X-Git-Newrev: 49b8fad29c65971f97bb81a7b7c4a1fda7276df4
X-Patchwork-Hint: ignore
Message-Id: <20220727103457.57725865BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sconeserver: reorder options
 alphabetically
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49b8fad29c65971f97bb81a7b7c4a1fda7276df4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sconeserver/Config.in      | 42 +++++++++++++++++++-------------------
 package/sconeserver/sconeserver.mk | 42 +++++++++++++++++++-------------------
 2 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index d46ba85fbc..4ade8b4590 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -15,24 +15,6 @@ if BR2_PACKAGE_SCONESERVER
 
 comment "Sconeserver modules"
 
-config BR2_PACKAGE_SCONESERVER_EXAMPLES
-	bool "examples"
-	help
-	  Example modules for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
-	bool "http::sconesite"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  http::sconesite module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_MYSQL
-	bool "mysql"
-	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MYSQL
-	help
-	  MySQL module for Sconeserver
-
 config BR2_PACKAGE_SCONESERVER_BLUETOOTH
 	bool "bluetooth"
 	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
@@ -51,11 +33,16 @@ comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library,
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
-config BR2_PACKAGE_SCONESERVER_RSS
-	bool "rss"
+config BR2_PACKAGE_SCONESERVER_EXAMPLES
+	bool "examples"
+	help
+	  Example modules for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
+	bool "http::sconesite"
 	select BR2_PACKAGE_LIBXML2
 	help
-	  RSS module for Sconeserver
+	  http::sconesite module for Sconeserver
 
 config BR2_PACKAGE_SCONESERVER_LOCATION
 	bool "location"
@@ -76,6 +63,19 @@ config BR2_PACKAGE_SCONESERVER_MATHS
 	help
 	  Mathematics module for Sconeserver
 
+config BR2_PACKAGE_SCONESERVER_MYSQL
+	bool "mysql"
+	depends on BR2_USE_MMU # mysql
+	select BR2_PACKAGE_MYSQL
+	help
+	  MySQL module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_RSS
+	bool "rss"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  RSS module for Sconeserver
+
 config BR2_PACKAGE_SCONESERVER_TESTBUILDER
 	bool "testbuilder"
 	help
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 2b28f8015c..bad050210e 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -40,6 +40,13 @@ else
 SCONESERVER_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
+SCONESERVER_DEPENDENCIES += bluez5_utils
+SCONESERVER_CONF_OPTS += --with-bluetooth
+else
+SCONESERVER_CONF_OPTS += --without-bluetooth
+endif
+
 ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
 SCONESERVER_CONF_OPTS += --with-examples
 else
@@ -53,6 +60,20 @@ else
 SCONESERVER_CONF_OPTS += --without-sconesite
 endif
 
+ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
+SCONESERVER_DEPENDENCIES += gpsd
+SCONESERVER_CONF_OPTS += --with-location
+else
+SCONESERVER_CONF_OPTS += --without-location
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
+SCONESERVER_DEPENDENCIES += mpfr
+SCONESERVER_CONF_OPTS += --with-maths
+else
+SCONESERVER_CONF_OPTS += --without-maths
+endif
+
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 SCONESERVER_DEPENDENCIES += mysql
 SCONESERVER_CONF_OPTS += \
@@ -63,13 +84,6 @@ else
 SCONESERVER_CONF_OPTS += --without-mysql
 endif
 
-ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
-SCONESERVER_DEPENDENCIES += bluez5_utils
-SCONESERVER_CONF_OPTS += --with-bluetooth
-else
-SCONESERVER_CONF_OPTS += --without-bluetooth
-endif
-
 ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
 SCONESERVER_DEPENDENCIES += libxml2
 SCONESERVER_CONF_OPTS += --with-rss
@@ -77,20 +91,6 @@ else
 SCONESERVER_CONF_OPTS += --without-rss
 endif
 
-ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-SCONESERVER_DEPENDENCIES += gpsd
-SCONESERVER_CONF_OPTS += --with-location
-else
-SCONESERVER_CONF_OPTS += --without-location
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
-SCONESERVER_DEPENDENCIES += mpfr
-SCONESERVER_CONF_OPTS += --with-maths
-else
-SCONESERVER_CONF_OPTS += --without-maths
-endif
-
 ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
 SCONESERVER_CONF_OPTS += --with-testbuilder
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
