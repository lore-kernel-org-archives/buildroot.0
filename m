Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6C3C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9494161083;
	Wed, 10 Jul 2024 21:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fwh4q0oCIsJs; Wed, 10 Jul 2024 21:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D46F761052
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D46F761052;
	Wed, 10 Jul 2024 21:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 393BC1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E869780DF3
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXnzPc0RJUEH for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2646A80DE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2646A80DE7
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11126847A0; Wed, 10 Jul 2024 21:44:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:38:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ceb7b971109f08ec2561d28172a37a61f7249f4
X-Git-Newrev: 04ed3f0aa06b0eb4424f4fbd37c4c5f962eee58c
X-Patchwork-Hint: ignore
Message-Id: <20240710214403.11126847A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbtools: allow 32-bit builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=04ed3f0aa06b0eb4424f4fbd37c4c5f962eee58c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the latest tbtools 32-bit builds should work too so drop this
limitation.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tbtools/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
index 9c27bf0e30..0f8980decf 100644
--- a/package/tbtools/Config.in
+++ b/package/tbtools/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_TBTOOLS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_HAS_UDEV
-	# Fails to build on 32-bit systems
-	depends on BR2_ARCH_IS_64
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  tbtools is a collection of tools for Linux Thunderbolt/USB4
@@ -14,5 +12,4 @@ config BR2_PACKAGE_TBTOOLS
 
 comment "tbtools needs udev /dev management w/ glibc toolchain"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	depends on BR2_ARCH_IS_64
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
