Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D105C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 23:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 794B960AD3;
	Fri, 10 Jul 2026 23:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_pGSLNeh2y1; Fri, 10 Jul 2026 23:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43F0B60A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783724431;
	bh=lKAVP1lYjGYbbWD2K+WF5btQydTKHUvczkCUeAwUhHI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oojF9oqdZT/Xs26CxpJTfSB5Hqtxm9DfN6m4ffZlc7gEluDomJNH10AzAGB81K2BI
	 sDgAHSOtZIhfRS3zCAZ4LMgfjS5WFbaijDNtCp+Pf+IZUmIDR43dRPTW87dKvW0xwA
	 xUUTj0XyDPoROFj1bessTVQj1FJCAKQEW1TpXMISZqP4BCg+K8PIUVOFGhFSyHQwEA
	 TyoXCg9/ZIitzuB1i/eUqRt2qqhjwp8eeBvX6OzApWo19wRazR+NJC5/EkzSveqBdg
	 5+9Q4sENKJT52PzdpUMLxZ6eqfEi+1J8PpDd/yUvW1wvAN8zs/0EexaBh8ToSWL9dK
	 OrmjdZL+8uA+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43F0B60A9B;
	Fri, 10 Jul 2026 23:00:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 948BD372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8653440709
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0kwzKoUSBx6 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 23:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DFFA40634
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DFFA40634
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 23:00:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 486D188717; Fri, 10 Jul 2026 22:59:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Jul 2026 00:41:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6597563da7bb359eac57c8fb70e4efc3d6ef4c02
X-Git-Newrev: 29f09f3ac4284890eda4a13f3748cb59d390d410
X-Patchwork-Hint: ignore
Message-Id: <20260710225955.486D188717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2026.07
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29f09f3ac4284890eda4a13f3748cb59d390d410
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announcement:
https://lists.denx.de/pipermail/u-boot/2026-July/624082.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2026.04...v2026.07

U-Boot 2026.07 adds PKCS#11 support to tools/mkeficapsule, which
requires host-gnutls with PKCS#11 support. That was enabled in commit
6597563da7bb359eac57c8fb70e4efc3d6ef4c02.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Fiona: remove hidden option for p11-kit, update commit message accordingly]
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2d2c3f9d41..1eabd10407 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2026.04"
+	bool "2026.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2026.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -368,7 +368,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.04/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.07/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 6916498256..e992835582 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
