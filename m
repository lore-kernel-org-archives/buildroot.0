Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E09C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85E9E60774;
	Sun,  5 Feb 2023 14:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85E9E60774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ap2VRO6_LT_f; Sun,  5 Feb 2023 14:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B05AF60758;
	Sun,  5 Feb 2023 14:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B05AF60758
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DA371BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE0B60761
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE0B60761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0DgF9texDzK for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:25:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5087060758
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5087060758
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EDC683883; Sun,  5 Feb 2023 14:25:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:24:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae65870e652088dd65ca41d63304893d1d4443a2
X-Git-Newrev: 42e34cf10f9eb037aa8c48a4fb9e8f521901b983
X-Patchwork-Hint: ignore
Message-Id: <20230205142502.3EDC683883@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modsecurity2: security bump to
 version 2.9.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=42e34cf10f9eb037aa8c48a4fb9e8f521901b983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2023-24021: Incorrect handling of '\0' bytes in file uploads
  in ModSecurity before 2.9.7 may allow for Web Application Firewall
  bypasses and buffer overflows on the Web Application Firewall when
  executing rules that read the FILES_TMP_CONTENT collection.
- host-pkgconf is mandatory and used to find libxml2 since
  https://github.com/SpiderLabs/ModSecurity/commit/baa38ddbaf55a87afecad7a1e1760c69a2689787
- pcre2 is supported since:
  https://github.com/SpiderLabs/ModSecurity/commit/8fc0b519b7a6c023259753a21f33bf3649a25b14

https://github.com/SpiderLabs/ModSecurity/blob/v2.9.7/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/modsecurity2/Config.in         | 2 +-
 package/modsecurity2/modsecurity2.hash | 4 ++--
 package/modsecurity2/modsecurity2.mk   | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/modsecurity2/Config.in b/package/modsecurity2/Config.in
index 2870386a99..fb1bfc960e 100644
--- a/package/modsecurity2/Config.in
+++ b/package/modsecurity2/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MODSECURITY2
 	bool "modsecurity2"
 	depends on BR2_PACKAGE_APACHE
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  ModSecurity is an open source, cross-platform web application
 	  firewall (WAF) module. Known as the "Swiss Army Knife" of
diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index a19f4823a8..2c77ffd830 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,5 +1,5 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v2.9.5/modsecurity-2.9.5.tar.gz.sha256
-sha256  e2bfc8cd8b8de1e21f054d310543373ea5d89adbd96784e832be0da3e4dc149e  modsecurity-2.9.5.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz.sha256
+sha256  2a28fcfccfef21581486f98d8d5fe0397499749b8380f60ec7bb1c08478e1839  modsecurity-2.9.7.tar.gz
 
 # Locally computed
 sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index a1ad8fe5bc..c251291e64 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODSECURITY2_VERSION = 2.9.5
+MODSECURITY2_VERSION = 2.9.7
 MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
 MODSECURITY2_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
@@ -12,11 +12,10 @@ MODSECURITY2_LICENSE_FILES = LICENSE
 MODSECURITY2_CPE_ID_VENDOR = trustwave
 MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
-MODSECURITY2_DEPENDENCIES = apache libxml2 pcre
+MODSECURITY2_DEPENDENCIES = host-pkgconf apache libxml2 pcre2
 
 MODSECURITY2_CONF_OPTS = \
-	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
-	--with-libxml=$(STAGING_DIR)/usr \
+	--with-pcre2=$(STAGING_DIR)/usr/bin/pcre2-config \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
 	--with-apu=$(STAGING_DIR)/usr/bin/apu-1-config \
 	--with-apxs=$(STAGING_DIR)/usr/bin/apxs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
