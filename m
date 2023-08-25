Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8333AC71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA1561451;
	Fri, 25 Aug 2023 13:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA1561451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxnpUSAFaRSP; Fri, 25 Aug 2023 13:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FBF261450;
	Fri, 25 Aug 2023 13:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FBF261450
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 910CF1BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 771AA61450
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 771AA61450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oHR35PiQHzzR for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C68B660AE6
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C68B660AE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2CBC86316; Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:18:23 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 3782ce82913ab50ce250f56590e22c7b5cd5c3f5
X-Git-Newrev: 39245bdd908fac9742148fad8cd7487367a267b9
X-Patchwork-Hint: ignore
Message-Id: <20230825132221.B2CBC86316@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/ffmpeg: mmal is
 not available on aarch64
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

commit: https://git.buildroot.net/buildroot/commit/?id=39245bdd908fac9742148fad8cd7487367a267b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/aa5/aa589b38e1591a0ec4d400891bf86f5138cf4542/

For details see:
https://lists.buildroot.org/pipermail/buildroot/2023-July/669839.html
https://github.com/raspberrypi/userland/issues/688

Reported-by: Guillermo G <ggalan3@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c2d37c58f274ae25b963fec53aa2d5a057527af5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 59e13b503e..9d9209706a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -282,9 +282,14 @@ FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-FFMPEG_CONF_OPTS += --enable-mmal --enable-omx --enable-omx-rpi \
+FFMPEG_CONF_OPTS += --enable-omx --enable-omx-rpi \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/IL
 FFMPEG_DEPENDENCIES += rpi-userland
+ifeq ($(BR2_arm),y)
+FFMPEG_CONF_OPTS += --enable-mmal
+else
+FFMPEG_CONF_OPTS += --disable-mmal
+endif
 else
 FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
