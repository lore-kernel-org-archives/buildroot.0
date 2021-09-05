Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BE4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:05:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E770360F12
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E770360F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC181403A6;
	Sun,  5 Sep 2021 14:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWfvLuSeh-u3; Sun,  5 Sep 2021 14:05:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1899540394;
	Sun,  5 Sep 2021 14:05:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C35E31BF392
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB04E402A4
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmSv75Z0l94O for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 14:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C15ED40275
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 14:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9DF58885FF; Sun,  5 Sep 2021 14:03:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Sep 2021 16:03:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7744f8f35035e411026838515121c925235a46e1
X-Git-Newrev: fdcef80189d484225ff6fb709246d3bbbf5772a0
X-Patchwork-Hint: ignore
Message-Id: <20210905140318.9DF58885FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox-player: add vivante fb
 default
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdcef80189d484225ff6fb709246d3bbbf5772a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB is selected, the native windowing
will be set to vivante frame buffer.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 8ab668d260..02d4c442ed 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -60,6 +60,7 @@ choice
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL    if BR2_PACKAGE_WAYLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11   if BR2_PACKAGE_XORG7
 	help
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
