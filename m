Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3898DC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FAD470CB5;
	Fri, 28 Feb 2025 17:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUGolCNcGsPZ; Fri, 28 Feb 2025 17:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB6470CB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAB6470CB0;
	Fri, 28 Feb 2025 17:17:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F12268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E17F4445A5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnfr029fSJyD for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4967F44BA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4967F44BA4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42E0487AD6; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 21:40:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 756012d25740b36f24ed1e6dde91de357ed4f010
X-Git-Newrev: 670c9786512655f62ca50833917a8616a1bd5829
X-Patchwork-Hint: ignore
Message-Id: <20250228163038.42E0487AD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: fix armv5te
 build with binutils 2.43
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
Content-Type: multipart/mixed; boundary="===============3098922648990025936=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3098922648990025936==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=670c9786512655f62ca50833917a8616a1bd5829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============3098922648990025936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3098922648990025936==--
