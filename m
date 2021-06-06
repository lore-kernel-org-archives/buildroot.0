Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029C4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C362660F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C362660F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9FB83D50;
	Tue,  3 Aug 2021 22:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCdVhrTv6T97; Tue,  3 Aug 2021 22:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0BCF83D51;
	Tue,  3 Aug 2021 22:57:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 101301BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 640EE4057E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSIvyOVfERAI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEF2D4060F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 52D48864A8; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 09:52:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11e8ced584068ce0e15ea6b1af117aa12d423126
X-Git-Newrev: 8e3d620251b33164eaaf72a221d11ff21b440614
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.52D48864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: Fix build for
 mips
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8e3d620251b33164eaaf72a221d11ff21b440614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/079/079df777211933b92ac5a67fc175839c8188850f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/ffmpeg/0003-libavutil-Fix-mips-build.patch b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
new file mode 100644
index 0000000000..7af01463e8
--- /dev/null
+++ b/package/ffmpeg/0003-libavutil-Fix-mips-build.patch
@@ -0,0 +1,72 @@
+From 6e8daf0d502a2a822f1f08f42368d7d676dc1a9e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 6 Jun 2021 08:54:53 +0200
+Subject: [PATCH] libavutil: Fix mips build
+
+Check for sys/auxv.h because not all toolchains contain this header.
+
+Fixes https://trac.ffmpeg.org/ticket/9138
+
+Patch sent upstream:
+http://ffmpeg.org/pipermail/ffmpeg-devel/2021-June/281037.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure            | 2 ++
+ libavutil/mips/cpu.c | 6 +++---
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 82367fd30d..b0154cb8b2 100755
+--- a/configure
++++ b/configure
+@@ -2161,6 +2161,7 @@ HEADERS_LIST="
+     opencv2_core_core_c_h
+     OpenGL_gl3_h
+     poll_h
++    sys_auxv_h
+     sys_param_h
+     sys_resource_h
+     sys_select_h
+@@ -6210,6 +6211,7 @@ check_func_headers VideoToolbox/VTCompressionSession.h VTCompressionSessionPrepa
+ check_headers windows.h
+ check_headers X11/extensions/XvMClib.h
+ check_headers asm/types.h
++check_headers sys/auxv.h
+ 
+ # it seems there are versions of clang in some distros that try to use the
+ # gcc headers, which explodes for stdatomic
+diff --git a/libavutil/mips/cpu.c b/libavutil/mips/cpu.c
+index 59619d54de..4738104cdd 100644
+--- a/libavutil/mips/cpu.c
++++ b/libavutil/mips/cpu.c
+@@ -19,7 +19,7 @@
+ #include "libavutil/cpu.h"
+ #include "libavutil/cpu_internal.h"
+ #include "config.h"
+-#if defined __linux__ || defined __ANDROID__
++#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -28,7 +28,7 @@
+ #include "libavutil/avstring.h"
+ #endif
+ 
+-#if defined __linux__ || defined __ANDROID__
++#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
+ 
+ #define HWCAP_LOONGSON_CPUCFG (1 << 14)
+ 
+@@ -105,7 +105,7 @@ static int cpu_flags_cpuinfo(void)
+ 
+ int ff_get_cpu_flags_mips(void)
+ {
+-#if defined __linux__ || defined __ANDROID__
++#if (defined __linux__ || defined __ANDROID__) && defined(HAVE_SYS_AUXV_H)
+     if (cpucfg_available())
+         return cpu_flags_cpucfg();
+     else
+-- 
+2.29.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
