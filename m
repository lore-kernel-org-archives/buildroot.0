Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF12C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 08:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B695D84330;
	Tue, 22 Mar 2022 08:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pE6UrNbUVJR; Tue, 22 Mar 2022 08:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9387184329;
	Tue, 22 Mar 2022 08:21:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 846B61BF2CD
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 08:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 719DD84329
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 08:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQhIiH5Ao8SY for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 08:21:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A484F84328
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 08:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 402448513F; Tue, 22 Mar 2022 08:12:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 08:59:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52c372446f034cf8277951ad083abe5e1c10f52d
X-Git-Newrev: eaa8fcf546d84e38990566e49f4730c530d2577c
X-Patchwork-Hint: ignore
Message-Id: <20220322081231.402448513F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump version to
 2.4.53
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaa8fcf546d84e38990566e49f4730c530d2577c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.53

Fixes CVE-2022-22719, CVE-2022-22720, CVE-2022-22721 & CVE-2022-23943.

Switch from pcre to pcre2 following upstream commit:
https://github.com/apache/httpd/commit/c602ba14811ede722017c4e59e4e30d9990227b4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/Config.in   | 2 +-
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 8b6a5bf7ea..270296bce4 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_APACHE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR_UTIL
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  The Apache HTTP Server Project is an effort to develop and
 	  maintain an open-source HTTP server for modern operating
diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 014d920772..11dcdefe46 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.52.tar.bz2.{sha256,sha512}
-sha256  0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9  httpd-2.4.52.tar.bz2
-sha512  97c021c576022a9d32f4a390f62e07b5f550973aef2f299fd52defce1a9fa5d27bd4a676e7bf214373ba46063d34aecce42de62fdd93678a4e925cfcbb2afdf6  httpd-2.4.52.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.53.tar.bz2.{sha256,sha512}
+sha256  d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63  httpd-2.4.53.tar.bz2
+sha512  07ef59594251a30a864cc9cc9a58ab788c2d006cef85b728f29533243927c63cb063e0867f2a306f37324c3adb9cf7dcb2402f3516b05c2c6f32469d475dd756  httpd-2.4.53.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index b280d4dc3a..b2c855aa36 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.52
+APACHE_VERSION = 2.4.53
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
@@ -17,11 +17,11 @@ APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APACHE_AUTORECONF = YES
-APACHE_DEPENDENCIES = apr apr-util pcre
+APACHE_DEPENDENCIES = apr apr-util pcre2
 
 APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
-	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
+	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 
 ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT),y)
 APACHE_MPM = event
@@ -35,7 +35,7 @@ APACHE_CONF_OPTS = \
 	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
-	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
+	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
 	--enable-http \
 	--enable-dbd \
 	--enable-proxy \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
