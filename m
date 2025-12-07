Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A4D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0734740829;
	Sun,  7 Dec 2025 12:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99WUu7QZ-o-4; Sun,  7 Dec 2025 12:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E4A407B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765111794;
	bh=fEsuedywqjx4eJlDJSu7vviusZsKwZCUW/kytQHNV0w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=McGqPnnrZL4WK9TmWpfbrvpBljCbWp7sEYE9xnNTICDqIm1/uyUhN4SaFr4pB7vu4
	 XX6DorjIUUUWNUQlFF6LlUnZDwDT1yhq8jggkk7Fdz7AKSasBxf4SFfQlzDjVHYWhI
	 v7bSQmBFhQ3CsQKDd/zj7FyJLiMFUWa0fLq+J13ibfSE8CbdZZRF03V9vwn38nbZ62
	 RQbv1gMzMnJqmoKWXOiswQ2h0+DSZp5Z8RykjHSHHkfIBCWPmzSOOYY+2x2VBS/lzB
	 qebufF2MnreDFD2EhVD/pF8y5lb72FLoI7qJKNeUt+Fqjy7sgknzymonWx0WzAfYo7
	 cGvM7t9E/cFJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74E4A407B8;
	Sun,  7 Dec 2025 12:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24EE8E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2253D814B3
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ob56F1S6PI9f for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 741BD81470
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 741BD81470
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64CED86627; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 12:51:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f311de2de918b883447438ef88eead935398203
X-Git-Newrev: a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c
X-Patchwork-Hint: ignore
Message-Id: <20251207124952.64CED86627@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump latest version to 6.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an overview of changes in 6.18, see:
https://kernelnewbies.org/Linux_6.18

Also, the Kernel 6.18 series was also selected as a longterm
supported one (LTS). See:
https://git.kernel.org/pub/scm/docs/kernel/website.git/commit/?id=b9ea3472ee1d973f4c27d075c7e4445afa7ade89

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add comment about 6.18 being LTS]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bd18cece91..10024bef38 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.17)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.18)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
