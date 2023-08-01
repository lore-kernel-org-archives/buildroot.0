Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CE3C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8646119D;
	Tue,  1 Aug 2023 21:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8646119D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1zniuiqlPVA; Tue,  1 Aug 2023 21:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C8760DFF;
	Tue,  1 Aug 2023 21:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C8760DFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 139701BF860
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB09160B1B
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB09160B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uawUK_-6pn1Q for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:04:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F03A1600C7
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03A1600C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF86183F9D; Tue,  1 Aug 2023 21:04:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:04:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82508681b3cb23ae50f060b519e41b295cdb4b8c
X-Git-Newrev: 8a12985e5277cc47f0f68c85f8f4b11709e1a574
X-Patchwork-Hint: ignore
Message-Id: <20230801210427.DF86183F9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/composer: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a12985e5277cc47f0f68c85f8f4b11709e1a574
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

composer describes itself as a dependency manager for PHP, it is used
by projects such as CakePHP.

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host          |  1 +
 package/composer/Config.in.host |  8 ++++++++
 package/composer/composer.hash  |  4 ++++
 package/composer/composer.mk    | 31 +++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 92af02e6af..aa1f15e3ac 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/checkpolicy/Config.in.host"
 	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
+	source "package/composer/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/crudini/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
diff --git a/package/composer/Config.in.host b/package/composer/Config.in.host
new file mode 100644
index 0000000000..ced73ceae9
--- /dev/null
+++ b/package/composer/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_COMPOSER
+	bool "host composer"
+	help
+	  Composer is a tool for dependency management in PHP. It
+	  allows you to declare the libraries your project depends on
+	  and it will manage (install/update) them for you.
+
+	  https://getcomposer.org/
diff --git a/package/composer/composer.hash b/package/composer/composer.hash
new file mode 100644
index 0000000000..123d6de1be
--- /dev/null
+++ b/package/composer/composer.hash
@@ -0,0 +1,4 @@
+# Hash from https://getcomposer.org/download/
+sha256  f07934fad44f9048c0dc875a506cca31cc2794d6aebfc1867f3b1fbf48dce2c5  composer-2.5.8.phar
+# Locally calculated
+sha256  c8cce4b6b9729f264ffdf9296d505d63432497feeed1f586d1902b942197e024  LICENSE
diff --git a/package/composer/composer.mk b/package/composer/composer.mk
new file mode 100644
index 0000000000..a24c020796
--- /dev/null
+++ b/package/composer/composer.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# composer
+#
+################################################################################
+
+COMPOSER_VERSION = 2.5.8
+COMPOSER_SOURCE = composer-$(COMPOSER_VERSION).phar
+# Here, we pass a dummy URL parameter in order to control the name the file
+# will have once downloaded.
+# Otherwise, the names will clash ifever we update the version.
+BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
+COMPOSER_SITE = $(BASE_SITE)?n=f/$(COMPOSER_SOURCE)
+COMPOSER_LICENSE = MIT
+COMPOSER_LICENSE_FILES = LICENSE
+
+HOST_COMPOSER_DEPENDENCIES = host-php
+
+define HOST_COMPOSER_EXTRACT_CMDS
+	cp $(HOST_COMPOSER_DL_DIR)/$(COMPOSER_SOURCE) $(@D)
+	cd $(@D); $(HOST_DIR)/bin/php <<< '<?php \
+		$$p = new Phar("$(COMPOSER_SOURCE)"); \
+		$$p->extractTo(".", "LICENSE");'
+endef
+
+define HOST_COMPOSER_INSTALL_CMDS
+	mv $(@D)/$(COMPOSER_SOURCE) $(HOST_DIR)/bin/composer
+	chmod +x $(HOST_DIR)/bin/composer
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
