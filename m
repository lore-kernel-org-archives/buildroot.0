Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E5FC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0DBE60231
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0DBE60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE366614AF;
	Thu, 26 Aug 2021 22:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkDv4FQS3ZzL; Thu, 26 Aug 2021 22:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83BEA614B7;
	Thu, 26 Aug 2021 22:11:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 785D31BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 287DD40784
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQiM1p6bGVCu for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECC5440767
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5B2838DC52; Thu, 26 Aug 2021 22:01:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 09:21:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f4961dea504bcc999988b174466423eb72052a6e
X-Git-Newrev: 55f1afe6db597ed5d943d57d0b6acf1bbfb77a34
X-Patchwork-Hint: ignore
Message-Id: <20210826220127.5B2838DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/guile: fix build on
 riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=55f1afe6db597ed5d943d57d0b6acf1bbfb77a34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure on riscv32:

system/base/target.scm:132:16: In procedure triplet-pointer-size:
unknown CPU word size "riscv32"

Fixes:
 - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
