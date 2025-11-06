Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8B3CCFA18
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2FD341159;
	Thu,  6 Nov 2025 19:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SJyEmON_gls; Thu,  6 Nov 2025 19:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB7DA4113A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7DA4113A;
	Thu,  6 Nov 2025 19:32:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6372E93E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39EDB607ED
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrTJ_WO9Uvpo for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49EF5607EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49EF5607EC
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AAE783EDA; Thu,  6 Nov 2025 19:32:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Nov 2025 19:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 093faabd8657dc2ac81507c84dd7ff9e98c44cdc
X-Git-Newrev: b3e2b2f53f1b46a4f71b7886d0a9f5e7d9ff7625
X-Patchwork-Hint: ignore
Message-Id: <20251106193217.3AAE783EDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/andes_ae350_45_defconfig: bump to
 opensbi v1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3e2b2f53f1b46a4f71b7886d0a9f5e7d9ff7625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps opensbi to v1.6 and add proper hash file.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/andes/ae350/patches/opensbi/opensbi.hash | 2 ++
 configs/andes_ae350_45_defconfig               | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/andes/ae350/patches/opensbi/opensbi.hash b/board/andes/ae350/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..d7893a1dee
--- /dev/null
+++ b/board/andes/ae350/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d11702103f177a2914e94eec57ce5ed820296d874f6b6525c4482e55d71a3667  opensbi-1.6.tar.gz
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index c02c4d7c61..aafa447379 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -17,9 +17,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,22f38ee6c658a660083aa45c4ec6c72f66a17260)/opensbi-22f38ee6c658a660083aa45c4ec6c72f66a17260.tar.gz"
-BR2_TARGET_OPENSBI_PLAT="andes/ae350"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.6"
+BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
