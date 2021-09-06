Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F05DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE56360F6E
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE56360F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB8FB60883;
	Mon,  6 Sep 2021 14:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FpfGHTGkDR0p; Mon,  6 Sep 2021 14:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94BE6089F;
	Mon,  6 Sep 2021 14:53:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 557F11BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FD28401FC
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7sDd-RGZeiz for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4009D40410
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:50:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A118E886B5; Mon,  6 Sep 2021 14:49:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 16:46:55 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 88f54ebf54e78a50d41e0c863dd8c2c7fe5ea2f2
X-Git-Newrev: 9d341ef2ec2bb89d6b368a53ec6a97df4b8448d2
X-Patchwork-Hint: ignore
Message-Id: <20210906144908.A118E886B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] linux: bump CIP RT kernel
 to version 4.19.198-cip54-rt21
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d341ef2ec2bb89d6b368a53ec6a97df4b8448d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

This patch bumps Linux CIP RT to version 4.19.198-cip54-rt21

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 835ea5b94cde2b297da88a1653cf517fcb1b0db9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index cd1c50ba15..b2f971c099 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -50,7 +50,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.165-cip41-rt18)"
+	bool "Latest CIP RT SLTS version (4.19.198-cip54-rt21)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -127,7 +127,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.12.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 0b9d32c9b8..b63eb4939d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-
 sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
-sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
+sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
