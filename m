Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0C5EEE25C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB4E80FDE;
	Thu,  1 Jan 2026 21:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26B4KxvmJ-Tv; Thu,  1 Jan 2026 21:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C484A80FFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304379;
	bh=pbCjdKhdowoGRY0eKkA0LSAJfcQBbohL5lUqEluAeO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=evGw3t2/hNllGi8c3j/PCJrovBW42kORJgNXxFY3/EE5KWcbfJ8dTIm2bcbfzRYuB
	 FSwx1rCtlCcQVs68q59mV4amtAT3IgvsWH7qDPB5iZ59BE1h0cmBAd8zS6gcMqA2fp
	 wpgScrLiTWjU6d8zSCI3hwZGVbT7MnVeiKG8wMY55+mnnQhVaO0YttAb3zdjNBgZ9J
	 yblNvZruYKYBqW/Z0WX9hGSHvBMSf725Vtns7PLY4XO3Cypz7C7z0VRmVpk/6W+V9r
	 4rad8ymBv6ggtnStvMpV++K/cdwxJbTGA2Rghjhr1nbTY9c7Iarp6zNWMfdf2sm2Yp
	 8OkWFJT47raPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C484A80FFF;
	Thu,  1 Jan 2026 21:52:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 18AF119D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE72C40392
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyXzB6DLRtjE for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDA9040387
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDA9040387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEFA887E6F; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0524d385543496a4aafdabb9bd7a37c038c04b9
X-Git-Newrev: d7865718235f9bbe4c52f26a547327f04b4153db
X-Patchwork-Hint: ignore
Message-Id: <20260101215251.BEFA887E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vis-network: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7865718235f9bbe4c52f26a547327f04b4153db
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
 Config.in.legacy                     |  6 ++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/vis-network/Config.in        |  7 -------
 package/vis-network/vis-network.hash |  4 ----
 package/vis-network/vis-network.mk   | 21 ---------------------
 6 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d5f5e7b0f6..b12fa51cb2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_VIS_NETWORK
+	bool "vis-network has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_OPENLAYERS
 	bool "openlayers has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 2c8650d657..8a7db1b921 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1713,7 +1713,6 @@ F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
 F:	package/erlang-xmpp/
 F:	package/nginx-dav-ext/
-F:	package/vis-network/
 F:	package/vuejs/
 
 N:	John Stile <johns@msli.com>
diff --git a/package/Config.in b/package/Config.in
index 8e14ce6638..0620ce1602 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1869,7 +1869,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
 comment "External Vue.js plugins"
diff --git a/package/vis-network/Config.in b/package/vis-network/Config.in
deleted file mode 100644
index 39e8ac54c5..0000000000
--- a/package/vis-network/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_VIS_NETWORK
-	bool "vis-network"
-	help
-	  Display dynamic, automatically organised, customizable network
-	  views. Network uses HTML canvas for rendering.
-
-	  http://visjs.github.io/vis-network/
diff --git a/package/vis-network/vis-network.hash b/package/vis-network/vis-network.hash
deleted file mode 100644
index 56f141f5f7..0000000000
--- a/package/vis-network/vis-network.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally computed
-sha256  a9f7325cbe28147318476c63f09c1d5c894d2239bfa4b4dd2dfb3dbebb0705d3  vis-network-9.1.0.tgz
-sha256  1509904280a272780fd69c04b858f512cf216f8e3464a0dd98d8f34416feced9  LICENSE-APACHE-2.0
-sha256  1f65085e54c036645082257618db2c7b787e68c3b02485e214ecd09e0834ee8f  LICENSE-MIT
diff --git a/package/vis-network/vis-network.mk b/package/vis-network/vis-network.mk
deleted file mode 100644
index 4a8def37e0..0000000000
--- a/package/vis-network/vis-network.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# vis-network
-#
-################################################################################
-
-VIS_NETWORK_VERSION = 9.1.0
-VIS_NETWORK_SOURCE = vis-network-$(VIS_NETWORK_VERSION).tgz
-VIS_NETWORK_SITE = https://registry.npmjs.org/vis-network/-
-VIS_NETWORK_LICENSE = Apache-2.0 or MIT
-VIS_NETWORK_LICENSE_FILES = LICENSE-APACHE-2.0 LICENSE-MIT
-
-# Install .min.js and .min.css as .js and .css, respectively.
-define VIS_NETWORK_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vis-network.min.js \
-		$(TARGET_DIR)/var/www/vis-network.js
-	$(INSTALL) -m 644 -D $(@D)/dist/dist/vis-network.min.css \
-		$(TARGET_DIR)/var/www/vis-network.css
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
