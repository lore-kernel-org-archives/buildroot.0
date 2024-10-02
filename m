Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF10DCF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF22141402;
	Wed,  2 Oct 2024 21:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVynmmT2B-Zp; Wed,  2 Oct 2024 21:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7560402F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7560402F5;
	Wed,  2 Oct 2024 21:44:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E6491BF31B
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78B0E40352
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4gpY63PMGQV for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12EDC400D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12EDC400D7
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:43:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0904F84C4D; Wed,  2 Oct 2024 21:43:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:43:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08b0dc61ec8b7ffc27c84e1b8b2fc85235ea415f
X-Git-Newrev: 29888ab35e047099d239f266b7b565cd4023503e
X-Patchwork-Hint: ignore
Message-Id: <20241002214359.0904F84C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairo: bump to 1.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=29888ab35e047099d239f266b7b565cd4023503e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - https://www.cairographics.org/news/cairo-1.18.2/

Upstream patches have been dropped in this commit.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...s-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch | 41 ----------------------
 .../0003-meson-only-require-cpp-for-windows.patch  | 38 --------------------
 package/cairo/cairo.hash                           |  4 +--
 package/cairo/cairo.mk                             |  2 +-
 4 files changed, 3 insertions(+), 82 deletions(-)

diff --git a/package/cairo/0002-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch b/package/cairo/0002-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
deleted file mode 100644
index 5a5c438a97..0000000000
--- a/package/cairo/0002-meson-always-skip-IPC_RMID_DEFERRED_RELEASE-check-wh.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8d5037ed642b02cdb018e49866aa286f30a7b59a Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Mon, 5 Feb 2024 17:47:07 +0100
-Subject: [PATCH] meson: always skip IPC_RMID_DEFERRED_RELEASE check when
- cross-compiling
-
-../../br-test-pkg/bootlin-armv5-uclibc/build/cairo-1.17.4/meson.build:279:13:
-ERROR: Can not run test applications in this cross environment.
-
-Commit 1bec56ea8a931e1ae1c74cc740134497ec365267 added support to define
-ipc_rmid_deferred_release in a cross-compile config, but still kept
-the default to auto, which anyhow results in an error when cross-compiling.
-
-There is only one usage of the ipc_rmid_deferred_release compile declarative
-which was originally added in this commit: 5041b462d084de8552336275914d30c23bf5dd35.
-
-If ipc_rmid_deferred_release is set to FALSE, an additional XSync is performed.
-This doesn't sound very harmful, so that is why this commit defaults to FALSE
-and thus avoids any cross-compile errors.
-
-Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/534
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9efe91978..6a670bf94 100644
---- a/meson.build
-+++ b/meson.build
-@@ -369,7 +369,7 @@ if x11_dep.found() and xext_dep.found()
- 
-   # Can skip the run check by providing the result in a cross file or
-   # native file as bool property value.
--  prop = meson.get_external_property('ipc_rmid_deferred_release', 'auto')
-+  prop = meson.get_external_property('ipc_rmid_deferred_release', meson.is_cross_build() ? 'false' : 'auto')
-   # We don't know the type of prop (bool, string) but need to differentiate
-   # between a set value (bool) or the fallback value (string), so convert to
-   # a string and check the string value.
---
-2.34.1
diff --git a/package/cairo/0003-meson-only-require-cpp-for-windows.patch b/package/cairo/0003-meson-only-require-cpp-for-windows.patch
deleted file mode 100644
index 3ce396f66f..0000000000
--- a/package/cairo/0003-meson-only-require-cpp-for-windows.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e93ef3feb69994e3aa4e0ab66ccd66139b097e49 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Thu, 18 Jul 2024 12:16:51 +0200
-Subject: [PATCH] meson: only require cpp for windows
-
-Allow to compile cairo without c++ toolchain.
-
-Fixes:
- - http://autobuild.buildroot.net/results/98b62ab7ed3092f9f9085f723baf7d6267451e5c/
-
-Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/573
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- meson.build | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 9100152ee..297482b03 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('cairo', 'c', 'cpp',
-+project('cairo', 'c',
-   meson_version: '>= 0.59.0',
-   version: run_command(find_program('version.py'), check: true).stdout().strip(),
-   default_options: ['warning_level=2'],
-@@ -489,6 +489,8 @@ if host_machine.system() == 'darwin' and not get_option('quartz').disabled()
- endif
- 
- if host_machine.system() == 'windows'
-+  add_languages('cpp')
-+
-   add_project_arguments('-DWIN32_LEAN_AND_MEAN', '-DNOMINMAX', language: ['c', 'cpp'])
- 
-   win32_extra_deps = [
--- 
-2.45.2
-
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index df9c693bad..b2d384d01a 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,5 +1,5 @@
-# From https://www.cairographics.org/releases/cairo-1.18.0.tar.xz.sha256sum
-sha256  243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64  cairo-1.18.0.tar.xz
+# From https://www.cairographics.org/releases/cairo-1.18.2.tar.xz.sha256sum
+sha256  a62b9bb42425e844cc3d6ddde043ff39dbabedd1542eba57a2eb79f85889d45a  cairo-1.18.2.tar.xz
 
 # Hash for license files:
 sha256  67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf  COPYING
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index ba25620f8d..c741c97853 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.18.0
+CAIRO_VERSION = 1.18.2
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
