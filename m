Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB5AEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC7184731;
	Fri, 13 Feb 2026 19:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0_S-UoOz-At; Fri, 13 Feb 2026 19:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 144378472E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011468;
	bh=IrkXHSzKi3X0kaONbYFgGqBnPLLV1AEhyAmlFsy5jOw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Aa7srZmW7WRMkYHv3e0eEmtyN/IoMaHSuU9mEFbokiow6jyvLDCSBDcKGKkVmD919
	 3FsyfN+WLoDrdjUy5TvH/BgCEN6RCxXsUQZskWQL/nepfjFwBeQrblLBvE3JtgI9sW
	 38VlfMi/25smsq3ry3S+gVO1NQ0mG8GFrfc1eEWKFW0QBuiM2GHJKNb5GrufQc9lnP
	 vc+V+2Zl/mhit6N6ibb/Uaj8ZSwKcILRSiSwyPuV/imTj5QUpn2V1LhKhJiVZXPbvE
	 OjbZPma5/8SAV6CZ97q27LAbxeE1N0qhzzd2i71yriFKdA2MPTKibFGp1gAtHz0yIJ
	 YBJ1oAo7JMe7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 144378472E;
	Fri, 13 Feb 2026 19:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EFE669
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F2EF41307
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9_hJbHBrldm for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD99412C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCD99412C8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1EC0838C3; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:27:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 8e30572079027bc82dfc0f0ef29427f04fbe2441
X-Git-Newrev: 6673c79b99949024b1e74ba17b76d96d4a24d9f2
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.B1EC0838C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] uboot: Add support for
 custom license files
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6673c79b99949024b1e74ba17b76d96d4a24d9f2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The U-Boot package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
[Arnout: use a single Kconfig option with conditional prompt]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit a4d5b20462602aa89a7e6a5587cb187f71e31d5e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 63d1c734ab..06d814de35 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -92,6 +92,14 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
 
+config BR2_TARGET_UBOOT_LICENSE_FILES
+	string "U-boot license files" if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || \
+		BR2_TARGET_UBOOT_CUSTOM_SVN || BR2_TARGET_UBOOT_CUSTOM_TARBALL
+	default "Licenses/gpl-2.0.txt"
+	help
+	  A space-separated list of license files related to U-Boot
+	  package.
+
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
 	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""  # legacy
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 8dad710bf3..ea2996f791 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -8,9 +8,7 @@ UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPL-2.0+
-ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
-UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
-endif
+UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
 UBOOT_CPE_ID_VENDOR = denx
 UBOOT_CPE_ID_PRODUCT = u-boot
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
