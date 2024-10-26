Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF2D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 045654094C;
	Sat, 26 Oct 2024 11:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vs9O2pDfXpcR; Sat, 26 Oct 2024 11:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B686F4098C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B686F4098C;
	Sat, 26 Oct 2024 11:50:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 139CC5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E997F81F74
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Llq__kiqhyR6 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 103F981F8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 103F981F8A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:49:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADD4581775; Sat, 26 Oct 2024 11:49:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:45:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e3ab0ab8852783ccb5f6251156da2044cb4972a
X-Git-Newrev: 6fdaff237669eea5576ee8cd452661898ee7a846
X-Patchwork-Hint: ignore
Message-Id: <20241026114959.ADD4581775@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysprof: bump to version 47.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fdaff237669eea5576ee8cd452661898ee7a846
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include an upstream patch that allows building with older versions
of GLib, to avoid needing to update its package.

https://gitlab.gnome.org/GNOME/sysprof/-/blob/47.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-build-reduce-GLib-requirement.patch       | 30 ++++++++++++++++++++++
 package/sysprof/sysprof.hash                       |  4 +--
 package/sysprof/sysprof.mk                         |  2 +-
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/package/sysprof/0001-build-reduce-GLib-requirement.patch b/package/sysprof/0001-build-reduce-GLib-requirement.patch
new file mode 100644
index 0000000000..fb83e210fe
--- /dev/null
+++ b/package/sysprof/0001-build-reduce-GLib-requirement.patch
@@ -0,0 +1,30 @@
+From c34fba6fe5c3ecd2028461a4317bd2916e2a09d7 Mon Sep 17 00:00:00 2001
+From: Christian Hergert <chergert@redhat.com>
+Date: Mon, 16 Sep 2024 09:48:15 -0700
+Subject: [PATCH] build: reduce GLib requirement
+
+This is kept lower so that you can build without GTK on older systems.
+
+Related: https://gitlab.gnome.org/GNOME/sysprof/-/commit/530b4a9d121c8659148c36ce67f2ce415443baa5#note_2223853
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/e5382d1b8cae4d829751938ce39c2e5fbc419064
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 63a31894..696b87be 100644
+--- a/meson.build
++++ b/meson.build
+@@ -45,7 +45,7 @@ need_libsysprof = (need_gtk or
+                    get_option('tests'))
+ 
+ dex_req = '0.6'
+-glib_req = '2.80.0'
++glib_req = '2.76.0'
+ gtk_req = '4.15'
+ polkit_req = '0.105'
+ 
+-- 
+2.46.2
+
diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index f21e7621e1..ca025674a7 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/46/sysprof-46.0.sha256sum
-sha256  73aa7e75ebab3e4e0946a05a723df7e6ee4249e3b9e884dba35500aba2a1d176  sysprof-46.0.tar.xz
+# From https://download.gnome.org/sources/sysprof/47/sysprof-47.0.sha256sum
+sha256  7424c629434660654288c04248998c357d1ce87ee1559fd44df1980992ef5df5  sysprof-47.0.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 8e69a7044e..81c0a4a6ee 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSPROF_VERSION_MAJOR = 46
+SYSPROF_VERSION_MAJOR = 47
 SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
