Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A27CAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF276111B;
	Tue, 16 Sep 2025 20:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xX8_m5Z7m49; Tue, 16 Sep 2025 20:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1906111F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1906111F;
	Tue, 16 Sep 2025 20:04:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80AE712D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7334C6111D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5M58iXKHHeh for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA9DE61117
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA9DE61117
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C61E4849CF; Tue, 16 Sep 2025 20:04:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:03:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51fd6aaa8ab44c2eaa7a84b150b436b073c8653e
X-Git-Newrev: 2cbc64b2d4b55306f214081b5fb8e5c67d7ea300
X-Patchwork-Hint: ignore
Message-Id: <20250916200429.C61E4849CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/arm_foundationv8: add eth0 to be
 configured by dhcp at boot
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6346887957517331479=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6346887957517331479==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2cbc64b2d4b55306f214081b5fb8e5c67d7ea300
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "board/arm/foundation-v8/readme.txt" board documentation file [1]
recommends to start the Foundation_Platform emulator with a nat
network, but the corresponding defconfig does include the dhcp
network configuration for the network interface.

This commit adds the "eth0" interface to be configured by DHCP
at boot, in order to have a working network connectivity.

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08/board/arm/foundation-v8/readme.txt#L39

Cc: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/arm_foundationv8_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 921fbf62c5..61e2f359ce 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -3,6 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15=y
 BR2_GLOBAL_PATCH_DIR="board/arm/foundation-v8/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.15.7"

--===============6346887957517331479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6346887957517331479==--
