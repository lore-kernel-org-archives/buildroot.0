Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0487EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:57:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC5E260E08
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC5E260E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A09C40521;
	Wed,  3 Nov 2021 21:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jegSzCMgWtIh; Wed,  3 Nov 2021 21:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA252404E3;
	Wed,  3 Nov 2021 21:57:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA0281BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8FA0403AC
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ImLPdhkkxDGw for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:57:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4EAC40165
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:57:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E9A028A4F5; Wed,  3 Nov 2021 21:53:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:56:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0080a09feeec2071f71cba4e411cf5585118ca2
X-Git-Newrev: e444baf8164094df4cbd0b8becbc2fa597cb950f
X-Patchwork-Hint: ignore
Message-Id: <20211103215319.E9A028A4F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 5.13.x headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=e444baf8164094df4cbd0b8becbc2fa597cb950f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.13.x series is now EOL, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 66a166a2a9..24d0dc1d51 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -222,6 +222,13 @@ config BR2_KERNEL_HEADERS_5_12
 	  Version 5.12.x of the Linux kernel headers are no longer
 	  maintained upstream and are now removed.
 
+config BR2_KERNEL_HEADERS_5_13
+	bool "kernel headers version 5.13.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.13.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 comment "Legacy options removed in 2021.08"
 
 config BR2_TARGET_GRUB2_BUILTIN_MODULES
diff --git a/linux/linux.hash b/linux/linux.hash
index e58f25ae3c..32fe47d096 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8  linux-5.15.tar.xz
 sha256  4dff4e96d4052195002538027f8a810411ba6116a41bff5575952702d509d06a  linux-5.14.14.tar.xz
-sha256  e877ec724e917c967603225c7e5dc21b6e0f34998c7d086cab8c50324363ab7b  linux-5.13.19.tar.xz
 sha256  0a2b2f5fefb90773190aaef4726ac363e03992aedc424b0a57eca092d084304b  linux-5.10.75.tar.xz
 sha256  cc0c0f902748d251cb22d0e69e3b8d260c447eb0072ef853da15da6cce775038  linux-5.4.155.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 12d2caa20a..3a25667ea0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -58,10 +58,6 @@ config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
-config BR2_KERNEL_HEADERS_5_13
-	bool "Linux 5.13.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
-
 config BR2_KERNEL_HEADERS_5_14
 	bool "Linux 5.14.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
@@ -384,7 +380,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.213"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.155"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.75"	if BR2_KERNEL_HEADERS_5_10
-	default "5.13.19"	if BR2_KERNEL_HEADERS_5_13
 	default "5.14.14"	if BR2_KERNEL_HEADERS_5_14
 	default "5.15"		if BR2_KERNEL_HEADERS_5_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
