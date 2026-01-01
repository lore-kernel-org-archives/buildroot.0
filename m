Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F9EFA3723
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 21:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC4840659;
	Thu,  1 Jan 2026 21:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSfpcmEgXxyb; Thu,  1 Jan 2026 21:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D67BC406D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304380;
	bh=qiwUaOzwC1+0o6Gb9XbrcMNNsi5/fz1ELaQ9kjebLAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HFAZwopHHNlMgiJXEU1KGkqoweroxCCf1ieKMn3BPj3h4IRDbEz9phsI9u81h5hiq
	 R65XnvJ+HUZtHq6KVsNCyIGvycQ7DSR/g/xRI0P73eLi2NZx1+Pd7Pe4upnhRUOMtY
	 cONWmaocXTaJnC4PF3JeATSrYSR68xuPz7xSnAKkPN/wZ+Wdoyta2Y2F65kWCfrvj0
	 fewEFZL2uujROBV9sL9631sCb/YOf1gMvWvqhPrEN0Dw4MbjtvDnotmsBIUb3LrNho
	 FKdvDwCohnHCY9OSzhdfhSqjUHtSpDvjln58MXNJ+bbgopFwjiEBsAFf12qSxAhEGO
	 0ci93lwkzi1iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67BC406D5;
	Thu,  1 Jan 2026 21:53:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25D7B438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A97F80F1B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QD5oMiCOM1te for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B5880F16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06B5880F16
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 21:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8E9A87E6F; Thu,  1 Jan 2026 21:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:51:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dd516ac6917621d31bc1d47693e7f3d2fc4118d
X-Git-Newrev: 87be409ee122bf632d3b54c334cd24adc7413ada
X-Patchwork-Hint: ignore
Message-Id: <20260101215250.E8E9A87E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/datatables{, -buttons,
 -fixedcolumns, -responsive}: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=87be409ee122bf632d3b54c334cd24adc7413ada
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
 Config.in.legacy                                   | 24 +++++++++++++++++++++
 package/Config.in                                  |  4 ----
 package/datatables-buttons/Config.in               | 12 -----------
 package/datatables-buttons/datatables-buttons.hash |  3 ---
 package/datatables-buttons/datatables-buttons.mk   | 25 ----------------------
 package/datatables-fixedcolumns/Config.in          | 10 ---------
 .../datatables-fixedcolumns.hash                   |  3 ---
 .../datatables-fixedcolumns.mk                     | 25 ----------------------
 package/datatables-responsive/Config.in            | 12 -----------
 .../datatables-responsive.hash                     |  3 ---
 .../datatables-responsive/datatables-responsive.mk | 25 ----------------------
 package/datatables/Config.in                       |  7 ------
 package/datatables/datatables.hash                 |  3 ---
 package/datatables/datatables.mk                   | 25 ----------------------
 14 files changed, 24 insertions(+), 157 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 192818ac2c..5b69ba6f3c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_DATATABLES_RESPONSIVE
+	bool "datatables-responsive has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_DATATABLES_FIXEDCOLUMNS
+	bool "datatables-fixedcolumns has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_DATATABLES_BUTTONS
+	bool "datatables-buttons has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_DATATABLES
+	bool "datatables has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_CHARTJS
 	bool "chartjs has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index e8c9b6602c..bc6b724f8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1867,10 +1867,6 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
