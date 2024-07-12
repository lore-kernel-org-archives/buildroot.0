Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4736C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A1A41484;
	Fri, 12 Jul 2024 20:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BN-uTa4lNvS; Fri, 12 Jul 2024 20:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F8E4419A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8E4419A3;
	Fri, 12 Jul 2024 20:49:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 537AE1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 414B460651
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Zfm2P2kFVUo for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA9B605BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DA9B605BE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:49:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1572A861F3; Fri, 12 Jul 2024 20:49:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:48:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02f553f02d4042d7a5b9c66ff924c85a6b452472
X-Git-Newrev: f9b5d9170f943ae61fc10a9d119a4ac26e645418
X-Patchwork-Hint: ignore
Message-Id: <20240712204950.1572A861F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mxt-app: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9b5d9170f943ae61fc10a9d119a4ac26e645418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mxt-app is a utility for managing Atmel maXTouch touch controllers
and other devices that support Atmel Object Based Protocol.

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
[Arnout:
 - drop BR2_PACKAGE_MXT_APP_DEBUG option, instead use
   BR2_ENABLE_RUNTIME_DEBUG;
 - also explicitly disable debug;
 - add comment to explain AUTORECONF.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/mxt-app/Config.in    | 15 +++++++++++++++
 package/mxt-app/mxt-app.hash |  3 +++
 package/mxt-app/mxt-app.mk   | 22 ++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 896791cab3..d5ca42fb00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2824,6 +2824,7 @@ F:	package/biosdevname/
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
 F:	package/procs/
+F:	package/mxt-app/
 F:	package/zoxide/
 
 N:	Sam Lancia <sam@gpsm.co.uk>
diff --git a/package/Config.in b/package/Config.in
index 2b71978112..34ce57f5cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -565,6 +565,7 @@ endmenu
 	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
+	source "package/mxt-app/Config.in"
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
diff --git a/package/mxt-app/Config.in b/package/mxt-app/Config.in
new file mode 100644
index 0000000000..96085e7f7d
--- /dev/null
+++ b/package/mxt-app/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_MXT_APP
+	bool "mxt-app"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  mxt-app is a utility for managing Atmel maXTouch touch
+	  controllers and other devices that support Atmel Object Based
+	  Protocol.
+
+	  https://github.com/atmel-maxtouch/mxt-app/
+
+comment "mxt-app needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/mxt-app/mxt-app.hash b/package/mxt-app/mxt-app.hash
new file mode 100644
index 0000000000..b7851cea37
--- /dev/null
+++ b/package/mxt-app/mxt-app.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3639720ae1ea033bd982d68c5cab84432ce046fe14a66d9b2de07f115b642722  mxt-app-1.36.tar.gz
+sha256  3682b125a40a4da00b6ab69bdbd38c25ed4beae69b3fe32458d2e32638477c4c  LICENSE
diff --git a/package/mxt-app/mxt-app.mk b/package/mxt-app/mxt-app.mk
new file mode 100644
index 0000000000..3da1458978
--- /dev/null
+++ b/package/mxt-app/mxt-app.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# mxt-app
+#
+################################################################################
+
+MXT_APP_VERSION = 1.36
+MXT_APP_SITE = $(call github,atmel-maxtouch,mxt-app,v$(MXT_APP_VERSION))
+MXT_APP_LICENSE = BSD-2-Clause
+MXT_APP_LICENSE_FILES = LICENSE
+MXT_APP_DEPENDENCIES = libusb
+MXT_APP_INSTALL_STAGING = YES
+# From a git tree: no generated autotools files
+MXT_APP_AUTORECONF = YES
+
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
+MXT_APP_CONF_OPTS += --enable-debug
+else
+MXT_APP_CONF_OPTS += --disable-debug
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
