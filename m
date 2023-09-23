Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5C3CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 17:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D71B41836;
	Sat, 23 Sep 2023 17:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D71B41836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWFtHjL9ATqo; Sat, 23 Sep 2023 17:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BB84185E;
	Sat, 23 Sep 2023 17:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61BB84185E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1D81BF299
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CC3A41836
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CC3A41836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIi7O1GN97B0 for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 17:32:57 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8EB54185E
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 17:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8EB54185E
Received: from fli4l.lan.fli4l (p54a1bfc3.dip0.t-ipconnect.de [84.161.191.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E80CBA4C0E06;
 Sat, 23 Sep 2023 19:32:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38544)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk6Uu-0002RQ-1p;
 Sat, 23 Sep 2023 19:32:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 19:32:51 +0200
Message-Id: <20230923173252.3079114-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230923173252.3079114-1-bernd@kuhls.net>
References: <20230923173252.3079114-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695490372;
 bh=mcKZkWGePW5CHU5f/DrymF+YNTYIUKokZkvDUw8WgdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VfGAgr+O6H21OQ91q4gQWw8hlvNHswwjNcS6IRNNEvs+mDZA3MfpDFvPtjOJYYvnV
 XROEoTfKg9A72KXyserMP+qD7WcWY4W8/zjJB7RP6oUVJ7pyiMguc9JEgAyudugc10
 2uuIn9NQcY0sxFKy/EgYIuxgKugM7pG+uQgEewKqey4oLpdZlcYpZyImceCp4Aj3Q1
 1P0iYndjlDVmcCEl/PqGijJrGCDlwmuhhy7CHjcqOk6m3nmpFTFUlHvAIPW5I14mn3
 6bV/CjiL4QljagZ9tdipaaL6wbFObVFKGt9zq+7sPN5s5ZatVM9tXeN+G0PmWU9oy+
 IJh7dFF+f8psQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=VfGAgr+O
Subject: [Buildroot] [PATCH 3/4] linux: bump latest version to 6.5
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
index 7ddcf013f8..8dcc493e2e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.4)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_4 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.5)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_5 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.5.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
