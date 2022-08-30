Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A510ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31F8D814A9;
	Tue, 30 Aug 2022 16:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F8D814A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPJgM-uI8wgE; Tue, 30 Aug 2022 16:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A076581497;
	Tue, 30 Aug 2022 16:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A076581497
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB4E31BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B363540A79
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B363540A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSFZvreg2U63 for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E150640BBE
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E150640BBE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2A830880D3; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:00:00 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 71ffdf2d737cdf9a13a65dcc28c3156ee141b87d
X-Git-Newrev: 093977717bc61e09b69858fdccf93d1d60e77a3f
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.2A830880D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sconeserver:
 reorder options alphabetically
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=093977717bc61e09b69858fdccf93d1d60e77a3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 49b8fad29c65971f97bb81a7b7c4a1fda7276df4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
