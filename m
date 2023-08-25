Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC009C71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7877D60B8A;
	Fri, 25 Aug 2023 13:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7877D60B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uljcq0qU2z5A; Fri, 25 Aug 2023 13:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8422606CB;
	Fri, 25 Aug 2023 13:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8422606CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7EC01BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E5383BAD
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92E5383BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXSed5so3ne3 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:23:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C689A83BA2
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C689A83BA2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B61168631F; Fri, 25 Aug 2023 13:23:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:20:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d77b2404c522cee86b5f137f45fc23be354186bf
X-Git-Newrev: 00ab747055d0583aac073b8c2dac8625dabd348a
X-Patchwork-Hint: ignore
Message-Id: <20230825132327.B61168631F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/ffmpeg: force arm
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

commit: https://git.buildroot.net/buildroot/commit/?id=00ab747055d0583aac073b8c2dac8625dabd348a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
