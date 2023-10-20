Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D09CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF02470560;
	Fri, 20 Oct 2023 17:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF02470560
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikxa9BdxSMDj; Fri, 20 Oct 2023 17:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9F7705B4;
	Fri, 20 Oct 2023 17:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D9F7705B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13C061BF488
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1770E84C2D
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 17:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1770E84C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUaFofl4Tbpt for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 17:46:54 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 833E3848D6
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 17:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833E3848D6
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8141AA4C00EC
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 19:46:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38808)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qttaF-0006zR-0s
 for buildroot@buildroot.org; Fri, 20 Oct 2023 19:46:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 20 Oct 2023 19:46:51 +0200
Message-Id: <20231020174651.370111-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697824011;
 bh=++TK9YkyekzH03bpT+0XQ6aqEqMAHm34iwVNTdUSREo=;
 h=From:To:Subject:Date:From;
 b=qc1sEJahoYWwNM63vnjtAuzPHVn8fKuOKDqGYxlEKRQeDWV7dKyCILYiqqC6+oyiQ
 DRSMMwJlKw46tww0Vm2AMtmUGIcmg6Sm1Zz35WaIwfAg8myJH0psmLTNvKzr9ebF8+
 Qze5lHxDndRIkjWhEXKfXEgufCtJWTWOxi8RIv0MuyQ7qmM+9O9Prk4fvxrz76rMkP
 Nb3cuY8oOKh+iaxQjORBzky8g/eo0IyOMlNcDyYYq8CdT3PXWWdAL54TgoXiiwem66
 rYN7N2zgLv9q5Src2X2K8EEdBLy5oA6WrUf8trYTcU1MOxxJ9i+7Xl39slUZnUPHzM
 TLDS61NwnaLlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=qc1sEJah
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
 5}.x series
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
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3aef7142c2..21313ded51 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.5.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.5.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c6e7ce858c..720598252b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0d09ea448005c9cfe5383e4c72a872b39188b928f8c44e146b03b1b7851fbb8c  linux-6.5.7.tar.xz
-sha256  ce987ed3d2f640b3a2a62a0a8573d538a36dfd3cc31e2d7a239ce5a16c1c21ad  linux-6.1.58.tar.xz
+sha256  299cca897d90deaa176eebec42f0a80eeb7516afed330a45c14da9de086cf717  linux-6.5.8.tar.xz
+sha256  627f7724c675036639290fb5c39e3fdeb3d566b80b192c45f4a808ab54c8c0a0  linux-6.1.59.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  14835e629e237f136cfed484fdb533c95242429809bdcdb2a2d66dfcb7447170  linux-5.15.135.tar.xz
+sha256  c624b9fe7ee4708d34cfd0b7ebc58037afac7463338cc498641ea31c55eeacb8  linux-5.15.136.tar.xz
 sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
 sha256  39701815a7a1b5ea4253db18e9327a45926a944499628d032da63c1bb6ea623e  linux-5.4.258.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c7d34d91cf..d48cfa3787 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -408,9 +408,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.296"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.135"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.58"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.7"		if BR2_KERNEL_HEADERS_6_5
+	default "5.15.136"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.59"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.8"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
