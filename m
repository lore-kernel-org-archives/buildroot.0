Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1880C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 890444249D;
	Wed,  5 Feb 2025 10:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWvlU6065S1O; Wed,  5 Feb 2025 10:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E65C424A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E65C424A7;
	Wed,  5 Feb 2025 10:30:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC8CD12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B785640C28
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puvdlJaI1Enl for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F65440BB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F65440BB6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F65440BB6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:30:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DE934330B;
 Wed,  5 Feb 2025 10:30:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tfcg7-0003NK-22;
 Wed, 05 Feb 2025 11:30:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 11:30:41 +0100
Message-Id: <20250205103042.12955-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhephfdvvefgfefhjedujeejjefgjefgheevveevvddufeffudelgfdthfeutdevgfetnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhkuggvqdhlohhokhdrohhrghenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/obsidian-cursors: drop package
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

Fixes http://autobuild.buildroot.net/results/97ac940d6e279cfa493c6b5d9b4d318d8dda10da/

The tarball is no longer available for direct download as kde-look.org has
hidden the downloads behind a nag screen, there are no reverse dependencies
or DEVELOPERS entry for it and the package has not been updated since it was
added in 2015 by commit ae2faeffb17d ("obsidian-cursors: new package"), so
drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                               |  7 +++++++
 package/Config.in                              |  1 -
 package/obsidian-cursors/Config.in             |  6 ------
 package/obsidian-cursors/obsidian-cursors.hash |  2 --
 package/obsidian-cursors/obsidian-cursors.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 27 deletions(-)
 delete mode 100644 package/obsidian-cursors/Config.in
 delete mode 100644 package/obsidian-cursors/obsidian-cursors.hash
 delete mode 100644 package/obsidian-cursors/obsidian-cursors.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2e5bd3153f..2572ac8615 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_OBSIDIAN_CURSORS
+	bool "obsidian-cursors has been removed"
+	select BR2_LEGACY
+	help
+	  The obsidian cursors package is no longer available for
+	  direct download.
+
 config BR2_PACKAGE_GENROMFS
 	bool "genromfs"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 83f69f9004..f4dcd1a346 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -260,7 +260,6 @@ menu "Fonts, cursors, icons, sounds and themes"
 
 comment "Cursors"
 	source "package/comix-cursors/Config.in"
-	source "package/obsidian-cursors/Config.in"
 
 comment "Fonts"
 	source "package/bitstream-vera/Config.in"
diff --git a/package/obsidian-cursors/Config.in b/package/obsidian-cursors/Config.in
deleted file mode 100644
index 49ec310170..0000000000
--- a/package/obsidian-cursors/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_OBSIDIAN_CURSORS
-	bool "obsidian-cursors"
-	help
-	  Obsidian Cursors is a shiny and clean cursor set.
-
-	  http://kde-look.org/content/show.php/Obsidian+Cursors?content=73135
diff --git a/package/obsidian-cursors/obsidian-cursors.hash b/package/obsidian-cursors/obsidian-cursors.hash
deleted file mode 100644
index a476a0ba05..0000000000
--- a/package/obsidian-cursors/obsidian-cursors.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  3d38fe875f6feae8b7772e02cfda530fcf669479807915cd2c12c149da17cfb9  73135-Obsidian.tar.bz2
diff --git a/package/obsidian-cursors/obsidian-cursors.mk b/package/obsidian-cursors/obsidian-cursors.mk
deleted file mode 100644
index 87a8d62f3e..0000000000
--- a/package/obsidian-cursors/obsidian-cursors.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# obsidian-cursors
-#
-################################################################################
-
-OBSIDIAN_CURSORS_VERSION = 1.0
-OBSIDIAN_CURSORS_SITE = http://kde-look.org/CONTENT/content-files
-OBSIDIAN_CURSORS_SOURCE = 73135-Obsidian.tar.bz2
-OBSIDIAN_CURSORS_LICENSE = GPL
-
-define OBSIDIAN_CURSORS_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/cursors/xorg-x11/Obsidian
-	cp -a $(@D)/cursors \
-		$(TARGET_DIR)/usr/share/cursors/xorg-x11/Obsidian
-endef
-
-$(eval $(generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
