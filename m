Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0E6E94617
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 22:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1BF40D28;
	Mon,  9 Feb 2026 22:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBDCceJHO3kU; Mon,  9 Feb 2026 22:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 806E240D21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770676213;
	bh=f1CpqO3OqEWgbbBNvey3ALEACyzlVeQjK4Rt7QtEXIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pnOwfCyvopDQaTDCiVil1nbBJKm9Q3+hTjS2wBfN7fOASzJ7dEfsfZpJh7PlTro4h
	 Uhjs2QBaCnualveYjkFdJ5dHMch0g9bzxjm7r3WGImsBl7QCBWPGV1m9PxlB3Neu0E
	 /1M9AGIedpM1J3cM1jI0ubMAmTrRKayRXsLFhTbFmfFqVgumYRO+cyLwGU12BpTDFB
	 b5qi9N869IzxdJHTnby+ptVXWGFXgPEQ4Vl50fQO1ErGFQBHZJUOUksCdWht1EjisG
	 8V0pSsvCf9Z9kIYCYiTyfHN7ToLELRJshL/r7MvUscK/Tjw+CpGI7j6z97vd5NIe4X
	 YxOqv0SGKSdaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 806E240D21;
	Mon,  9 Feb 2026 22:30:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8F4C219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2ECB4009E
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMx1fMyCRSRf for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 22:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B1040382
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0B1040382
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C44D585CB0; Mon,  9 Feb 2026 22:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Feb 2026 23:14:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 566150745bf61fdc1aee68fcf319bc4e8942960a
X-Git-Newrev: 5b23e04383f6a1862874b8567011150805658961
X-Patchwork-Hint: ignore
Message-Id: <20260209223010.C44D585CB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump latest version to 6.19
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b23e04383f6a1862874b8567011150805658961
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For an overview of changes in 6.19, see:
https://kernelnewbies.org/Linux_6.19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.18.9 => 6.19} | 0
 linux/Config.in        | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/6.18.9 b/linux/6.19
similarity index 100%
rename from linux/6.18.9
rename to linux/6.19
diff --git a/linux/Config.in b/linux/Config.in
index a253f2ee5b..9d96b346d5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.18)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.19)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
