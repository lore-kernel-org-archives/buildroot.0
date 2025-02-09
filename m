Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2741DC0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 20:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0AC4403CF;
	Sun,  9 Feb 2025 20:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lR4Vb-BOMtu0; Sun,  9 Feb 2025 20:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C06B403F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C06B403F3;
	Sun,  9 Feb 2025 20:55:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA766C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA3C80CE9
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co8nQj-OyQVw for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 20:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D5FE80CEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D5FE80CEA
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:55:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15F4387469; Sun,  9 Feb 2025 20:55:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 21:40:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 756012d25740b36f24ed1e6dde91de357ed4f010
X-Git-Newrev: 670c9786512655f62ca50833917a8616a1bd5829
X-Patchwork-Hint: ignore
Message-Id: <20250209205515.15F4387469@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix armv5te build with
 binutils 2.43
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============2472292310548803887=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2472292310548803887==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=670c9786512655f62ca50833917a8616a1bd5829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build error occurs since binutils 2.43 was added to buildroot with
commit 800a033f7818a7799d4997aba28b9f8f5999871b

Fixes:
https://autobuild.buildroot.org/results/b5a/b5a782db574dfab7ae61e25291c05b1537c44c91/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...arm-mlpdsp_armv5te-fix-label-format-to-wo.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch b/package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
new file mode 100644
index 0000000000..178ffbc33b
--- /dev/null
+++ b/package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
@@ -0,0 +1,63 @@
+From 4c688845a50f7dce3af9afebe60f0f7a493c4f07 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 9 Aug 2024 11:32:00 +0100
+Subject: [PATCH] libavcodec/arm/mlpdsp_armv5te: fix label format to work with
+ binutils 2.43
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+binutils 2.43 has stricter validation for labels[1] and results in errors
+when building ffmpeg for armv5:
+
+src/libavcodec/arm/mlpdsp_armv5te.S:232: Error: junk at end of line, first unrecognized character is `0'
+
+Remove the leading zero in the "01" label to resolve this error.
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Martin StorsjÃ¶ <martin@martin.st>
+(cherry picked from commit 654bd47716c4f36719fb0f3f7fd8386d5ed0b916)
+
+Upstream: http://git.videolan.org/?p=ffmpeg.git;a=commit;h=4c688845a50f7dce3af9afebe60f0f7a493c4f07
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libavcodec/arm/mlpdsp_armv5te.S | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/arm/mlpdsp_armv5te.S b/libavcodec/arm/mlpdsp_armv5te.S
+index 4f9aa485fd..d31568611c 100644
+--- a/libavcodec/arm/mlpdsp_armv5te.S
++++ b/libavcodec/arm/mlpdsp_armv5te.S
+@@ -229,7 +229,7 @@ A .endif
+   .endif
+ 
+         // Begin loop
+-01:
++1:
+   .if TOTAL_TAPS == 0
+         // Things simplify a lot in this case
+         // In fact this could be pipelined further if it's worth it...
+@@ -241,7 +241,7 @@ A .endif
+         str     ST0, [PST, #-4]!
+         str     ST0, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
+         str     ST0, [PSAMP], #4 * MAX_CHANNELS
+-        bne     01b
++        bne     1b
+   .else
+     .if \fir_taps & 1
+       .set LOAD_REG, 1
+@@ -333,7 +333,7 @@ T       orr     AC0, AC0, AC1
+         str     ST3, [PST, #-4]!
+         str     ST2, [PST, #4 * (MAX_BLOCKSIZE + MAX_FIR_ORDER)]
+         str     ST3, [PSAMP], #4 * MAX_CHANNELS
+-        bne     01b
++        bne     1b
+   .endif
+         b       99f
+ 
+-- 
+2.30.2
+

--===============2472292310548803887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2472292310548803887==--
