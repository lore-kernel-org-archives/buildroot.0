Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E555C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60BD781842;
	Wed,  7 Feb 2024 09:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9gMpshZFN2g; Wed,  7 Feb 2024 09:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD5D8144B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD5D8144B;
	Wed,  7 Feb 2024 09:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59EF61BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4725D40232
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ji5GBuNhKpVs for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB3FE400C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3FE400C1
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:39:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DC5F8751B; Wed,  7 Feb 2024 09:39:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 10:39:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f443c7236d42c21f676cfb2cd3c8deea2423a3c2
X-Git-Newrev: 678cf889ec2551a0a523dbf67cf08d8880cc0aa7
X-Patchwork-Hint: ignore
Message-Id: <20240207093924.3DC5F8751B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davinci-bootcount: rename to
 uboot-bootcount
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

commit: https://git.buildroot.net/buildroot/commit/?id=678cf889ec2551a0a523dbf67cf08d8880cc0aa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Born as a project to read/write the bootcount on the TI am3xx platform,
over time it has introduced bootcount management on EEPROM and for the
stm32mp1 platform. As a result, the project removed the 'davinci' tag
from its name and GitHub link.
The patch aligns the package name in Buildroot with the current one on
GitHub.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Peter: extend/rework legacy handling]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                          |  8 ++++++++
 DEVELOPERS                                                |  2 +-
 package/Config.in                                         |  2 +-
 package/davinci-bootcount/Config.in                       | 11 -----------
 package/davinci-bootcount/davinci-bootcount.mk            | 15 ---------------
 package/uboot-bootcount/Config.in                         |  9 +++++++++
 .../uboot-bootcount.hash}                                 |  2 +-
 package/uboot-bootcount/uboot-bootcount.mk                | 15 +++++++++++++++
 8 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5fbe5d9030..5e0db855cc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.02"
 
+config BR2_PACKAGE_DAVINCI_BOOTCOUNT
+	bool "davinci-bootcount has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_UBOOT_BOOTCOUNT
+	help
+	  The davinci-bootcount package has been renamed to
+	  uboot-bootcount.
+
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 7906a940a9..43dd5c8cb4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -760,7 +760,7 @@ F:	package/sscep/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
-F:	package/davinci-bootcount/
+F:	package/uboot-bootcount/
 F:	package/libmnl/
 
 N:	David Bachelart <david.bachelart@bbright.com>
diff --git a/package/Config.in b/package/Config.in
index 24e5f04ed6..4c6deb1333 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -486,7 +486,6 @@ endmenu
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
-	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-broker/Config.in"
 	source "package/dbus-cpp/Config.in"
@@ -638,6 +637,7 @@ endmenu
 	source "package/ti-utils/Config.in"
 	source "package/tio/Config.in"
 	source "package/triggerhappy/Config.in"
+	source "package/uboot-bootcount/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
 	source "package/udev/Config.in"
diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
deleted file mode 100644
index 0201530f91..0000000000
--- a/package/davinci-bootcount/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_DAVINCI_BOOTCOUNT
-	bool "davinci-bootcount"
-	depends on BR2_arm # only relevant for TI am335x
-	help
-	  U-Boot implements a boot count scheme that can be used to
-	  detect multiple failed attempts to boot Linux. On Davinci
-	  platform (TI AM 335x) the `bootcount' is stored in the RTC
-	  SCRATCH2 register. This tool allows to read and write this
-	  register from userspace.
-
-	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.mk b/package/davinci-bootcount/davinci-bootcount.mk
deleted file mode 100644
index 884bf420f3..0000000000
--- a/package/davinci-bootcount/davinci-bootcount.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# davinci-bootcount
-#
-################################################################################
-
-DAVINCI_BOOTCOUNT_VERSION = 2.0.0
-DAVINCI_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(DAVINCI_BOOTCOUNT_VERSION))
-DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
-DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
-
-# sources fetched from github, no configure script
-DAVINCI_BOOTCOUNT_AUTORECONF = YES
-
-$(eval $(autotools-package))
diff --git a/package/uboot-bootcount/Config.in b/package/uboot-bootcount/Config.in
new file mode 100644
index 0000000000..ae936b424a
--- /dev/null
+++ b/package/uboot-bootcount/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UBOOT_BOOTCOUNT
+	bool "uboot-bootcount"
+	help
+	  U-Boot implements a boot count scheme that can be used to
+	  detect multiple failed attempts to boot Linux. This tool
+	  allows to read and write bootcount from userspace for some
+	  platforms (TI AM335X or STM32MP1) or from I2C EEPROM.
+
+	  https://github.com/VoltServer/uboot-bootcount
diff --git a/package/davinci-bootcount/davinci-bootcount.hash b/package/uboot-bootcount/uboot-bootcount.hash
similarity index 80%
rename from package/davinci-bootcount/davinci-bootcount.hash
rename to package/uboot-bootcount/uboot-bootcount.hash
index 53435b1d1d..e1ebc44235 100644
--- a/package/davinci-bootcount/davinci-bootcount.hash
+++ b/package/uboot-bootcount/uboot-bootcount.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  davinci-bootcount-2.0.0.tar.gz
+sha256  12b5aa83736efb2fefd22cd4d9f305a25c68dfaa10401d5efb17e55a5163934e  uboot-bootcount-2.0.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uboot-bootcount/uboot-bootcount.mk b/package/uboot-bootcount/uboot-bootcount.mk
new file mode 100644
index 0000000000..07b52ab89e
--- /dev/null
+++ b/package/uboot-bootcount/uboot-bootcount.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# uboot-bootcount
+#
+################################################################################
+
+UBOOT_BOOTCOUNT_VERSION = 2.0.0
+UBOOT_BOOTCOUNT_SITE = $(call github,VoltServer,uboot-bootcount,v$(UBOOT_BOOTCOUNT_VERSION))
+UBOOT_BOOTCOUNT_LICENSE = GPL-3.0
+UBOOT_BOOTCOUNT_LICENSE_FILES = COPYING
+
+# sources fetched from github, no configure script
+UBOOT_BOOTCOUNT_AUTORECONF = YES
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
