Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4651C4828E
	for <buildroot@archiver.kernel.org>; Fri,  2 Feb 2024 19:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46F1D80C2D;
	Fri,  2 Feb 2024 19:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46F1D80C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrZ7-kfa_lmN; Fri,  2 Feb 2024 19:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E04D80B59;
	Fri,  2 Feb 2024 19:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E04D80B59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2B411BF3C3
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 19:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92BA2804C0
 for <buildroot@lists.busybox.net>; Fri,  2 Feb 2024 19:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92BA2804C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xdc3ZcNQA2-K for <buildroot@lists.busybox.net>;
 Fri,  2 Feb 2024 19:30:05 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 361D28002A
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 19:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 361D28002A
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6180FA4C00B7
 for <buildroot@buildroot.org>; Fri,  2 Feb 2024 20:29:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34504)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rVzED-000000007iE-0RS1
 for buildroot@buildroot.org; Fri, 02 Feb 2024 20:29:33 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Feb 2024 20:29:33 +0100
Message-Id: <20240202192933.53122-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706902173;
 bh=VoMZELAcLV/QPhNcQWkrnFClAtEttNK/XReyGDgCw4Y=;
 h=From:To:Subject:Date:From;
 b=dphiI0sMXSxHIN/lhj7bUXwYd93Z7ZrPFXLjbwDsL2gHxFKTuxjoKqlpzUIfnjwqn
 Aa0xypDtKRxLQn/cCbD1ijgvpeIGs6uYfXhZPfOIUPTC1+lXtEoMIrxPu8k+TKKEJx
 eV4xT0vBBPmDX7EopVESj3PaiYyvZm+f8b/vAoN/FKSMleIr0C5zOfzVM0Ng/+8rlo
 n971Xi4WuEFPvG/+p0NUPOdT1JX3ZGrnJ3IR1ccBYIPt0f4EI9yox33yoIu+c5H5cI
 IUIsldIiR+mMMEsgTWq/LX2tLBRV6Q9S8hrX4L6yAuM22XBI1ioq9BzJzOZ5ixp5Kb
 TsFze1y9hgcbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=dphiI0sM
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1,
 6}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 662bd09162..da22b439e3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d7082aa629..10edcc2ed9 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fbe96b2db3f962cd2a96a849d554300e7a4555995160082d4f323c2a1dfa1584  linux-6.6.14.tar.xz
-sha256  6cd19410330c13ec4c18fd28a83d3e40fc12a152815fb7c3e1b0764329093a56  linux-6.1.75.tar.xz
+sha256  ab290c7f8687f2f8af96e14abd0700ba8b282426151873690f51621d8d5f5faa  linux-6.6.15.tar.xz
+sha256  0580cc0e81ff9aee245f79531d8c1c5c7d711eee227cd4cf52d1ff335727b1fd  linux-6.1.76.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c48575c97fd9f4767cbe50a13b1b2b40ee42830aba3182fabd35a03259a6e5d8  linux-5.15.148.tar.xz
 sha256  44e22fad647c638726a8eae23703c4263bead612d17c89ca7ad7ab32b5ce88d5  linux-5.10.209.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bf55c8714a..a0e572adc0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -407,8 +407,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.75"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.14"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.76"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.15"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
