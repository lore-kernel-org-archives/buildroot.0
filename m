Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC8CD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E5CF61B88;
	Fri,  8 May 2026 19:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zboiUbhHutEg; Fri,  8 May 2026 19:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59CE061B85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778269989;
	bh=GISGxSH/qSb3rkzpRKXPTu14wpq+UD+3bM8eamvfhzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UOPquQ2dbcHojeqvU+tR2kmPExIhwTjAh8Fwd2XOahMr3iHF45IlyhZbE3BhqPupF
	 1EON3qQbSYw0MlN96vdk0P+t9m6NIQXMDxFAlspa3berGTobQdKP7OoECc3C+XUgNt
	 yGi0Pd9+fVZ3aDTfdVO3yuD2p+0GLe7V98gpR+oKFxli5GN8/UCEOxQHKq2IRoNp25
	 6FPl5Vcpx0yetxkYpxtFMjQg8ZSa3n/qB5ohe4HBHKqGzzzh59yx9BPO4ZFB1pYLS6
	 G9+42HVhjLKLdpHuuuaEuW0XhJNJov6GtGMbUonTaQC60L0AkQ0Ex2LyGe8gTKhndV
	 8sXO2/sZRrgzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59CE061B85;
	Fri,  8 May 2026 19:53:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9AC28D
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51FD741FD8
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jhOWs_K9kURk for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5199D41FD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5199D41FD7
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E51FB85A5C; Fri,  8 May 2026 19:53:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 21:49:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0e97b35b40d656c5cbf1c11271ff9dfceb66b16
X-Git-Newrev: d951a39010573bfa751da97544ef04dfd69104c6
X-Patchwork-Hint: ignore
Message-Id: <20260508195304.E51FB85A5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 5.10.254-cip72
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d951a39010573bfa751da97544ef04dfd69104c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix versions in Config.in bool prompts]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{5.10.246-cip66 => 5.10.254-cip72}                          | 0
 .../0001-arch-microblaze-mm-init.c-fix-build.patch                | 0
 linux/{5.10.246-cip66-rt29 => 5.10.254-cip72-rt32}/linux.hash     | 0
 linux/Config.in                                                   | 8 ++++----
 linux/before-6.17/linux.hash                                      | 4 ++--
 package/linux-headers/{5.10.246-cip66 => 5.10.254-cip72}          | 0
 .../linux-headers/{5.10.246-cip66-rt29 => 5.10.254-cip72-rt32}    | 0
 7 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/5.10.246-cip66 b/linux/5.10.254-cip72
similarity index 100%
rename from linux/5.10.246-cip66
rename to linux/5.10.254-cip72
diff --git a/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
similarity index 100%
rename from linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
rename to linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
diff --git a/linux/5.10.246-cip66-rt29/linux.hash b/linux/5.10.254-cip72-rt32/linux.hash
similarity index 100%
rename from linux/5.10.246-cip66-rt29/linux.hash
rename to linux/5.10.254-cip72-rt32/linux.hash
diff --git a/linux/Config.in b/linux/Config.in
index 27b2e9f511..8d67b43812 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -37,7 +37,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.246-cip66)"
+	bool "Latest CIP SLTS version (5.10.254-cip72)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -59,7 +59,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.246-cip66-rt29)"
+	bool "Latest CIP RT SLTS version (5.10.254-cip72-rt32)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -144,8 +144,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "7.0.5" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f97ab45c2f..ba20750b7b 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -6,8 +6,8 @@ sha256  f1672e610dc9e05e33de1803857e26c5abe1d1ab0a2ea74b0d8269267f73b499  linux-
 sha256  5fc6ce4f4cfb17977bc6e14c52a0e10846544f1ffc133aac26d6de7e14a5e61f  linux-5.15.206.tar.xz
 sha256  3956b387bfb5133c00f3f7f76a0a436934a349e8a9319a231a1b5b829d7866a7  linux-5.10.255.tar.xz
 # Locally computed
-sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
-sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
+sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
+sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.246-cip66 b/package/linux-headers/5.10.254-cip72
similarity index 100%
rename from package/linux-headers/5.10.246-cip66
rename to package/linux-headers/5.10.254-cip72
diff --git a/package/linux-headers/5.10.246-cip66-rt29 b/package/linux-headers/5.10.254-cip72-rt32
similarity index 100%
rename from package/linux-headers/5.10.246-cip66-rt29
rename to package/linux-headers/5.10.254-cip72-rt32
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
