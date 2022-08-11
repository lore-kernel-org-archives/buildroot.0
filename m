Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437AAC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E27D240BEB;
	Thu, 11 Aug 2022 17:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27D240BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGsfxRXlvTUA; Thu, 11 Aug 2022 17:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE42240BF4;
	Thu, 11 Aug 2022 17:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE42240BF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3842D1BF35F
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1048E81A3B
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1048E81A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnJY5Dgih7Xl for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3498481497
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3498481497
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7A80987161; Thu, 11 Aug 2022 17:19:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 19:30:05 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 21bc60581559bd74a3e93cf804745fbbb52066fa
X-Git-Newrev: ecfbd3d8409f34c38416fd365eced8097868b6ac
X-Patchwork-Hint: ignore
Message-Id: <20220811171916.7A80987161@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/{webkitgtk,
 wpewebkit}: select audiofx for multimedia
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecfbd3d8409f34c38416fd365eced8097868b6ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When using webkit with multimedia support the scaletempo element may
be needed, select the audiofx plugin which provides scaletempo.

Fixes runtime warning:
createGSTPlayBin: Failed to create scaletempo

See:
https://github.com/WebKit/WebKit/blob/72b59ad50e079037073722bbdf469c0952e399fa/Source/WebCore/platform/graphics/gstreamer/MediaPlayerPrivateGStreamer.cpp#L2813

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fb77daa909a83d1d5815c27af0900a1b2eb79cc1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 1 +
 package/wpewebkit/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index eb2ebb9de0..2c255693c9 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -103,6 +103,7 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index ecf5c40313..73ac94a47b 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -96,6 +96,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
