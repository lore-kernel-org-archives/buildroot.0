Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A14CE74ACF
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34CCA41940;
	Tue,  3 Dec 2024 20:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSfqoCgNK46r; Tue,  3 Dec 2024 20:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C3641878
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C3641878;
	Tue,  3 Dec 2024 20:39:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A80CF1DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87EDE418CD
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjAowBWoPWRW for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4778841878
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4778841878
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:39:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F7248681D; Tue,  3 Dec 2024 20:39:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Dec 2024 21:36:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd94801092f6cdce71f78423abb602b0b72f6bec
X-Git-Newrev: f20396a248bb5f7cfa94bedfa7810355edb51af5
X-Patchwork-Hint: ignore
Message-Id: <20241203203907.2F7248681D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sysprof: bump to
 version 47.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f20396a248bb5f7cfa94bedfa7810355edb51af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a bugfix release, which mainly improves reliability, fixes a
issues when profiling WebKit, and adds a new counter for dropped perf
events. Release notes:

  https://gitlab.gnome.org/GNOME/sysprof/-/blob/47.2/NEWS

The patch to allow building with older GLib versions has been included
in the 47.1 release and therefore gets dropped.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-build-reduce-GLib-requirement.patch       | 30 ----------------------
 package/sysprof/sysprof.hash                       |  4 +--
 package/sysprof/sysprof.mk                         |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/sysprof/0001-build-reduce-GLib-requirement.patch b/package/sysprof/0001-build-reduce-GLib-requirement.patch
deleted file mode 100644
index fb83e210fe..0000000000
--- a/package/sysprof/0001-build-reduce-GLib-requirement.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c34fba6fe5c3ecd2028461a4317bd2916e2a09d7 Mon Sep 17 00:00:00 2001
-From: Christian Hergert <chergert@redhat.com>
-Date: Mon, 16 Sep 2024 09:48:15 -0700
-Subject: [PATCH] build: reduce GLib requirement
-
-This is kept lower so that you can build without GTK on older systems.
-
-Related: https://gitlab.gnome.org/GNOME/sysprof/-/commit/530b4a9d121c8659148c36ce67f2ce415443baa5#note_2223853
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/e5382d1b8cae4d829751938ce39c2e5fbc419064
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 63a31894..696b87be 100644
---- a/meson.build
-+++ b/meson.build
-@@ -45,7 +45,7 @@ need_libsysprof = (need_gtk or
-                    get_option('tests'))
- 
- dex_req = '0.6'
--glib_req = '2.80.0'
-+glib_req = '2.76.0'
- gtk_req = '4.15'
- polkit_req = '0.105'
- 
--- 
-2.46.2
-
diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index ca025674a7..1d7373e16d 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/47/sysprof-47.0.sha256sum
-sha256  7424c629434660654288c04248998c357d1ce87ee1559fd44df1980992ef5df5  sysprof-47.0.tar.xz
+# From https://download.gnome.org/sources/sysprof/47/sysprof-47.2.sha256sum
+sha256  e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f  sysprof-47.2.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 81c0a4a6ee..13b3de175e 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SYSPROF_VERSION_MAJOR = 47
-SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
+SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).2
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
 SYSPROF_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
