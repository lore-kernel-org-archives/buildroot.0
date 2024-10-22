Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CABCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A21FE60681;
	Tue, 22 Oct 2024 20:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYy1kwowl16A; Tue, 22 Oct 2024 20:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C342260604
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C342260604;
	Tue, 22 Oct 2024 20:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8B559F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3162880BD9
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ro0wYEv96N4r for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78EE080BC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78EE080BC6
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6510A861B2; Tue, 22 Oct 2024 20:46:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 22:46:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbeca6d13f3a68da57c202b6f03faefe6ab135f6
X-Git-Newrev: e087f183408283c1deb05ffb5dab8348980a8b6a
X-Patchwork-Hint: ignore
Message-Id: <20241022204634.6510A861B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: update to uboot 2024.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e087f183408283c1deb05ffb5dab8348980a8b6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Newer uboot versions contain commit ebb0ad4eef0a ("arch: arm:
mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588"),
which enables BOOTSTD_FULL for RK3588, making it easier to figure
out issues with the bootflow, if any.

Also add the GnuTLS dependency which is needed for uboot 2024.10.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/radxa/rock5b/patches/uboot/uboot.hash | 2 +-
 configs/rock5b_defconfig                    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
index bc999536af..904fa56c02 100644
--- a/board/radxa/rock5b/patches/uboot/uboot.hash
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index bc7b73d652..d75ad585fb 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -32,11 +32,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
