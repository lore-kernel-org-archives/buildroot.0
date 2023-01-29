Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F942C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E9F4158F;
	Sun, 29 Jan 2023 20:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E9F4158F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ymw5hPJuech1; Sun, 29 Jan 2023 20:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 641F0415DD;
	Sun, 29 Jan 2023 20:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 641F0415DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B7A11BF3A9
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 341C160D58
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341C160D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnPyqGA_y0-o for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 20:38:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41CBE60A77
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 20:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CBE60A77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E522881D8; Sun, 29 Jan 2023 20:38:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 21:34:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98f8ddbc74962ab33df5ada2ccb53a27c49e60f1
X-Git-Newrev: 15864d79130479aa8d0c6990a95d9921892e822c
X-Patchwork-Hint: ignore
Message-Id: <20230129203846.2E522881D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{,
 lib}apparmor: bump to version 3.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=15864d79130479aa8d0c6990a95d9921892e822c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the location where the hashes are retrieved from.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998@free.fr: hashes location changed]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apparmor/apparmor.hash       | 4 ++--
 package/apparmor/apparmor.mk         | 4 ++--
 package/libapparmor/libapparmor.hash | 4 ++--
 package/libapparmor/libapparmor.mk   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 497491b6c9..22037e3e11 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2
+sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 76c9f2cafe..eeedd805e6 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the libapparmor package
-APPARMOR_VERSION_MAJOR = 3.0
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).4
+APPARMOR_VERSION_MAJOR = 3.1
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).2
 APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 9fbfe3b92e..574ff95b60 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  09bf48d7a171f9790c39a1404bad105a788934cfe77b7490c7f5c63c2576b725  apparmor-3.0.4.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2
+sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index af59335933..7f3cfcab2f 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version here, please also update the apparmor package
-LIBAPPARMOR_VERSION_MAJOR = 3.0
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).4
+LIBAPPARMOR_VERSION_MAJOR = 3.1
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).2
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
 LIBAPPARMOR_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
