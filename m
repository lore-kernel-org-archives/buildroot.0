Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20743C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4C7961463;
	Fri, 25 Aug 2023 13:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4C7961463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZXAFkibOYYC; Fri, 25 Aug 2023 13:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074CB61465;
	Fri, 25 Aug 2023 13:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 074CB61465
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9DB31BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90B5061463
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90B5061463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FyGpo3JUSbG for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDEC260FE0
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDEC260FE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB75486317; Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:20:41 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 39245bdd908fac9742148fad8cd7487367a267b9
X-Git-Newrev: 872d1ca1cc15a0f7df924371c7db31d2e64bf5c8
X-Patchwork-Hint: ignore
Message-Id: <20230825132221.BB75486317@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/ffmpeg: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=872d1ca1cc15a0f7df924371c7db31d2e64bf5c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix the following build failure:
/tmp/ccw5V2Ti.s: Assembler messages:
/tmp/ccw5V2Ti.s:2013: Error: selected processor does not support `itt gt' in Thumb mode
/tmp/ccw5V2Ti.s:2014: Error: Thumb does not support conditional execution
/tmp/ccw5V2Ti.s:2015: Error: Thumb does not support conditional execution
/tmp/ccw5V2Ti.s:2017: Error: selected processor does not support `it le' in Thumb mode
/tmp/ccw5V2Ti.s:2018: Error: Thumb does not support conditional execution
/tmp/ccw5V2Ti.s:2020: Error: selected processor does not support `it gt' in Thumb mode
/tmp/ccw5V2Ti.s:2021: Error: Thumb does not support conditional execution

Fixes:
http://autobuild.buildroot.net/results/3fc/3fc68f756cf1661673941c411c4a2477e901e361/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c8cc28b5ced34677a39de8e7bcc9a96d6e8df9fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9d9209706a..ce285bcc60 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -554,6 +554,10 @@ FFMPEG_CONF_OPTS += --disable-optimizations
 FFMPEG_CFLAGS += -O0
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+FFMPEG_CFLAGS += -marm
+endif
+
 FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)"
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
