Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25531D5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 21:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0084606EB;
	Sat,  9 Nov 2024 21:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pi4j90Pq4zNP; Sat,  9 Nov 2024 21:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD0B60702
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAD0B60702;
	Sat,  9 Nov 2024 21:39:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FB47C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F230B80CF1
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uW2u_1v_j7_U for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 21:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18CD980D2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18CD980D2A
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 21:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 036B885F58; Sat,  9 Nov 2024 21:39:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 22:26:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 805e38c550b87b60fa32e8b97f0bd7abe3d14447
X-Git-Newrev: aead102d3f198314aa3019a2c1198ab6cbc1b04c
X-Patchwork-Hint: ignore
Message-Id: <20241109213903.036B885F58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uefisettings: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aead102d3f198314aa3019a2c1198ab6cbc1b04c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add "depends on BR2_ARCH_IS_64"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/uefisettings/Config.in         | 10 ++++++++++
 package/uefisettings/uefisettings.hash |  3 +++
 package/uefisettings/uefisettings.mk   | 12 ++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 11a4ccb293..456ad03c18 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1524,6 +1524,7 @@ F:	package/sratom/
 F:	package/stb/
 F:	package/superiotool/
 F:	package/tailscale/
+F:	package/uefisettings/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index 6a80ecd471..541b6a67da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -648,6 +648,7 @@ endmenu
 	source "package/udev/Config.in"
 	source "package/udev-gentoo-scripts/Config.in"
 	source "package/udisks/Config.in"
+	source "package/uefisettings/Config.in"
 	source "package/uhubctl/Config.in"
 	source "package/umtprd/Config.in"
 	source "package/upower/Config.in"
diff --git a/package/uefisettings/Config.in b/package/uefisettings/Config.in
new file mode 100644
index 0000000000..469738d115
--- /dev/null
+++ b/package/uefisettings/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_UEFISETTINGS
+	bool "uefisettings"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  The tool to read/get/extract and write/change/modify
+	  BIOS/UEFI settings from Linux terminal.
+
+	  https://github.com/linuxboot/uefisettings
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
new file mode 100644
index 0000000000..505b5de566
--- /dev/null
+++ b/package/uefisettings/uefisettings.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  5d4d6f771e615df9fee3d531c85dad9946ed793fc0a0e636dee1d342780f7863  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo2.tar.gz
+sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/uefisettings/uefisettings.mk b/package/uefisettings/uefisettings.mk
new file mode 100644
index 0000000000..0559b1c504
--- /dev/null
+++ b/package/uefisettings/uefisettings.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# uefisettings
+#
+################################################################################
+
+UEFISETTINGS_VERSION = f90aed759b9c2217bea336e37ab5282616ece390
+UEFISETTINGS_SITE = $(call github,linuxboot,uefisettings,$(UEFISETTINGS_VERSION))
+UEFISETTINGS_LICENSE = BSD-3-Clause
+UEFISETTINGS_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
