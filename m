Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BE4C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21A3240921;
	Thu, 10 Feb 2022 21:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9K2F-HOFkgd; Thu, 10 Feb 2022 21:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A6FD40142;
	Thu, 10 Feb 2022 21:54:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBB2B1BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 810C781D19
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMzl0wXOrk6B for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F1C482F32
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F108828EF; Thu, 10 Feb 2022 21:44:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:47:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68f93d3a8a6400190e6dc6bba691317062bf18b7
X-Git-Newrev: 2db52eed25f20bf0b56a6fa146f384c9139d8f83
X-Patchwork-Hint: ignore
Message-Id: <20220210214420.4F108828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-bayer2rgb-neon: fix
 plugin install
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

commit: https://git.buildroot.net/buildroot/commit/?id=2db52eed25f20bf0b56a6fa146f384c9139d8f83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fix plugin install path, add '-with-plugindir=/usr/lib/gstreamer-1.0',
  otherwise the plugins are installed with duplicated build path
  (as detected by step_check_build_dir)

- remove GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING (no need to install
  the plugin to staging)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index 815099e315..0d4aeac7f5 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -10,8 +10,6 @@ GST1_PLUGINS_BAYER2RGB_NEON_SITE_METHOD = git
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
 
-GST1_PLUGINS_BAYER2RGB_NEON_INSTALL_STAGING = YES
-
 GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
 	host-pkgconf \
 	gstreamer1 \
@@ -20,4 +18,6 @@ GST1_PLUGINS_BAYER2RGB_NEON_DEPENDENCIES = \
 
 GST1_PLUGINS_BAYER2RGB_NEON_AUTORECONF = YES
 
+GST1_PLUGINS_BAYER2RGB_NEON_CONF_OPTS = --with-plugindir=/usr/lib/gstreamer-1.0
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
