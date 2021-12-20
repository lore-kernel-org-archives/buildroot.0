Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03A9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D73140129;
	Mon, 20 Dec 2021 22:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJFlt0eLlzlz; Mon, 20 Dec 2021 22:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17B474019D;
	Mon, 20 Dec 2021 22:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 675271BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75630815CD
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KixVdQoajQF8 for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED3748149A
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E47AD8289B; Mon, 20 Dec 2021 22:36:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:05:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3
X-Git-Newrev: c1b6b12d98ebd5fe1f0aea72830a01d3b59580b0
X-Patchwork-Hint: ignore
Message-Id: <20211220223640.E47AD8289B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmbim: bump to version 1.26.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1b6b12d98ebd5fe1f0aea72830a01d3b59580b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/1.26.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...libmbim-glib-meson.build-fix-static-build.patch | 34 ------------
 ...uild-add-an-option-to-not-build-man-pages.patch | 60 ----------------------
 package/libmbim/libmbim.hash                       |  2 +-
 package/libmbim/libmbim.mk                         |  2 +-
 4 files changed, 2 insertions(+), 96 deletions(-)

diff --git a/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch b/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
deleted file mode 100644
index 6ccad9abf8..0000000000
--- a/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ff1f9d7c9bc163de3117383b7cea9cd99585462a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 31 Jul 2021 23:42:35 +0200
-Subject: [PATCH] src/libmbim-glib/meson.build: fix static build
-
-Replace shared_library by library to fix static build failure with
-toolchains that don't support dynamic library
-
-Fixes:
- - http://autobuild.buildroot.org/results/8553211d87a2c41d8b47b51bbb193736fce49714
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/merge_requests/83]
----
- src/libmbim-glib/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libmbim-glib/meson.build b/src/libmbim-glib/meson.build
-index e3337db..5de3564 100644
---- a/src/libmbim-glib/meson.build
-+++ b/src/libmbim-glib/meson.build
-@@ -76,7 +76,7 @@ version_header = configure_file(
- 
- symbol_map = join_paths(meson.current_source_dir(), 'symbol.map')
- 
--libmbim_glib = shared_library(
-+libmbim_glib = library(
-   libname,
-   version: mbim_glib_version,
-   sources: version_header,
--- 
-2.30.2
-
diff --git a/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch b/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
deleted file mode 100644
index c91756e9a6..0000000000
--- a/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 792af73ea90e9689703ab526dd444fdb1c2f8e40 Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Thu, 14 Oct 2021 12:25:46 +0200
-Subject: [PATCH] meson.build: add an option to not build man pages.
-
-When cross-compiling, the compiled binaries cannot be run on the build
-machine, unless one defines a helper (e.g. qemu) in the meson
-configuration, which is most of the time undesirable.
-
-If help2man is installed on the build machine, then the build would fail
-because of this, so add an option to disable generating the man pages.
-
-With later versions of meson, it will be possible to automatically
-detect this condition.
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build       | 8 +++++++-
- meson_options.txt | 1 +
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1c5ee2d..59f1727 100644
---- a/meson.build
-+++ b/meson.build
-@@ -184,8 +184,8 @@ if enable_gtk_doc
-   subdir('docs/reference/libmbim-glib')
- endif
- 
--help2man = find_program('help2man', required: false)
--if help2man.found()
-+enable_man = get_option('man')
-+if enable_man
-   subdir('docs/man')
- endif
- 
-@@ -198,6 +203,7 @@ summary({
- output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
- output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
- output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
-+output += '    man pages:             ' + enable_man.to_string() + '\n\n'
- output += '  System paths\n'
- output += '    prefix:                ' + mbim_prefix + '\n'
- output += '    udev base directory:   ' + mbim_username + '\n\n'
-diff --git a/meson_options.txt b/meson_options.txt
-index 1305957..bfa33ab 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -7,5 +7,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
- 
- option('introspection', type: 'boolean', value: 'true', description: 'build introspection support')
- option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
-+option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
- 
- option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
--- 
-GitLab
-
diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 07cfd69163..7ecc99d333 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  63b53db0196dadea673f04524b0683ce40282f25bfd513d398e2a10b992cac01  libmbim-1.26.0.tar.gz
+sha256  c12e61ea462fca40ddba2a8e1e401242d4f13827944369fad27ff70936b1e09d  libmbim-1.26.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 6737afebe8..eba5f0a6e0 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.26.0
+LIBMBIM_VERSION = 1.26.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
