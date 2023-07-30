Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5ABC001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C2D61045;
	Sun, 30 Jul 2023 21:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C2D61045
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ir3LzrFR1q3X; Sun, 30 Jul 2023 21:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9369761035;
	Sun, 30 Jul 2023 21:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9369761035
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC98A1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 922E961030
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 922E961030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Y9bZkABpUqv for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E65460804
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E65460804
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B75483D58; Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:45:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 941b6565ddad49298293272f55c5e55489dc8fdc
X-Git-Newrev: baff13d0799e840ccffe0751c07172ecf206de96
X-Patchwork-Hint: ignore
Message-Id: <20230730215545.0B75483D58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swugenerator: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=baff13d0799e840ccffe0751c07172ecf206de96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add swugenerator as host utility to generate images for swupdate with
all the possible options available like encryption, passkey etc.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/swugenerator/Config.in.host    |  6 ++++++
 package/swugenerator/swugenerator.hash |  4 ++++
 package/swugenerator/swugenerator.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19cc5709e4..3780204227 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1198,6 +1198,7 @@ F:	package/rtl8821cu/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
+F:	package/swugenerator/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/wilc-driver/
diff --git a/package/Config.in.host b/package/Config.in.host
index ab91bd4e70..92af02e6af 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -101,6 +101,7 @@ menu "Host utilities"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/swugenerator/Config.in.host"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
diff --git a/package/swugenerator/Config.in.host b/package/swugenerator/Config.in.host
new file mode 100644
index 0000000000..df0e9a5170
--- /dev/null
+++ b/package/swugenerator/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_SWUGENERATOR
+	bool "host swugenerator"
+	help
+	  A host tool to generate SWU update package for SWUpdate.
+
+	  https://github.com/sbabic/swugenerator
diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
new file mode 100644
index 0000000000..2125be3d1c
--- /dev/null
+++ b/package/swugenerator/swugenerator.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  b5c47c47be0df4df476d2bf596f58a7296a4b0cebe6c8de42251605475b37d25  swugenerator-0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
new file mode 100644
index 0000000000..f4ead1d229
--- /dev/null
+++ b/package/swugenerator/swugenerator.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# swugenerator
+#
+################################################################################
+
+SWUGENERATOR_VERSION = 0.2
+SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
+SWUGENERATOR_LICENSE = GPL-3.0
+SWUGENERATOR_LICENSE_FILES = LICENSE
+HOST_SWUGENERATOR_SETUP_TYPE = setuptools
+HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
