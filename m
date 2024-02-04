Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271CEC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3670402F2;
	Sun,  4 Feb 2024 21:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3670402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5DaOAc_3B4d; Sun,  4 Feb 2024 21:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C38E040420;
	Sun,  4 Feb 2024 21:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38E040420
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E8751BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B1B60B51
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B1B60B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmX-5GEdBfLU for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:25:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8B2660741
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B2660741
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 938AC86931; Sun,  4 Feb 2024 21:25:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:18:58 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 42a271c32e4584c5b73561315825b5416cdf1819
X-Git-Newrev: 44faf672f3005b41b18318dce25a131177462936
X-Patchwork-Hint: ignore
Message-Id: <20240204212555.938AC86931@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/criu: disable on
 aarch64_be
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

commit: https://git.buildroot.net/buildroot/commit/?id=44faf672f3005b41b18318dce25a131177462936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

armv8a aarch64_be raises the following build failure since the addition
of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

Error (compel/arch/aarch64/src/lib/handle-elf-host.c:30): Unsupported Elf format detected

Fixes:
 - http://autobuild.buildroot.org/results/8eaa881a926d138a0bfd3f1076246088994e883f
 - http://autobuild.buildroot.org/results/8de9b4d6b26e06f6b4457a31366bdc0d8a8c34ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3825cc8a38d8cb5cf1d27557b890db099e81b39c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/criu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index 4c295acf4f..a5adc0cedd 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV6
 	default y if BR2_ARM_CPU_ARMV7A
 	default y if BR2_ARM_CPU_ARMV7M
-	default y if BR2_ARM_CPU_ARMV8A
+	default y if BR2_ARM_CPU_ARMV8A && !BR2_aarch64_be
 	default y if BR2_aarch64
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
