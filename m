Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ACBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E41E960AAB;
	Sun, 20 Feb 2022 21:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AcUO_oq09Y0; Sun, 20 Feb 2022 21:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 159B060C0C;
	Sun, 20 Feb 2022 21:29:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 170DE1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 690D14017C
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHzJU_De3WBA for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:29:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A3FD404C5
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:29:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 567BA821A5; Sun, 20 Feb 2022 21:21:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:28:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70980a154b18c5fe6db940faf36f07ee20e27a70
X-Git-Newrev: f6009ac821abf096ea8cb1010e3ed1e11f010b64
X-Patchwork-Hint: ignore
Message-Id: <20220220212127.567BA821A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-ati:
 don't override XDRIVER_XF86_VIDEO_ATI_CONF_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6009ac821abf096ea8cb1010e3ed1e11f010b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XDRIVER_XF86_VIDEO_ATI_CONF_OPTS is wrongly overridden in a conditional
since commit daa433bff6d2d9934705feacd3619a7618d13ae5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index f7aeba8ba6..edb8b11add 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -16,9 +16,9 @@ XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	xserver_xorg-server
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
-XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --enable-glamor
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS += --enable-glamor
 else
-XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
+XDRIVER_XF86_VIDEO_ATI_CONF_OPTS += --disable-glamor
 endif
 
 # xdriver_xf86-video-ati requires O_CLOEXEC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
