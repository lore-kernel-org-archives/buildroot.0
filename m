Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB0BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD9781401;
	Sun, 20 Mar 2022 21:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id emST_WK_nhTN; Sun, 20 Mar 2022 21:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E4D813F5;
	Sun, 20 Mar 2022 21:39:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4246A1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 327924023C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cLz_9_o06Sg for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:38:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1FAD40213
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:38:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA6968468D; Sun, 20 Mar 2022 21:29:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:34:43 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 21278889daf2b899b1b416f259ca6ae839abf060
X-Git-Newrev: f91778be4df5b0caebfeee2a421eae64af2689f2
X-Patchwork-Hint: ignore
Message-Id: <20220320212923.AA6968468D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libglib2: bump to
 version 2.70.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f91778be4df5b0caebfeee2a421eae64af2689f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2a8ceb5cb30a9c28447e89c4b5bef67277697935)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/0002-remove-cpp-requirement.patch                  | 6 +++---
 .../0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch      | 2 +-
 .../0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 4 ++--
 package/libglib2/libglib2.hash                                      | 4 ++--
 package/libglib2/libglib2.mk                                        | 2 +-
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index 2f95228932..b5603c92f4 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.70.0',
+   version : '2.70.4',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
@@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1679,20 +1678,6 @@ if g_have_iso_c_varargs
+@@ -1696,20 +1695,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2330,7 +2315,6 @@ subdir('gobject')
+@@ -2339,7 +2324,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
diff --git a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index 67aea7982e..e212393011 100644
--- a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -16,7 +16,7 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -431,6 +431,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -435,6 +435,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
      # building with -Wbad-function-cast.
      '-Wno-bad-function-cast',
      '-Wno-cast-function-type',
diff --git a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index a29587bd31..db77a73203 100644
--- a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -23,7 +23,7 @@ diff --git a/gio/meson.build b/gio/meson.build
 index 29473d26b..112d4ada9 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -831,6 +831,7 @@ pkg.generate(libgio,
+@@ -841,6 +841,7 @@ pkg.generate(libgio,
    variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
                 'schemasdir=' + join_paths('${datadir}', schemas_subdir),
                 'bindir=' + join_paths('${prefix}', get_option('bindir')),
@@ -35,7 +35,7 @@ diff --git a/glib/meson.build b/glib/meson.build
 index f78f32969..6c5486699 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -377,6 +377,7 @@ pkg.generate(libglib,
+@@ -384,6 +384,7 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 580be3e08e..f0f0cb55ad 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.70/glib-2.70.0.sha256sum
-sha256  200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742  glib-2.70.0.tar.xz
+# https://download.gnome.org/sources/glib/2.70/glib-2.70.4.sha256sum
+sha256  ab3d176f3115dcc4e5d02db795984e04e4f4b48d836252e23e8c468e9d423c33  glib-2.70.4.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d3cba1a8bb..18f5b329c7 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.70
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
