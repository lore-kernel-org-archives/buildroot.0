Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DFFC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41A8442826;
	Sat,  8 Jun 2024 07:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwGUAdahHEou; Sat,  8 Jun 2024 07:53:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF48E42828
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF48E42828;
	Sat,  8 Jun 2024 07:53:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBB511BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F07F66072F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDw7ctJJp2fS for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63F7606F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D63F7606F8
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C091B87D7B; Sat,  8 Jun 2024 07:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:05:48 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c243e5549419068e7224a87b35534dcc417fd123
X-Git-Newrev: de7c48ade7ec6d36b3178dace42e16f3b17cf9d4
X-Patchwork-Hint: ignore
Message-Id: <20240608075252.C091B87D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libmanette: bump
 to version 0.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=de7c48ade7ec6d36b3178dace42e16f3b17cf9d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This is a bugfix release which mainly imroves device detection,
specially inside the Flatpak sandbox. Additionally, this version
includes the patch for building as a static library, and the patch
file can be removed.

Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/commit/27554bd118c08141134d4147cc34794057eb36e2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a4a90ee60332da775ce423e6f425ada65c4154da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...son-Un-hardcode-building-a-shared-library.patch | 34 ----------------------
 package/libmanette/libmanette.hash                 |  4 +--
 package/libmanette/libmanette.mk                   |  2 +-
 4 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a5d56b3d8e..364701fe1a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -642,7 +642,6 @@ package/libloki/0001-allow-to-install-to-a-specific-location-using-DESTDI.patch
 package/libloki/0002-use-ln-snf.patch Upstream
 package/libmad/0001-mips-h-constraint-removal.patch Sob Upstream
 package/libmad/0002-configure-ac-automake-foreign.patch Upstream
-package/libmanette/0001-Meson-Un-hardcode-building-a-shared-library.patch Upstream
 package/libmng/0001-jpeg-9a.patch Upstream
 package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch Upstream
 package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch Upstream
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
