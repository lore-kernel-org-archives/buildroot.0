Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC3EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 402CD409E3;
	Fri, 22 Jul 2022 06:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 402CD409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d5-rX4mWaY91; Fri, 22 Jul 2022 06:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88F96409D7;
	Fri, 22 Jul 2022 06:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88F96409D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9EDDD1BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 797F484792
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 797F484792
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNqd3O676mWN for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:25:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C56D084782
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C56D084782
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C4AF583F2A; Fri, 22 Jul 2022 06:12:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:14:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2ccfe0066e8ee4c9cc8107fa349acf4395c9424d
X-Git-Newrev: 8cd128da92b10c851407bfc547694b3863e512f6
X-Patchwork-Hint: ignore
Message-Id: <20220722061203.C4AF583F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/{webkitgtk,
 wpewebkit}: select debugutils for multimedia
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

commit: https://git.buildroot.net/buildroot/commit/?id=8cd128da92b10c851407bfc547694b3863e512f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When using webkit with multimedia support the fakevideosink element
is used in some places, as such we should select debugutils which
provides fakevideosink when building with multimedia support.

See:
https://github.com/WebKit/WebKit/blob/12086bcde7a296a07dbb4ac6d2ff0030b297305a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamer.cpp#L3863

Additionally webkit may also use the fpsdisplaysink element which
is also provided by debugutils.

See:
https://github.com/WebKit/WebKit/blob/12086bcde7a296a07dbb4ac6d2ff0030b297305a/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamer.cpp#L3897

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e82614287407f18c1029bb26e49b0bcdbea2bf95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 1 +
 package/wpewebkit/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bc8207d93b..eb2ebb9de0 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -91,6 +91,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 36523bdb41..ecf5c40313 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -84,6 +84,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
