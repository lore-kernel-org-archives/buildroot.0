Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4760FE937E4
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 14:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15A660E25;
	Sun, 12 Apr 2026 14:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DCX9EECGXrn; Sun, 12 Apr 2026 14:42:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B89676157D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776004961;
	bh=aF2OFlPPQmO9qu3pXq2eHgwFVY3YK25ybJXm9YzW/ZY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=julpp6Qg+pKYibIPFrVu+Tg3Gm7iVhiwaiqtg4nYXX8NXOCxwNP/7uG2BjyBDZTM0
	 RIq9dH+QD6vgZ3I72VRXU9epZXkavsp5lFJvjBYIjQo4+58jn1SWHyfKUZVSynMIbG
	 om/hb24FsutU8OEGz5XvecQIhrvRjD1uyc6fbqCKTSYeAtAQarj5hMj14bITT0WijD
	 cDeB+KHnBkOypg+XrXJLQQzyw1MLLS6ZeBa6QBaGDkC6i99hgG2vAGDjd1Fa094Ndm
	 /dTg51vCu76OPQ663KDtqAYf2uDs4bTVGlR8+k/xKmPiEuu0FPq+RwbyLIJT0C9qkc
	 JOWpiHbcN2/kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89676157D;
	Sun, 12 Apr 2026 14:42:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A510F237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 823F280D7C
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9MQTxDkCjdD for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 14:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E529880D6E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E529880D6E
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 14:42:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71EDA81046; Sun, 12 Apr 2026 14:42:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 16:30:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c672b9499ec8d125495831d693650c304a64cd86
X-Git-Newrev: 9882f8e5c1c33361509325b6d30a211da465882c
X-Patchwork-Hint: ignore
Message-Id: <20260412144238.71EDA81046@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_pc2: bump uboot version
 to 2026.04
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9882f8e5c1c33361509325b6d30a211da465882c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This patch fixes the autobuild error for the OrangePi PC2.
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950361

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
[Julien: add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/orangepi_pc2_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 46d04b34c8..180c744bae 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -25,11 +25,12 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
