Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19B1CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64892820EE;
	Sun,  7 Apr 2024 16:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AASowZZvC-7; Sun,  7 Apr 2024 16:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8FE81854
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F8FE81854;
	Sun,  7 Apr 2024 16:26:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6A81BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C81C40136
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYcpvGP0Hidr for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D5414018F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D5414018F
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 792738143C; Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:25:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47a02a5afcdf5d6a72d203c31dabd5727547057c
X-Git-Newrev: 2656ca8912e151e874ceb366e6eef0bfe4228ac0
X-Patchwork-Hint: ignore
Message-Id: <20240407162602.792738143C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmc: enable also for aarch64 QorIQ
 processors
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2656ca8912e151e874ceb366e6eef0bfe4228ac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QorIQ processors family also includes LS Series wich are based on aarch64

Signed-off-by: David Gouarin <dgouarin@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/fmc/Config.in   |  6 +++---
 package/fmlib/Config.in | 10 ++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/fmc/Config.in b/package/fmc/Config.in
index c89a87c99e..1c6ae5e80a 100644
--- a/package/fmc/Config.in
+++ b/package/fmc/Config.in
@@ -1,14 +1,14 @@
 comment "fmc needs a toolchain w/ C++"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 comment "fmc needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMC
 	bool "fmc"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LINUX_KERNEL # fmlib
 	select BR2_PACKAGE_TCLAP
diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 97d55d1250..459d5bf102 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -1,10 +1,10 @@
 comment "fmlib needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMLIB
 	bool "fmlib"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on BR2_LINUX_KERNEL
 	help
 	  The Frame Manager library provides Freescale PowerPC platforms
@@ -33,6 +33,10 @@ config BR2_FMLIB_QORIQ_FAMILY_T2080
 	bool "t208x"
 	depends on BR2_powerpc_e6500
 
+config BR2_FMLIB_QORIQ_FAMILY_ARM
+	bool "arm"
+	depends on BR2_aarch64
+
 endchoice
 
 config BR2_PACKAGE_FMLIB_ARCHTYPE
@@ -40,11 +44,13 @@ config BR2_PACKAGE_FMLIB_ARCHTYPE
 	default "ppce500mc" if BR2_powerpc_e500mc
 	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
 	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
+	default "arm" if BR2_aarch64
 
 config BR2_PACKAGE_FMLIB_PLATFORM
 	string
 	default "P4080" if BR2_FMLIB_QORIQ_FAMILY_P4080
 	default "T4240" if BR2_FMLIB_QORIQ_FAMILY_T4240
 	default "FMAN_V3H" if BR2_FMLIB_QORIQ_FAMILY_T2080
+	default "arm" if BR2_aarch64
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
