Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FD2FA3724
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1107E80FB3;
	Thu,  1 Jan 2026 21:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCX4sYqbpXxi; Thu,  1 Jan 2026 21:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 122B680FB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304376;
	bh=uadxxdJn58PIX01Fg5R3ogdobxYopnbcpvIoxzlt5JY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OY2nQC6SFSEgBI0weceC2MRSlegxf6f4nmzWUJ/dZtuiGv71PoiIv3Dma3dDmuwry
	 yX6xwhG5+ySI3a/apifcO8Tlj19XQpdUVgzCdck40sfkZ2gns9qKStwYMg5Echh6ay
	 FhrI1JLRj8iSIXUwyTIMpkUiPjcc6fkVurx6OBjlr2k2SGK8jCfLKuA71ZaZwUqoi4
	 9Oh1mEHiPe2TnpLwFaKtEtRZo6q0go7C2ANXxor1oVtBMzPX22j6fszatyKekZ1yXR
	 j9yoUu0A8/UDGXW8paPWseh+2RprguD45B+UnMs/aiAbdJPtsJNYU4wITlzM7eUT1e
	 +278y6JMR6VQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122B680FB4;
	Thu,  1 Jan 2026 21:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2576019D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B411860686
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HiBtiQ4PKwgE for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C00606F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2C00606F7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D29A1877AD; Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b6d47d78889cf825d489ae6feaed2d82fc2a1ed
X-Git-Newrev: 5dd516ac6917621d31bc1d47693e7f3d2fc4118d
X-Patchwork-Hint: ignore
Message-Id: <20260101215250.D29A1877AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chartjs: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5dd516ac6917621d31bc1d47693e7f3d2fc4118d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             |  6 ++++++
 package/Config.in            |  1 -
 package/chartjs/Config.in    |  7 -------
 package/chartjs/chartjs.hash |  3 ---
 package/chartjs/chartjs.mk   | 20 --------------------
 5 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b380f256af..192818ac2c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_CHARTJS
+	bool "chartjs has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_BOOTSTRAP
 	bool "bootstrap has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 86e82960a7..e8c9b6602c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1867,7 +1867,6 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
-	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
 	source "package/datatables-buttons/Config.in"
 	source "package/datatables-fixedcolumns/Config.in"
diff --git a/package/chartjs/Config.in b/package/chartjs/Config.in
deleted file mode 100644
index 73cc9b7750..0000000000
--- a/package/chartjs/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_CHARTJS
-	bool "chartjs"
-	help
-	  Chart.js, a simple yet flexible JavaScript charting library
-	  for designers & developers
-
-	  https://www.chartjs.org/
diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
deleted file mode 100644
index 0f97d0a4a2..0000000000
--- a/package/chartjs/chartjs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  111e0751796f087a51e94dfed910ccfb1278fd30e584a6e48514dba9ae7e72c6  chart.js-3.9.1.tgz
-sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
deleted file mode 100644
index 5ed4b3d9c3..0000000000
--- a/package/chartjs/chartjs.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# chartjs
-#
-################################################################################
-
-CHARTJS_VERSION = 3.9.1
-CHARTJS_SITE = https://registry.npmjs.org/chart.js/-
-CHARTJS_SOURCE = chart.js-$(CHARTJS_VERSION).tgz
-CHARTJS_LICENSE = MIT
-CHARTJS_LICENSE_FILES = LICENSE.md
-CHARTJS_CPE_ID_VENDOR = chartjs
-CHARTJS_CPE_ID_PRODUCT = chart.js
-
-define CHARTJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/chart.min.js \
-		$(TARGET_DIR)/var/www/chartjs/js/Chart.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
