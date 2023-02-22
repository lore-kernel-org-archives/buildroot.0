Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A71EC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5293440516;
	Wed, 22 Feb 2023 17:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5293440516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvV65qA6mrTj; Wed, 22 Feb 2023 17:09:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72A0D41713;
	Wed, 22 Feb 2023 17:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72A0D41713
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8698F1BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7820E61162
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7820E61162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwT6WQCvLgrx for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A84EA61159
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A84EA61159
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99422867D3; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:47:45 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 693f779fe85292ae9cae612867afe4de05f3cfcc
X-Git-Newrev: 85dcee4664d8d293aeb16c116c374bf528975334
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.99422867D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcc: properly
 handle legacy for renamed ARC option
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

commit: https://git.buildroot.net/buildroot/commit/?id=85dcee4664d8d293aeb16c116c374bf528975334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "50332a530b gcc: rename option for ARC gcc" tried to add legacy
handling but the new symbol is part of a choice, and Kconfig does not
enforce the select of a option from a choice.

Update the legacy entry for 2016.11, following the example described in
the beginning of the file.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eb8f38891b16e5fb0f010c658b271e22670a1633)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           | 3 ++-
 package/gcc/Config.in.host | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6f5d01709a..47e2d48e58 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3809,10 +3809,11 @@ config BR2_LINUX_KERNEL_TOOL_SELFTESTS
 config BR2_GCC_VERSION_4_8_ARC
 	bool "gcc arc option renamed"
 	select BR2_LEGACY
-	select BR2_GCC_VERSION_ARC
 	help
 	  The option that selects the gcc version for the ARC
 	  architecture has been renamed to BR2_GCC_VERSION_ARC.
+# Note: BR2_GCC_VERSION_4_8_ARC is still referenced from
+# package/gcc/Config.in.host
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 84f7a71c9c..48aa8785f0 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,6 +2,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
+	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
 	default BR2_GCC_VERSION_10_X
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
