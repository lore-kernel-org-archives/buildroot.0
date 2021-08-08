Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0730EC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF06260EB9
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF06260EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 864FE82D96;
	Sun,  8 Aug 2021 19:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40xaa6aoC9tn; Sun,  8 Aug 2021 19:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3B77827FD;
	Sun,  8 Aug 2021 19:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD1B1BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFF2782CC7
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bargZ_1RV-4y for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 846C382CE4
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A8D28D254; Sun,  8 Aug 2021 19:33:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:27:42 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: a243b96d07765076ed20f112611ab1964cfcd7ed
X-Git-Newrev: 2c851a1048c7325a26ad26c7db1b6b56de7a46bf
X-Patchwork-Hint: ignore
Message-Id: <20210808193333.4A8D28D254@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/guile: fix build
 on riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c851a1048c7325a26ad26c7db1b6b56de7a46bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix the following build failure on riscv32:

system/base/target.scm:132:16: In procedure triplet-pointer-size:
unknown CPU word size "riscv32"

Fixes:
 - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 55f1afe6db597ed5d943d57d0b6acf1bbfb77a34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...le-system-base-target.scm-support-riscv32.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
new file mode 100644
index 0000000000..a988d2d995
--- /dev/null
+++ b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
@@ -0,0 +1,33 @@
+From 6142350d7c0562b0525462abdd41309ae0faa2eb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 6 Aug 2021 19:49:37 +0200
+Subject: [PATCH] module/system/base/target.scm: support riscv32
+
+Fix the following build failure on riscv32:
+
+system/base/target.scm:132:16: In procedure triplet-pointer-size:
+unknown CPU word size "riscv32"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ module/system/base/target.scm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/module/system/base/target.scm b/module/system/base/target.scm
+index 2088cd866..dba46664d 100644
+--- a/module/system/base/target.scm
++++ b/module/system/base/target.scm
+@@ -116,6 +116,7 @@
+ 
+           ((string-match "^x86_64-.*-gnux32" triplet) 4)  ; x32
+ 
++          ((string-match "32$" cpu) 4)
+           ((string-match "64$" cpu) 8)
+           ((string-match "64_?[lbe][lbe]$" cpu) 8)
+           ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
