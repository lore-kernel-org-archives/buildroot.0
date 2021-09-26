Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A895C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432346103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 432346103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1304B403B2;
	Sun, 26 Sep 2021 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9xz2HJtYnyO; Sun, 26 Sep 2021 21:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04EB1403B3;
	Sun, 26 Sep 2021 21:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F39441BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E05F8403C9
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2wWrFb84R6d for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3BAF403B4
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 49FB28D309; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:06:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfc80eeeb4f3cb8e59b56bedd5bd49761764671f
X-Git-Newrev: 81ffda4ff3232f8fa2de67dae03cf9b778323b20
X-Patchwork-Hint: ignore
Message-Id: <20210926214229.49FB28D309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: bump version to 2.68.4
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
Content-Type: multipart/mixed; boundary="===============8204621273803173909=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8204621273803173909==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=81ffda4ff3232f8fa2de67dae03cf9b778323b20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglib2/0002-remove-cpp-requirement.patch |  2 +-
 ...orrectly-use-3-parameters-for-close_range.patch | 33 ----------------------
 package/libglib2/libglib2.hash                     |  4 +--
 package/libglib2/libglib2.mk                       |  2 +-
 4 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index 9393bd258a..c402cbafa5 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.68.2',
+   version : '2.68.4',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/0004-correctly-use-3-parameters-for-close_range.patch b/package/libglib2/0004-correctly-use-3-parameters-for-close_range.patch
deleted file mode 100644
index bfca4b14ef..0000000000
--- a/package/libglib2/0004-correctly-use-3-parameters-for-close_range.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b71117d89434db83d34bc1b981ca03d4be299576 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jul 2021 17:26:43 -0700
-Subject: [PATCH] correctly use 3 parameters for close_range
-
-libc implementation has 3 parameter e.g.
-https://www.freebsd.org/cgi/man.cgi?query=close_range&sektion=2&format=html
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/glib/-/commit/b71117d89434db83d34bc1b981ca03d4be299576]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- glib/gspawn.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/glib/gspawn.c b/glib/gspawn.c
-index 899647c2f..3073a10a4 100644
---- a/glib/gspawn.c
-+++ b/glib/gspawn.c
-@@ -1520,7 +1520,7 @@ safe_closefrom (int lowfd)
-    *
-    * Handle ENOSYS in case it’s supported in libc but not the kernel; if so,
-    * fall back to safe_fdwalk(). */
--  if (close_range (lowfd, G_MAXUINT) != 0 && errno == ENOSYS)
-+  if (close_range (lowfd, G_MAXUINT, 0) != 0 && errno == ENOSYS)
- #endif  /* HAVE_CLOSE_RANGE */
-   (void) safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
- #endif
--- 
-GitLab
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 15e0085f78..d421e025ff 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.68/glib-2.68.2.sha256sum
-sha256  ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb  glib-2.68.2.tar.xz
+# https://download.gnome.org/sources/glib/2.68/glib-2.68.4.sha256sum
+sha256  62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b  glib-2.68.4.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4f13622e36..af73aeb3bf 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.68
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+

--===============8204621273803173909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8204621273803173909==--
