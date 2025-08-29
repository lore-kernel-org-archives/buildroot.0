Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F76CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB3C842E6;
	Fri, 29 Aug 2025 17:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zAzdQr5t-uB; Fri, 29 Aug 2025 17:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B685842EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B685842EA;
	Fri, 29 Aug 2025 17:23:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E57369
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6522261695
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BenTPRNAs5Xa for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A261561529
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A261561529
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:23:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 918F187E20; Fri, 29 Aug 2025 17:23:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 19:20:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dba44f1684d17ac4fe72674af8f280cb26c1462
X-Git-Newrev: 0d643a8636420a85512aae69932bba2fbe9e5829
X-Patchwork-Hint: ignore
Message-Id: <20250829172329.918F187E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: security bump to 1.4.81
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d643a8636420a85512aae69932bba2fbe9e5829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
- https://www.lighttpd.net/2025/8/13/1.4.80/
  - detect and issue error trace for HTTP/2 MadeYouReset VU#767506 CVE-2025-8671
- https://www.lighttpd.net/2025/8/17/1.4.81/
  - security: fix to reject disallowed trailers

See Changes from 1.4.79:

[build] remove references to libev; no longer used

So drop here as well.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy               | 8 ++++++++
 package/lighttpd/Config.in     | 6 ------
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 9 +--------
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c0d268aa5d..c9db36d66f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.11"
+
+config BR2_PACKAGE_LIGHTTPD_LIBEV
+	bool "lighttpd removed libev support"
+	select BR2_LEGACY
+	help
+	  Lighttpd 1.4.80 removed optional libev support.
+
 comment "Legacy options removed in 2025.08"
 
 config BR2_PACKAGE_LIBSVGTINY
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 1a9a9a277d..fe2c7a2815 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -67,12 +67,6 @@ config BR2_PACKAGE_LIGHTTPD_LDAP
 comment "ldap support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
-config BR2_PACKAGE_LIGHTTPD_LIBEV
-	bool "libev support"
-	select BR2_PACKAGE_LIBEV
-	help
-	  Enable libev support for lighttpd fdevent handlers.
-
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 4adbd08648..a23af84c28 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha512sum
-sha512  e0f1bb2cfca5e81001ea30d13f088425dfc7acbec924ecddf438eb6326ab3158a61c6c4aaee0b68a90666d1cb987ce94b1f6a48afd92485cc995db5b58265f83  lighttpd-1.4.79.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha256sum
-sha256  3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd  lighttpd-1.4.79.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha512sum
+sha512  10c24b1c1ce1aa1d826a426868223393eb81d7c0fbcc0b4f032b082a14593e0364228a5275e1440ed8782a2e78f0ded7cf72bc6642e5528bc82defcefab9301b  lighttpd-1.4.81.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha256sum
+sha256  d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840  lighttpd-1.4.81.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5337042340..71c860a31a 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).79
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).81
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
@@ -76,13 +76,6 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBEV),y)
-LIGHTTPD_DEPENDENCIES += libev
-LIGHTTPD_CONF_OPTS += -Dwith_libev=enabled
-else
-LIGHTTPD_CONF_OPTS += -Dwith_libev=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
