Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04CCC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 09:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E94B60594;
	Tue, 11 Mar 2025 09:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_ax0ZHQHwQl; Tue, 11 Mar 2025 09:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8876605A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8876605A7;
	Tue, 11 Mar 2025 09:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D9121C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 09:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E195B405EB
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 09:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38PvuQRF_WCm for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 09:49:21 +0000 (UTC)
X-Greylist: delayed 330 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 11 Mar 2025 09:49:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6908C404B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6908C404B5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=167.172.186.51;
 helo=shell.v3.sk; envelope-from=lkundrak@v3.sk; receiver=<UNKNOWN> 
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6908C404B5
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 09:49:20 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 11006DFE32
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 09:37:57 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LTagNLdCgekK; Tue, 11 Mar 2025 09:37:56 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id AE864DFE33;
 Tue, 11 Mar 2025 09:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CL0R9H5yg89F; Tue, 11 Mar 2025 09:37:56 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 7FC3FDFE32;
 Tue, 11 Mar 2025 09:37:56 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: buildroot@buildroot.org
Cc: Lubomir Rintel <lkundrak@v3.sk>
Date: Tue, 11 Mar 2025 10:43:27 +0100
Message-ID: <20250311094327.1887514-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=v3.sk
Subject: [Buildroot] [PATCH] configs/olpc_xo175_defconfig: bump kernel
 version to 6.13.6
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

Update kernel to version 6.13.6. Tested.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 configs/olpc_xo175_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/olpc_xo175_defconfig b/configs/olpc_xo175_defconfig
index bb7aa047f6..f4ef283e00 100644
--- a/configs/olpc_xo175_defconfig
+++ b/configs/olpc_xo175_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_pj4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_13=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olpc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olpc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1.75/linux.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
