Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58546EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5DB941E7A;
	Tue, 11 Jul 2023 21:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5DB941E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bphBUxHgQ_8H; Tue, 11 Jul 2023 21:02:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3AF741E77;
	Tue, 11 Jul 2023 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AF741E77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451FC1BF48B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E3944152B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3944152B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r46DbLCDIn7c for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 603A240452
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 603A240452
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BA3F86E35; Tue, 11 Jul 2023 21:02:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:02:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 665303586a1eddd08f44bfce2239a68e0c593810
X-Git-Newrev: c2d37c58f274ae25b963fec53aa2d5a057527af5
X-Patchwork-Hint: ignore
Message-Id: <20230711210244.4BA3F86E35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: mmal is not available on
 aarch64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2d37c58f274ae25b963fec53aa2d5a057527af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/aa5/aa589b38e1591a0ec4d400891bf86f5138cf4542/

For details see:
https://lists.buildroot.org/pipermail/buildroot/2023-July/669839.html
https://github.com/raspberrypi/userland/issues/688

Reported-by: Guillermo G <ggalan3@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
