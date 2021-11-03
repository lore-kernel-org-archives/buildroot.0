Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAC0C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:40:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62574610A8
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62574610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 296A0403A5;
	Wed,  3 Nov 2021 21:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0tbhOdzBAc0; Wed,  3 Nov 2021 21:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E7B2403A7;
	Wed,  3 Nov 2021 21:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25A781BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14FF6404DB
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TX4eGe_VXgL9 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:40:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7BBF40480
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:40:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7E0CE100004;
 Wed,  3 Nov 2021 21:40:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1miNzR-0006vC-Mv; Wed, 03 Nov 2021 22:40:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 22:40:10 +0100
Message-Id: <20211103214012.26524-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: drop 5.13.x headers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 5.13.x series is now EOL, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 23c3ee29ee..9e0a41574a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -213,6 +213,13 @@ config BR2_KERNEL_HEADERS_5_12
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
