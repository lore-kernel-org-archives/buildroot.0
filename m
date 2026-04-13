Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E15F531CB
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B93E960DDA;
	Mon, 13 Apr 2026 19:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fp_TIr-jUwJn; Mon, 13 Apr 2026 19:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC8BB60EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776109609;
	bh=+ZsQ2yZqzZer0yw06cPm7vUIhMsW43mn++Y+WMlv324=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AMI1kFZGIjIUFgPcHYNIganNEVfhbU4XX1y6ZR9XToiWLnTNewPHdV4UIMKaBGRD+
	 4FdU+vY5Om/W08wF5RPw+EhwoSW/gqtvnUlC7O7/aR0Ik7W9moCdFAap+7uYPl1SyB
	 ed+22AuiVcCxFQHxU80KYjZg9MqOWeefUiudWCYEHpdPksnzHP46cT8ZbJ6INT5uRs
	 OTZK5IlDnc9YosQZ5x4i/PWxAUeRN/x6LOquVeJiui9A/0p2oSX1QlY3fn3FplKZiv
	 JOBnmS671SlMlaHvQqdAtHgTCUfMzrvNbsEdkDziSrv7T2jV1ZTR0jLuRdJYdFU+q+
	 R8jvtDKOJQ0Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC8BB60EFA;
	Mon, 13 Apr 2026 19:46:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AE1F31F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 807CA832C7
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOofZdUzD9-a for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D74E582735
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D74E582735
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66D69813D4; Mon, 13 Apr 2026 19:46:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 21:23:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9af85c8f018ccbd9af60dc8bd4bbf52a1a68327f
X-Git-Newrev: 66124c73b1b0f694ae04a8e4d90b9cf290f16874
X-Patchwork-Hint: ignore
Message-Id: <20260413194645.66D69813D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump latest version to 7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66124c73b1b0f694ae04a8e4d90b9cf290f16874
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For an overview of changes in 7.0, see:
https://kernelnewbies.org/Linux_7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to kernelnewbies.org in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.19.12 => 7.0} | 0
 linux/Config.in        | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/6.19.12 b/linux/7.0
similarity index 100%
rename from linux/6.19.12
rename to linux/7.0
diff --git a/linux/Config.in b/linux/Config.in
index c2f022240b..d674356e06 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.19)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.0)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
