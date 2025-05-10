Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A17C3ABC9
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 18:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C89B832B0;
	Sat, 10 May 2025 18:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFeM9RAFJrrN; Sat, 10 May 2025 18:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 417BF81F65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 417BF81F65;
	Sat, 10 May 2025 18:23:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D6EE0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA455608A5
 for <buildroot@buildroot.org>; Sat, 10 May 2025 18:23:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zE61WEjN7Qy for <buildroot@buildroot.org>;
 Sat, 10 May 2025 18:23:21 +0000 (UTC)
X-Greylist: delayed 331 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 10 May 2025 18:23:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 933BC607B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 933BC607B2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 933BC607B2
 for <buildroot@buildroot.org>; Sat, 10 May 2025 18:23:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a07c5.dip0.t-ipconnect.de [91.58.7.197])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5617DA4C01CC;
 Sat, 10 May 2025 20:17:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59184)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uDold-000000004zT-22Jt;
 Sat, 10 May 2025 18:17:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 May 2025 20:17:45 +0200
Message-Id: <20250510181745.1812058-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250510181745.1812058-1-bernd@kuhls.net>
References: <20250510181745.1812058-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746901066;
 bh=qDPD3+oD81rdnoifFYM2JsTg3Xe2GIPOdvPvNOIdyg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jcZrsNVavuUQ5vxuwq9uKNhZoEnA8IG8lcL6wkTY5x8hjZbc5xJmyj5x+eosk658R
 OUByih3dF88xK+90+4d5+NO8EDeMmEga0Rr1bPOnFq0MI/MZCg3Hw8WPuQhPT19P18
 19RSYKlcBut8Ys6J6X29e6CJsOpFJoKbPHh+zmnZyaSd2n/5VrkV4ir9cgG6Jinm2u
 /JylTfz1VPYhJ4zk5EOlM+H+E2KpLTOpzD7E0ffyArkBNP2Z8C/ZQ3OEqFXvn0LKDD
 g/nd2meF1bhEelNlSQB41zeoXbEt1GsFNtZrFHMUy9R8WaKfU4rLSyDVL+5CK8US+i
 YpBalFMdkn/7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=jcZrsNVa
Subject: [Buildroot] [PATCH 3/3] linux: bump latest version to 6.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e3eb4c472a..97e2f47077 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.13)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_13 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.14)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.13.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.14.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
