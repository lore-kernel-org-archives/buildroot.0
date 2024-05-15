Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CDCC25B79
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 15:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73195404F9;
	Wed, 15 May 2024 15:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeyUyIkbMf6i; Wed, 15 May 2024 15:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CC4405D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20CC4405D1;
	Wed, 15 May 2024 15:31:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98DE41BF841
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92CB740657
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_dFq9Bm8qkL for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 15:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AB1B405D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB1B405D1
 for <buildroot@buildroot.org>; Wed, 15 May 2024 15:31:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F2C1873D5; Wed, 15 May 2024 15:31:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 17:27:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e036a25271ceedb8b9839437832c3bccd2075e14
X-Git-Newrev: 3c14bcebcb657fee1bed615a6b8073add9a0975b
X-Patchwork-Hint: ignore
Message-Id: <20240515153113.8F2C1873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] configs/pc_x86_64_{bios,
 efi}_defconfig: add wireless regdb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c14bcebcb657fee1bed615a6b8073add9a0975b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Wireless regulatory database lists the allowed radio frequencies for
each local jurisdiction. Since linux-4.15 the kernel supports loading
the files regulatory.db/regulatory.db.p7s directly from the
/lib/firmware directory. Currently this package is not enabled and
kernel complains with the following message on every boot:
"""
platform regulatory.0: Direct firmware load for regulatory.db failed
with error -2
cfg80211: failed to load regulatory.db
"""
Add wireless regulatory database package to fix the issue.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 16e9f514905a12caab1d1b308dd95f8b79977828)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pc_x86_64_bios_defconfig | 1 +
 configs/pc_x86_64_efi_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 6032544d2d..cba92ad93d 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -62,3 +62,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_WIRELESS_REGDB=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index afb652f3fc..fe6686b4a2 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -63,3 +63,4 @@ BR2_PACKAGE_ACPID=y
 BR2_PACKAGE_CONNMAN=y
 BR2_PACKAGE_CONNMAN_CLIENT=y
 BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_WIRELESS_REGDB=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
