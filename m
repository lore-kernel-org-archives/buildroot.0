Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE2DCD98E3
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5280741BA8;
	Mon, 15 Jun 2026 21:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuJYUPy84gWn; Mon, 15 Jun 2026 21:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5FAD41B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781559099;
	bh=/KIvFgSwXtOE/E9udfOMEgT1Zjhax2TsLZdKAFHSg/k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VEOZ+fgLmT5FfOQ72J0qoBEQroVzqDgRKeDV56zVT3p8Qt+zFBP/4+QJAX8ahKOI9
	 GEZvxpyVa0DU/+sE5T9bb2rQjVPW6fsIgh/fInLBlv94ShLBtzSsPPd7t9pWr4z0mr
	 fEcIEskmr13t1HyT7JOimQFLMNIxrLjYoO3QkVO1f8u4rZ6JkeGFkgBKda++ipjGIW
	 YnfHqVsbD7T9yZxR1KwmIVyN51fYmL9Y4LAhIyMXlasCxOHLfhPRmeyQOwlU59To5l
	 uExU2OHdUnN18E00gtXQLkoDL+9AsO6PQKC1nSdKbUYQDcTfKRJ2r+rf8b0TIvct25
	 cuudpQTo8/uFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5FAD41B9A;
	Mon, 15 Jun 2026 21:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BC62F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA64541530
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDsjsC7hAnd6 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 040B8403FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 040B8403FE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24ED27FF69; Mon, 15 Jun 2026 21:31:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 23:17:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9530d74ddb04d5fc81f9054ec0e76fbcb2a1e7d2
X-Git-Newrev: cbe867b895d19861cd809c953f88c576f2073223
X-Patchwork-Hint: ignore
Message-Id: <20260615213115.24ED27FF69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump latest version to 7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbe867b895d19861cd809c953f88c576f2073223
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For an overview of changes in 7.1, see:
https://kernelnewbies.org/Linux_7.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.12 => 7.1} | 0
 linux/Config.in       | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/7.0.12 b/linux/7.1
similarity index 100%
rename from linux/7.0.12
rename to linux/7.1
diff --git a/linux/Config.in b/linux/Config.in
index 0baa52de0f..664c97c01d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,8 +30,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.0)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.1)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