-	source "package/datatables/Config.in"
-	source "package/datatables-buttons/Config.in"
-	source "package/datatables-fixedcolumns/Config.in"
-	source "package/datatables-responsive/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/datatables-buttons/Config.in b/package/datatables-buttons/Config.in
deleted file mode 100644
index 515038ebe5..0000000000
--- a/package/datatables-buttons/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_DATATABLES_BUTTONS
-	bool "datatables-buttons"
-	depends on BR2_PACKAGE_DATATABLES
-	select BR2_PACKAGE_JSZIP
-	help
-	  The Buttons library for DataTables provides a framework with
-	  common options and API that can be used with DataTables, but
-	  is also very extensible, recognising that you will likely want
-	  to use buttons which perform an action unique to your
-	  applications.
-
-	  https://datatables.net/extensions/buttons
diff --git a/package/datatables-buttons/datatables-buttons.hash b/package/datatables-buttons/datatables-buttons.hash
deleted file mode 100644
index fdbbe5faf0..0000000000
--- a/package/datatables-buttons/datatables-buttons.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  427632c0245f488328edab83b53294545744c8de621a5eaa9dd3d257d7ed7775  Buttons-1.6.1.zip
-sha256  21fa7cbc3c00bcad1e0f3417d465e702bd470d7dc446a6deff80c8fc5eda9148  License.txt
diff --git a/package/datatables-buttons/datatables-buttons.mk b/package/datatables-buttons/datatables-buttons.mk
deleted file mode 100644
index a08be05869..0000000000
--- a/package/datatables-buttons/datatables-buttons.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables-buttons
-#
-################################################################################
-
-DATATABLES_BUTTONS_VERSION = 1.6.1
-DATATABLES_BUTTONS_SITE = https://datatables.net/releases
-DATATABLES_BUTTONS_SOURCE = Buttons-$(DATATABLES_BUTTONS_VERSION).zip
-DATATABLES_BUTTONS_LICENSE = MIT
-DATATABLES_BUTTONS_LICENSE_FILES = License.txt
-
-define DATATABLES_BUTTONS_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_BUTTONS_DL_DIR)/$(DATATABLES_BUTTONS_SOURCE) -d $(@D)
-	mv $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)/* $(@D)
-	rmdir $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)
-endef
-
-define DATATABLES_BUTTONS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-buttons/css $(TARGET_DIR)/var/www/datatables-buttons/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/css $(@D)/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/js $(@D)/js/*.min.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/datatables-fixedcolumns/Config.in b/package/datatables-fixedcolumns/Config.in
deleted file mode 100644
index 4d2e5ea06f..0000000000
--- a/package/datatables-fixedcolumns/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_DATATABLES_FIXEDCOLUMNS
-	bool "datatables-fixedcolumns"
-	depends on BR2_PACKAGE_DATATABLES
-	help
-	  When making use of DataTables' x-axis scrolling feature
-	  (scrollX), you may wish to fix the left or right most columns
-	  in place. This extension for DataTables provides exactly this
-	  option.
-
-	  https://datatables.net/extensions/fixedcolumns
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.hash b/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
deleted file mode 100644
index 7bd5697dbe..0000000000
--- a/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  53a7b20ea9dbb6498137cb7260bde8605989ec578e4b71787f5ebc4ef9910bd9  FixedColumns-3.3.0.zip
-sha256  e8e92f97216f9ea00cb2735b933a91ec8e3869bed37b6d63a90f76f41508f2de  License.txt
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
deleted file mode 100644
index 33174e106f..0000000000
--- a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables-fixedcolumns
-#
-################################################################################
-
-DATATABLES_FIXEDCOLUMNS_VERSION = 3.3.0
-DATATABLES_FIXEDCOLUMNS_SITE = https://datatables.net/releases
-DATATABLES_FIXEDCOLUMNS_SOURCE = FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION).zip
-DATATABLES_FIXEDCOLUMNS_LICENSE = MIT
-DATATABLES_FIXEDCOLUMNS_LICENSE_FILES = License.txt
-
-define DATATABLES_FIXEDCOLUMNS_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_FIXEDCOLUMNS_DL_DIR)/$(DATATABLES_FIXEDCOLUMNS_SOURCE) -d $(@D)
-	mv $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)/* $(@D)
-	rmdir $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)
-endef
-
-define DATATABLES_FIXEDCOLUMNS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(TARGET_DIR)/var/www/datatables-fixedcolumns/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(@D)/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/js $(@D)/js/*.min.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/datatables-responsive/Config.in b/package/datatables-responsive/Config.in
deleted file mode 100644
index 085824af40..0000000000
--- a/package/datatables-responsive/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_DATATABLES_RESPONSIVE
-	bool "datatables-responsive"
-	depends on BR2_PACKAGE_DATATABLES
-	help
-	  In the modern world of responsive web design tables can often
-	  cause a particular problem for designers due to their row
-	  based layout.  Responsive is an extension for DataTables that
-	  resolves that problem by optimising the table's layout for
-	  different screen sizes through the dynamic insertion and
-	  removal of columns from the table.
-
-	  https://datatables.net/extensions/responsive
diff --git a/package/datatables-responsive/datatables-responsive.hash b/package/datatables-responsive/datatables-responsive.hash
deleted file mode 100644
index df133f040c..0000000000
--- a/package/datatables-responsive/datatables-responsive.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  47caf3b753dd2c537b8834816eaf38c4df214cb4e6a97144e0de4cf82ad24d02  Responsive-2.2.3.zip
-sha256  da4e1020ae97c095a14d7830c1a8a793e080c062e22d749ecd3fc3c075673dbf  License.txt
diff --git a/package/datatables-responsive/datatables-responsive.mk b/package/datatables-responsive/datatables-responsive.mk
deleted file mode 100644
index 2809a52280..0000000000
--- a/package/datatables-responsive/datatables-responsive.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables-responsive
-#
-################################################################################
-
-DATATABLES_RESPONSIVE_VERSION = 2.2.3
-DATATABLES_RESPONSIVE_SITE = https://datatables.net/releases
-DATATABLES_RESPONSIVE_SOURCE = Responsive-$(DATATABLES_RESPONSIVE_VERSION).zip
-DATATABLES_RESPONSIVE_LICENSE = MIT
-DATATABLES_RESPONSIVE_LICENSE_FILES = License.txt
-
-define DATATABLES_RESPONSIVE_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_RESPONSIVE_DL_DIR)/$(DATATABLES_RESPONSIVE_SOURCE) -d $(@D)
-	mv $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)/* $(@D)
-	rmdir $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)
-endef
-
-define DATATABLES_RESPONSIVE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-responsive/css $(TARGET_DIR)/var/www/datatables-responsive/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/css $(@D)/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/js $(@D)/js/*.min.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/datatables/Config.in b/package/datatables/Config.in
deleted file mode 100644
index 89009712d8..0000000000
--- a/package/datatables/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_DATATABLES
-	bool "datatables"
-	help
-	  Javascript library providing advanced interaction controls
-	  for your HTML tables.
-
-	  https://datatables.net
diff --git a/package/datatables/datatables.hash b/package/datatables/datatables.hash
deleted file mode 100644
index bb31fcac3d..0000000000
--- a/package/datatables/datatables.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  e2c79dd9d02caa04130ce888061bc922e18561e72e842ba0cb657d1812d9f1bf  DataTables-1.10.20.zip
-sha256  c6a873f21550ed804f76013c36e14225704c1aa551fdb870e0c626eb91c19247  license.txt
diff --git a/package/datatables/datatables.mk b/package/datatables/datatables.mk
deleted file mode 100644
index c20cdf1254..0000000000
--- a/package/datatables/datatables.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables
-#
-################################################################################
-
-DATATABLES_VERSION = 1.10.20
-DATATABLES_SITE = https://datatables.net/releases
-DATATABLES_SOURCE = DataTables-$(DATATABLES_VERSION).zip
-DATATABLES_LICENSE = MIT
-DATATABLES_LICENSE_FILES = license.txt
-
-define DATATABLES_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_DL_DIR)/$(DATATABLES_SOURCE) -d $(@D)
-	mv $(@D)/DataTables-$(DATATABLES_VERSION)/* $(@D)
-	rmdir $(@D)/DataTables-$(DATATABLES_VERSION)
-endef
-
-define DATATABLES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables/css $(TARGET_DIR)/var/www/datatables/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/css $(@D)/media/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/js $(@D)/media/js/*.min.js
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
