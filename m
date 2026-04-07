Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDAEFF512E
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 17:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E04340C29;
	Tue,  7 Apr 2026 17:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NyoVyjUfQoN; Tue,  7 Apr 2026 17:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B11C40BF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775583224;
	bh=jVzwZ+9PpXAvGF1HsMxmBFVIX+3jSNpO92pyFYyUQZk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tBhvPGB5CpGgE4NbLedEkcbj/DOFwu28pkZeQQAfww98a/gbScOF5tHr9z7TfEiwj
	 gK39fmabGf/PTWgELZ4svvk6rYxp5Wkw/NqUSaZAFlGWznpZZWzLjYOpsdw3mRHHN4
	 fKCVGqHZf17MdzviVn0iyZ8/PwMSb4YFAlrNGwshoxVE3mNQbH2y9xMiDIlsZq5TbT
	 ypWCOISAx4dmEEyuHaOkpwstPsnVJdKUcyqc4kdr8jcbOvTXYwLSnp55Tq1LuIsRRv
	 A0tzZ81mv6xQwJ9I5x7Pp2gyHTRlNPjpKRCcKt09SwJokNUE0VJmKtwnuiVsWVroIJ
	 UYF6JIrRTVwOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B11C40BF6;
	Tue,  7 Apr 2026 17:33:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C04C2C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 112C2406A4
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKTvVo2YRWAZ for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 17:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC85401C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DC85401C2
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 17:33:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5BE880725; Tue,  7 Apr 2026 17:33:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 19:32:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04689a8bc05d3a0e8d194ba795512438c10b53a0
X-Git-Newrev: 388f0d1eb36fcd30f9d35530e4c4a8e8bfcfef2b
X-Patchwork-Hint: ignore
Message-Id: <20260407173340.A5BE880725@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: bump to version 2026.04
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/388f0d1eb36fcd30f9d35530e4c4a8e8bfcfef2b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release announcement:
https://lists.denx.de/pipermail/u-boot/2026-April/614160.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2026.01...v2026.04

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3331b81e8c..2d2c3f9d41 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2026.01"
+	bool "2026.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2026.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -368,7 +368,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.01/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.04/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 39b894fe9a..6916498256 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
