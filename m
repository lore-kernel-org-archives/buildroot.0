Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614E2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2266130D;
	Thu, 26 May 2022 08:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEbid-Ww_Ywr; Thu, 26 May 2022 08:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4587060FB2;
	Thu, 26 May 2022 08:21:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCB61BF9AD
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EBFD42561
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q432OOpiAth8 for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 602F04255A
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C4925864E2; Thu, 26 May 2022 08:09:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:10:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4c62bd927cab5e689ccef311d0f700e156db20b5
X-Git-Newrev: 3ea6d6dd9c7d93f391b85d0abefabe49b472fdc3
X-Patchwork-Hint: ignore
Message-Id: <20220526080925.C4925864E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/shim: add
 BR2_PACKAGE_SHIM_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ea6d6dd9c7d93f391b85d0abefabe49b472fdc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add BR2_PACKAGE_SHIM_ARCH_SUPPORTS as requested by Thomas Petazzoni in
https://patchwork.ozlabs.org/project/buildroot/patch/20220419121409.2055818-1-fontaine.fabrice@gmail.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: reorder options according to check-package]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fd5842a1dd03642b2ea0844396b2348f7f0f39f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/shim/Config.in | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/boot/shim/Config.in b/boot/shim/Config.in
index b0e549a51b..c4f1a9f317 100644
--- a/boot/shim/Config.in
+++ b/boot/shim/Config.in
@@ -1,8 +1,15 @@
-config BR2_TARGET_SHIM
-	bool "shim"
+config BR2_PACKAGE_SHIM_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_x86_64
 	# it includes gnu-efi
 	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
-	depends on !BR2_mips64el
+
+config BR2_TARGET_SHIM
+	bool "shim"
+	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
 	help
 	  Boot loader to chain-load signed boot loaders under Secure
 	  Boot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
