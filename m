Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904C9C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539AF42239;
	Fri, 10 May 2024 20:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPWo6my644PZ; Fri, 10 May 2024 20:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5C442252
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5C442252;
	Fri, 10 May 2024 20:11:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF741BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34B5E40327
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7M4zmUCqUVkY for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A02401D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45A02401D5
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:11:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 330AC86EF7; Fri, 10 May 2024 20:11:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:11:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 631254df939b39c7a67de4036122cfee4dad5d72
X-Git-Newrev: a4a90ee60332da775ce423e6f425ada65c4154da
X-Patchwork-Hint: ignore
Message-Id: <20240510201153.330AC86EF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmanette: bump to version 0.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4a90ee60332da775ce423e6f425ada65c4154da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bugfix release which mainly imroves device detection,
specially inside the Flatpak sandbox. Additionally, this version
includes the patch for building as a static library, and the patch
file can be removed.

Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/commit/27554bd118c08141134d4147cc34794057eb36e2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...son-Un-hardcode-building-a-shared-library.patch | 34 ----------------------
 package/libmanette/libmanette.hash                 |  4 +--
 package/libmanette/libmanette.mk                   |  2 +-
 4 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 418f820533..d7e50f3dcf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -913,7 +913,6 @@ package/libloki/0001-allow-to-install-to-a-specific-location-using-DESTDI.patch
 package/libloki/0002-use-ln-snf.patch lib_patch.Upstream
 package/libmad/0001-mips-h-constraint-removal.patch lib_patch.Sob lib_patch.Upstream
 package/libmad/0002-configure-ac-automake-foreign.patch lib_patch.Upstream
-package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch lib_patch.Upstream
 package/libmng/0001-jpeg-9a.patch lib_patch.Upstream
 package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch lib_patch.Upstream
 package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch lib_patch.Upstream
diff --git a/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch b/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
deleted file mode 100644
index a93a1f7219..0000000000
--- a/package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 003c2e84d95357bbbef72fb395ef85f1650097a3 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Fri, 23 Sep 2022 14:35:51 +0300
-Subject: [PATCH] Meson: Un-hardcode building a shared library
-
-Use library() instead of shared_library() to allow specifying which kind
-of library to build with "meson setup --default-library ..."
-
-This allows more easily incorporating libmanette in an application e.g.
-as a Meson subproject which gets built into a program as a static
-library.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://gitlab.gnome.org/GNOME/libmanette/-/merge_requests/84]
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index c140cac..b71d090 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -63,7 +63,7 @@ if gudev.found()
-   libmanette_deps += [ gudev ]
- endif
- 
--libmanette_lib = shared_library(
-+libmanette_lib = library(
-   libmanette_module,
-   libmanette_sources,
-   c_args: libmanette_c_args,
--- 
-2.37.3
-
diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index 96089f971a..b1da3c19f6 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.6.sha256sum
-sha256  63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac  libmanette-0.2.6.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.7.sha256sum
+sha256  cddd5c02a131072c19c6cde6f2cb2cd57eae7dacb50d14c337efd980baa51a51  libmanette-0.2.7.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 10f2b8a466..42fb479795 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).6
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).7
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
