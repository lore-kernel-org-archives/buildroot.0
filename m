Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9F0C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF906610A1
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF906610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 919504011D;
	Thu, 19 Aug 2021 20:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TP6TOlL7Q_N4; Thu, 19 Aug 2021 20:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF379404F3;
	Thu, 19 Aug 2021 20:54:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10D441BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00A1E42506
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z41xOBG0vwcQ for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:54:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EFFC4046E
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:54:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2BCBF8D5E7; Thu, 19 Aug 2021 20:54:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:54:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 709004563b200a6b9456143de9722d99f4c5054b
X-Git-Newrev: 595209da939022e01515bb274fba4f1eb62cb9ca
X-Patchwork-Hint: ignore
Message-Id: <20210819205405.2BCBF8D5E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 4.19.198-cip54
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

commit: https://git.buildroot.net/buildroot/commit/?id=595209da939022e01515bb274fba4f1eb62cb9ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP to version 4.19.198-cip54.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ef52373291..f10fab8c75 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.13)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.182-cip45)"
+	bool "Latest CIP SLTS version (4.19.198-cip54)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,7 +126,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.13.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index ee76ce8a24..a834fbf31e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -10,7 +10,7 @@ sha256  21edb57dea0fe04a51fcfb6d4e8c0c052787a20015bc74a0a0e63329601f2e07  linux-
 sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-4.14.243.tar.xz
 sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
 # Locally computed
-sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
+sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
 
 # Licenses hashes
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
