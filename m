Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BA3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:43:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 441C660FC0
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 441C660FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DCE182768;
	Sun, 12 Sep 2021 07:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpFnMdVVgnnm; Sun, 12 Sep 2021 07:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3E38272C;
	Sun, 12 Sep 2021 07:43:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 422861BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30DA140112
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-1PUJgqy72H for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:43:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A71400AF
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:43:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 605728A3AE; Sun, 12 Sep 2021 07:41:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 09:41:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e5a1f7757cbdc0c513e64e0652d7a132a01f092
X-Git-Newrev: 144acc313df5b0a21afb4a65e98377f0b3c63279
X-Patchwork-Hint: ignore
Message-Id: <20210912074129.605728A3AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 5.11.x /
 5.12.x headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=144acc313df5b0a21afb4a65e98377f0b3c63279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 5.11.x and 5.12.xx series are now EOL, so drop them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 14 ++++++++++++++
 linux/linux.hash                     |  2 --
 package/linux-headers/Config.in.host | 10 ----------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c550abf419..35a11f4dc6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,20 @@ config BR2_PACKAGE_GNURADIO_PAGER
 	help
 	  gr-flex has been removed from gnuradio since version 3.8.0.0.
 
+config BR2_KERNEL_HEADERS_5_11
+	bool "kernel headers version 5.11.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.11.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
+config BR2_KERNEL_HEADERS_5_12
+	bool "kernel headers version 5.12.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 5.12.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 comment "Legacy options removed in 2021.08"
 
 config BR2_PACKAGE_LIBMCRYPT
diff --git a/linux/linux.hash b/linux/linux.hash
index e042123438..76bb9fe001 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2  linux-5.14.tar.xz
 sha256  72fe7cc1f0363523061659a21e24754697b27f405cb88a41a63038629636159a  linux-5.13.9.tar.xz
-sha256  e9381cd3525a02f5b895f74147e2440be443ecd45484c6c64075046bc6f94c73  linux-5.12.19.tar.xz
-sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
 sha256  00bbaeaac17f82d9a6d93cbc42cafd39d3b2fa3a6087333503d2344fa5e3142d  linux-5.10.57.tar.xz
 sha256  0471d0ccb7953cdae7d235192588ac5d72344851969962676d1703e69084a37f  linux-5.4.139.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4dfd4a7845..7123caf65f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -58,14 +58,6 @@ config BR2_KERNEL_HEADERS_5_10
 	bool "Linux 5.10.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 
-config BR2_KERNEL_HEADERS_5_11
-	bool "Linux 5.11.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
-
-config BR2_KERNEL_HEADERS_5_12
-	bool "Linux 5.12.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
-
 config BR2_KERNEL_HEADERS_5_13
 	bool "Linux 5.13.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
@@ -384,8 +376,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.202"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.139"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.57"	if BR2_KERNEL_HEADERS_5_10
-	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
-	default "5.12.19"	if BR2_KERNEL_HEADERS_5_12
 	default "5.13.9"	if BR2_KERNEL_HEADERS_5_13
 	default "5.14"		if BR2_KERNEL_HEADERS_5_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
