Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71699CD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29ECA41181;
	Mon,  8 Apr 2024 20:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt9DOE9eGnj2; Mon,  8 Apr 2024 20:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D62741452
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D62741452;
	Mon,  8 Apr 2024 20:50:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 453581BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F26C81CE7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSYbmEBlPifP for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1593F81B6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1593F81B6D
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:49:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBD7485C74; Mon,  8 Apr 2024 20:49:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Apr 2024 22:39:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39038a1c14250f3ca8deae9b16911c23b2d3f69f
X-Git-Newrev: ea2f45148e1f83f6edfa512f5922e2f3ac38666c
X-Patchwork-Hint: ignore
Message-Id: <20240408204957.BBD7485C74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: bump to version 1.52.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea2f45148e1f83f6edfa512f5922e2f3ac38666c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pango/0001-Drop-Werror-array-bounds.patch | 40 -----------------------
 package/pango/pango.hash                          |  4 +--
 package/pango/pango.mk                            |  4 +--
 3 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/package/pango/0001-Drop-Werror-array-bounds.patch b/package/pango/0001-Drop-Werror-array-bounds.patch
deleted file mode 100644
index 45821e8533..0000000000
--- a/package/pango/0001-Drop-Werror-array-bounds.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e93dbd66973040f1e0afcba0dc7c712c27d75d59 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Mon, 1 May 2023 23:27:52 -0400
-Subject: [PATCH] Drop -Werror=array-bounds
-
-gcc has strange issues with this and produces false
-positives that recently started breaking the build of
-pango as a subproject in gtk.
-
-See e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
-
-Upstream: https://gitlab.gnome.org/GNOME/pango/-/commit/e93dbd66973040f1e0afcba0dc7c712c27d75d59
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 930f41082..2d30c0141 100644
---- a/meson.build
-+++ b/meson.build
-@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
-     '-Wuninitialized',
-     '-Wunused',
-     '-Werror=address',
--    '-Werror=array-bounds',
-     '-Werror=empty-body',
-     '-Werror=implicit',
-     '-Werror=implicit-fallthrough',
-@@ -132,7 +131,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
-     '-Werror=sequence-point',
-     '-Werror=return-type',
-     '-Werror=trigraphs',
--    '-Werror=array-bounds',
-     '-Werror=write-strings',
-     '-Werror=address',
-     '-Werror=int-to-pointer-cast',
--- 
-GitLab
-
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 3e609e6e04..69b6b0adf6 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.50/pango-1.50.14.sha256sum
-sha256  1d67f205bfc318c27a29cfdfb6828568df566795df0cb51d2189cde7f2d581e8  pango-1.50.14.tar.xz
+# From https://download.gnome.org/sources/pango/1.52/pango-1.52.2.sha256sum
+sha256  d0076afe01082814b853deec99f9349ece5f2ce83908b8e58ff736b41f78a96b  pango-1.52.2.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 723e6d2288..ec0f5127e7 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).14
+PANGO_VERSION_MAJOR = 1.52
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).2
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
