Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1F0C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C1D605AC;
	Fri,  1 Mar 2024 08:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYo80Gh8szxm; Fri,  1 Mar 2024 08:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1DF606D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F1DF606D0;
	Fri,  1 Mar 2024 08:40:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5E51BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2817380E45
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nrf6JubEEhG for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6481080C41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6481080C41
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:40:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DB9D87E75; Fri,  1 Mar 2024 08:40:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 09:38:06 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a248e08917c24ec951eb31a33d98fe87b28a54bb
X-Git-Newrev: c4bfb4d799d25b523c2dfa7ac2f9e7fd8487f206
X-Patchwork-Hint: ignore
Message-Id: <20240301084001.5DB9D87E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/petitboot: fix
 ordering of comments and sub-options
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4bfb4d799d25b523c2dfa7ac2f9e7fd8487f206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Currently, the comment about availability is between the package main
symbol and its suboptions, breaking the threading in menuconfig.

Invert the order, and move the comment last. Also enclose the suboptions
between an if-block, as it is more customary.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 06dcbdf8ad3d55b92df4bc3ded82c08e21cbb60e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/Config.in | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 93ed3642c3..f931ab91cd 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -19,17 +19,20 @@ config BR2_PACKAGE_PETITBOOT
 
 	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
 
-comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /dev management"
-	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV
+if BR2_PACKAGE_PETITBOOT
 
 config BR2_PACKAGE_PETITBOOT_GETTY_PORT
 	string "TTY port(s)"
 	default "console"
-	depends on BR2_PACKAGE_PETITBOOT
 	help
 	  Specify a space-separated list of ports to run the petitboot
 	  UI on. Wildcards are allowed. Example: "hvc* ttys0 ttyS*"
+
+endif # BR2_PACKAGE_PETITBOOT
+
+comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /dev management"
+	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_PACKAGE_HAS_UDEV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
