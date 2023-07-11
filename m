Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753ABEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004B441E7D;
	Tue, 11 Jul 2023 21:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 004B441E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZGaBTjRaR4v; Tue, 11 Jul 2023 21:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B1E41E8A;
	Tue, 11 Jul 2023 21:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B1E41E8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 712C81BF95F
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4745E41E77
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4745E41E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h__aRYhM4NdE for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68D8A41E76
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68D8A41E76
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55A1A86E37; Tue, 11 Jul 2023 21:02:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:02:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2d37c58f274ae25b963fec53aa2d5a057527af5
X-Git-Newrev: c8cc28b5ced34677a39de8e7bcc9a96d6e8df9fe
X-Patchwork-Hint: ignore
Message-Id: <20230711210244.55A1A86E37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: force arm mode instead of
 Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8cc28b5ced34677a39de8e7bcc9a96d6e8df9fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
