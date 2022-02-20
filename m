Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374E3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE17F404C9;
	Sun, 20 Feb 2022 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UquhGufzrMEX; Sun, 20 Feb 2022 22:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 259F7404D0;
	Sun, 20 Feb 2022 22:20:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13E8E1BF393
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0223481403
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQchs_TjqimM for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 22:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5844A81434
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 22:20:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 738C78348D; Sun, 20 Feb 2022 22:12:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 23:18:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aeb138911e773cf4011b81fc4fcec0037f366bb1
X-Git-Newrev: 3780409bfdb59dae2573f36293f53139132aa5e3
X-Patchwork-Hint: ignore
Message-Id: <20220220221236.738C78348D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mach64:
 don't override XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=3780409bfdb59dae2573f36293f53139132aa5e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS is wrongly overridden in a
conditional since commit cf26ae7dd14f35dd917811f5a23c54a19ea6ed07

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index e6f8d7471c..eee8fec2e8 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -13,7 +13,7 @@ XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
-XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS = --disable-dri
+XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
