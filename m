Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5319ECA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 19:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0171606DA;
	Thu,  4 Sep 2025 19:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPao_xq5Wnn0; Thu,  4 Sep 2025 19:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0C6D60702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0C6D60702;
	Thu,  4 Sep 2025 19:32:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD347B69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA8AC80C78
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3tcA9qjweuw for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B69880C0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B69880C0B
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B4CA82B35; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 20:49:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7c20afb95eae62ebffd7f9f093e6a60cea274892
X-Git-Newrev: 7bf44f11e70e66bdefc39c78f79a7b7e07c24fc4
X-Patchwork-Hint: ignore
Message-Id: <20250904193156.3B4CA82B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/aspeed_*: update
 hostname and /etc/issue
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
Content-Type: multipart/mixed; boundary="===============2185300352165266926=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2185300352165266926==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7bf44f11e70e66bdefc39c78f79a7b7e07c24fc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Include the SoC model in both hostname and /etc/issue to match the
.dts file names.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/aspeed_ast2500evb_defconfig | 4 ++--
 configs/aspeed_ast2600evb_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/aspeed_ast2500evb_defconfig b/configs/aspeed_ast2500evb_defconfig
index ffc0ec8d52..64666cc3d7 100644
--- a/configs/aspeed_ast2500evb_defconfig
+++ b/configs/aspeed_ast2500evb_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16=y
-BR2_TARGET_GENERIC_HOSTNAME="aspeed-evb"
-BR2_TARGET_GENERIC_ISSUE="Aspeed EVB"
+BR2_TARGET_GENERIC_HOSTNAME="ast2500-evb"
+BR2_TARGET_GENERIC_ISSUE="Aspeed AST2500 EVB"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aspeed/common/post-image.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/aspeed_ast2600evb_defconfig b/configs/aspeed_ast2600evb_defconfig
index 2057091776..0572f78599 100644
--- a/configs/aspeed_ast2600evb_defconfig
+++ b/configs/aspeed_ast2600evb_defconfig
@@ -1,8 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16=y
-BR2_TARGET_GENERIC_HOSTNAME="aspeed-evb"
-BR2_TARGET_GENERIC_ISSUE="Aspeed EVB"
+BR2_TARGET_GENERIC_HOSTNAME="ast2600-evb"
+BR2_TARGET_GENERIC_ISSUE="Aspeed AST2600 EVB"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aspeed/common/post-image.sh"
 BR2_LINUX_KERNEL=y

--===============2185300352165266926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2185300352165266926==--
