Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C94DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:50:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4739F6056B
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4739F6056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B08A4054B;
	Tue,  3 Aug 2021 22:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o99PsT1Am4ya; Tue,  3 Aug 2021 22:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAD6B40542;
	Tue,  3 Aug 2021 22:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20D8E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95B7A4060B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSHzaMb1PkcB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A50340552
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CA8D1843F5; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 25 May 2021 21:27:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f79b1cb93757e23d74e748f94f15a65b363f887
X-Git-Newrev: 52b875d3ac84c84c16fefe19cfec465697bffecb
X-Patchwork-Hint: ignore
Message-Id: <20210803210945.CA8D1843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libopenh264: fix
 mips32 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=52b875d3ac84c84c16fefe19cfec465697bffecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure with mips32 which is raised since the addition of
bootlin toolchains

Fixes:
 - http://autobuild.buildroot.org/results/cba3e9d0fd061cc3a92cb732bcdc2c7b66dbf6cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...common-inc-asmdefs_mmi.h-fix-mips32-build.patch | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch b/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch
new file mode 100644
index 0000000000..e11b1d13ef
--- /dev/null
+++ b/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch
@@ -0,0 +1,89 @@
+From c505f81e336088b6729a5407a03459f488353288 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 24 May 2021 22:54:01 +0200
+Subject: [PATCH] codec/common/inc/asmdefs_mmi.h: fix mips32 build
+
+Fix the following build failure on mips32 which is raised since version
+2.0.0 and
+https://github.com/cisco/openh264/commit/b13e5bceb18ebb93d0313b46aab4af6f480ca933:
+
+codec/common/mips/copy_mb_mmi.c: In function 'WelsCopy16x16_mmi':
+./codec/common/inc/asmdefs_mmi.h:293:21: error: '_ABI64' undeclared (first use in this function)
+  293 |    if (_MIPS_SIM == _ABI64)                                    \
+      |                     ^~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cba3e9d0fd061cc3a92cb732bcdc2c7b66dbf6cb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/cisco/openh264/pull/3384]
+---
+ codec/common/inc/asmdefs_mmi.h | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/codec/common/inc/asmdefs_mmi.h b/codec/common/inc/asmdefs_mmi.h
+index 69a7ae39..5d1aed93 100644
+--- a/codec/common/inc/asmdefs_mmi.h
++++ b/codec/common/inc/asmdefs_mmi.h
+@@ -288,9 +288,9 @@
+ /**
+  * backup register
+  */
++#if defined(_ABI64) && _MIPS_SIM == _ABI64
+ #define BACKUP_REG \
+    double __attribute__((aligned(16))) __back_temp[8];         \
+-   if (_MIPS_SIM == _ABI64)                                    \
+    __asm__ volatile (                                          \
+      "gssqc1       $f25,      $f24,       0x00(%[temp])  \n\t" \
+      "gssqc1       $f27,      $f26,       0x10(%[temp])  \n\t" \
+@@ -299,8 +299,10 @@
+      :                                                         \
+      : [temp]"r"(__back_temp)                                  \
+      : "memory"                                                \
+-   );                                                          \
+-  else                                                         \
++   );
++#else
++#define BACKUP_REG \
++   double __attribute__((aligned(16))) __back_temp[8];         \
+    __asm__ volatile (                                          \
+      "gssqc1       $f22,      $f20,       0x00(%[temp])  \n\t" \
+      "gssqc1       $f26,      $f24,       0x10(%[temp])  \n\t" \
+@@ -309,12 +311,13 @@
+      : [temp]"r"(__back_temp)                                  \
+      : "memory"                                                \
+    );
++#endif
+ 
+ /**
+  * recover register
+  */
++#if defined(_ABI64) && _MIPS_SIM == _ABI64
+ #define RECOVER_REG \
+-   if (_MIPS_SIM == _ABI64)                                    \
+    __asm__ volatile (                                          \
+      "gslqc1       $f25,      $f24,       0x00(%[temp])  \n\t" \
+      "gslqc1       $f27,      $f26,       0x10(%[temp])  \n\t" \
+@@ -323,8 +326,9 @@
+      :                                                         \
+      : [temp]"r"(__back_temp)                                  \
+      : "memory"                                                \
+-   );                                                          \
+-   else                                                        \
++   );
++#else
++#define RECOVER_REG \
+    __asm__ volatile (                                          \
+      "gslqc1       $f22,      $f20,       0x00(%[temp])  \n\t" \
+      "gslqc1       $f26,      $f24,       0x10(%[temp])  \n\t" \
+@@ -333,6 +337,7 @@
+      : [temp]"r"(__back_temp)                                  \
+      : "memory"                                                \
+    );
++#endif
+ 
+ # define OK             1
+ # define NOTOK          0
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
