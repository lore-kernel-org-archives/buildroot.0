Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C9BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C099403C4;
	Wed, 16 Feb 2022 21:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pU6dfzRZimIs; Wed, 16 Feb 2022 21:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EAFC40191;
	Wed, 16 Feb 2022 21:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4842C1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44973416DA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NaxJ_7yGXbs1 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66C11415F8
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:00:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A68F1835F3; Wed, 16 Feb 2022 20:52:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:56:29 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2d2664cbecfa10807ca6a1bbd322b1cf6252a339
X-Git-Newrev: 31a9d8797184be43bab960ff38279952e2b865d5
X-Patchwork-Hint: ignore
Message-Id: <20220216205241.A68F1835F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/gst1-plugins-base: bump version to 1.18.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=31a9d8797184be43bab960ff38279952e2b865d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- removed 0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
  (upstream accepted [1], [2])

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/974
[2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/d86cf6314f8f178c59600f55321ce73d4ca95d97.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ecdc76a39c89d37a90c2b87ecf62db09de710beb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-video-gstvideoaggregator.c-fix-build-wi.patch | 45 ----------------------
 .../gst1-plugins-base/gst1-plugins-base.hash       |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         |  2 +-
 3 files changed, 3 insertions(+), 48 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch b/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
deleted file mode 100644
index 87cd6493f5..0000000000
--- a/package/gstreamer1/gst1-plugins-base/0001-gst-libs-gst-video-gstvideoaggregator.c-fix-build-wi.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 012ca1bcd234ee02f576dd58b1f09baba18b89b0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 14 Dec 2020 07:42:55 +0100
-Subject: [PATCH] gst-libs/gst/video/gstvideoaggregator.c: fix build with gcc
- 4.8
-
-Fix the following build failure with gcc 4.8 which has been added with
-https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/d268c193ad39fb970351ed62898be806ebd0a71e:
-
-../gst-libs/gst/video/gstvideoaggregator.c: In function 'gst_video_aggregator_init':
-../gst-libs/gst/video/gstvideoaggregator.c:2762:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (gint i = 0; i < gst_caps_get_size (src_template); i++) {
-   ^
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/974]
----
- gst-libs/gst/video/gstvideoaggregator.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gst-libs/gst/video/gstvideoaggregator.c b/gst-libs/gst/video/gstvideoaggregator.c
-index 2e3d813be..04dad6563 100644
---- a/gst-libs/gst/video/gstvideoaggregator.c
-+++ b/gst-libs/gst/video/gstvideoaggregator.c
-@@ -2786,6 +2786,7 @@ gst_video_aggregator_init (GstVideoAggregator * vagg,
- {
-   GstCaps *src_template;
-   GstPadTemplate *pad_template;
-+  gint i;
- 
-   vagg->priv = gst_video_aggregator_get_instance_private (vagg);
-   vagg->priv->current_caps = NULL;
-@@ -2800,7 +2801,7 @@ gst_video_aggregator_init (GstVideoAggregator * vagg,
-   pad_template =
-       gst_element_class_get_pad_template (GST_ELEMENT_CLASS (klass), "src");
-   src_template = gst_pad_template_get_caps (pad_template);
--  for (gint i = 0; i < gst_caps_get_size (src_template); i++) {
-+  for (i = 0; i < gst_caps_get_size (src_template); i++) {
-     const GValue *v =
-         gst_structure_get_value (gst_caps_get_structure (src_template, i),
-         "format");
--- 
-2.29.2
-
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 200ba0fe5d..081dc6f213 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.5.tar.xz.sha256sum
-sha256  960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3  gst-plugins-base-1.18.5.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.6.tar.xz.sha256sum
+sha256  56a9ff2fe9e6603b9e658cf6897d412a173d2180829fe01e92568549c6bd0f5b  gst-plugins-base-1.18.6.tar.xz
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 76757fd6a8..c99eeb6c59 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.18.5
+GST1_PLUGINS_BASE_VERSION = 1.18.6
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
