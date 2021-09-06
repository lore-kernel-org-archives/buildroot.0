Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71237C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:51:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1475B60F43
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1475B60F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2A0B404A3;
	Mon,  6 Sep 2021 14:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oa3mWqBwbsC7; Mon,  6 Sep 2021 14:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23F5940489;
	Mon,  6 Sep 2021 14:51:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7734B1BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 677C66062F
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbWokZcbeUH1 for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:50:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6191A6060A
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D265D88697; Mon,  6 Sep 2021 14:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 16:45:57 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 2d7b00d4b6f60bc4915b85c095b064ead15c5988
X-Git-Newrev: 72c3599b0caf2f19eebdb421524dbc21cdfee39a
X-Patchwork-Hint: ignore
Message-Id: <20210906144903.D265D88697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] linux: bump CIP kernel to
 version 4.19.198-cip54
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

commit: https://git.buildroot.net/buildroot/commit/?id=72c3599b0caf2f19eebdb421524dbc21cdfee39a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This patch bumps Linux CIP to version 4.19.198-cip54.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 595209da939022e01515bb274fba4f1eb62cb9ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index be1a850cc4..360c3869fc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.10)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.182-cip45)"
+	bool "Latest CIP SLTS version (4.19.198-cip54)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,7 +126,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.10.57" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 2b0240e0ad..17e6693c49 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,7 +7,7 @@ sha256  21edb57dea0fe04a51fcfb6d4e8c0c052787a20015bc74a0a0e63329601f2e07  linux-
 sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-4.14.243.tar.xz
 sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
 # Locally computed
-sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
+sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
 
 # Licenses hashes
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
