Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8760C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 06:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4579F85482;
	Mon, 30 Oct 2023 06:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4579F85482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9khtm4fBPiN; Mon, 30 Oct 2023 06:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 947118547E;
	Mon, 30 Oct 2023 06:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 947118547E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBF91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 06:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23D2870A7D
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 06:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D2870A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwYTGF0GOnlX for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 06:41:06 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B55E370A77
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 06:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B55E370A77
Received: from fli4l.lan.fli4l (p54a1b0b0.dip0.t-ipconnect.de [84.161.176.176])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47972A4C07D5;
 Mon, 30 Oct 2023 07:41:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47582)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qxLxN-0006rU-2V;
 Mon, 30 Oct 2023 07:41:01 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 07:41:01 +0100
Message-Id: <20231030064101.362244-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030064101.362244-1-bernd@kuhls.net>
References: <20231030064101.362244-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698648062;
 bh=20yD/5wzARh4ekt6D6NaMGx+Uaj0nOScs/Q09yCVAHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7ayzKsYsfMQMUL8QlbS2jCFMuBVbRH4LCibewfHUlFuK3akVHcDRx8jRHvUH1BbO
 RtKG7g9H8Bdp/hf77XO1mhvO9zk8Ft5OfmpzFx2DrARe6iPEVsHOJL78m0Bz7Tikjv
 Z2FAK5yTXEzcFelLA6g9hZUV/kSU869fQUV9B+BYgA1wYypFd7jffciuVYoT45cjTf
 f0MOf8nhDhK3Et9s4TsWy+h33U1tgWpJs5PryqiE15Yu18hJJjWQ+OCq9wOF3+OIrU
 gjI+kXcXysDWV78lS/CBcmDEQb3p5WQGjiW7pz9PMPIiUbjycN9IKC1gfm2P2OtUkX
 NQzJi1MzvvP+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=l7ayzKsY
Subject: [Buildroot] [PATCH 2/2] linux: bump latest version to 6.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 195b0dc00e..f0951df7a2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.5)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.6)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
