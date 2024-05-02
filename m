Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A98C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C5F414CD;
	Thu,  2 May 2024 07:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUgEYnRrtB9I; Thu,  2 May 2024 07:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF9C414C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF9C414C3;
	Thu,  2 May 2024 07:49:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA4F21BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C779419F8
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cf9nQ0QicbJ9 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2AF9419FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2AF9419FC
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:48:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE737865E0; Thu,  2 May 2024 07:48:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 09:47:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d5ce8609f17a3403d1148a0bbf7a2bdb5ec7f67
X-Git-Newrev: 4c4bb101ba61198a55cb29764e2d35053c216228
X-Patchwork-Hint: ignore
Message-Id: <20240502074841.DE737865E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpciaccess: bump version to
 0.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c4bb101ba61198a55cb29764e2d35053c216228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in upstream release.

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003483.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...w-building-static-library-not-just-shared.patch | 48 ----------------------
 package/libpciaccess/libpciaccess.hash             |  4 +-
 package/libpciaccess/libpciaccess.mk               |  2 +-
 3 files changed, 3 insertions(+), 51 deletions(-)

diff --git a/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch b/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
deleted file mode 100644
index df1b4b415a..0000000000
--- a/package/libpciaccess/0001-meson-allow-building-static-library-not-just-shared.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ad7e9cb4b291a46812eea321f0634cfc46fb94e2 Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Thu, 14 Mar 2024 13:55:55 -0700
-Subject: [PATCH] meson: allow building static library, not just shared
-
-Lets builders specify -Ddefault_library={shared,static,both}
-to control which types of libpciaccess library are built
-
-Closes: #20
-Reported-by: Maxime Gauduin (@alucryd)
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-
-Upstream: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/commit/ad7e9cb4b291a46812eea321f0634cfc46fb94e2
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .gitlab-ci.yml  | 2 +-
- src/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
-index bcb75cf..185edc2 100644
---- a/.gitlab-ci.yml
-+++ b/.gitlab-ci.yml
-@@ -91,7 +91,7 @@ meson:
-       - MESON_OPTIONS: ['-Dzlib=disabled', '-Dzlib=enabled']
-   script:
-     - mkdir -p ../_inst
--    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 $MESON_OPTIONS
-+    - meson setup builddir --prefix="$PWD/../_inst" -Dwarning_level=3 -Ddefault_library=both $MESON_OPTIONS
-     - meson configure builddir
-     - ninja -C builddir test
-     - ninja -C builddir install
-diff --git a/src/meson.build b/src/meson.build
-index 24eee04..e319688 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -38,7 +38,7 @@ endif
- 
- inc_src = include_directories('.')
- 
--libpciaccess = shared_library(
-+libpciaccess = library(
-   'pciaccess',
-   [
-     'common_bridge.c',
--- 
-GitLab
-
diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 4662314509..e50aacc846 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,4 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2024-February/003453.html
-sha512  54dff9a493344586d072edf8c8eb8f7960c7dfd64aa5c51a8ec8d4e341f703fd39eb606ee41c4fdd9d5aad3372b7efe6e0fe96eadc575ea91de276320ebc3fbd  libpciaccess-0.18.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003483.html
+sha512  ef27999446e735df2331e94219ee3dafe9198a2472bb452f63ef9c9c446d5431f9e231e224cfabdeba1402974a5a0064546f9abced4d1770f994f5fc0c2b3310  libpciaccess-0.18.1.tar.xz
 # Hash for license file:
 sha256  f33f360f8905940dac01aa21597fe8a6727ca6f4ffa43b380e2116fd0666aa8a  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 04f3e2083b..cd35b27015 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.18
+LIBPCIACCESS_VERSION = 0.18.1
 LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
