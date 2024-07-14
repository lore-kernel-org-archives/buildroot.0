Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6471C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C9D606C4;
	Sun, 14 Jul 2024 15:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TchdolCBmgtd; Sun, 14 Jul 2024 15:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF915605F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF915605F8;
	Sun, 14 Jul 2024 15:57:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAC0D1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 971DC60610
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id We8wYZpAWa4Y for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB6E605C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCB6E605C3
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:57:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7E62868B6; Sun, 14 Jul 2024 15:57:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 17:55:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25ab3f3fb2b5d30a10a91e0224f0d017e31b1903
X-Git-Newrev: 7dcc56a50c35c9397b369678834a9d31c3b500ee
X-Patchwork-Hint: ignore
Message-Id: <20240714155712.A7E62868B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmon: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dcc56a50c35c9397b369678834a9d31c3b500ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Kmon, a Rust-based, text-UI tool for managing Linux kernel
modules and monitoring kernel activities, providing a single
interface for various tools like dmesg and kmod.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/kmon/Config.in |  9 +++++++++
 package/kmon/kmon.hash |  3 +++
 package/kmon/kmon.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c7305cc7..466dcd4826 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2455,6 +2455,7 @@ F:	package/tcf-agent/
 N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	board/andes
 F:	configs/andes_ae350_45_defconfig
+F:	package/kmon/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
diff --git a/package/Config.in b/package/Config.in
index 1c9e284a64..c40dc34ae7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2780,6 +2780,7 @@ menu "System tools"
 	source "package/jailhouse/Config.in"
 	source "package/keyutils/Config.in"
 	source "package/kmod/Config.in"
+	source "package/kmon/Config.in"
 	source "package/kvmtool/Config.in"
 	source "package/libostree/Config.in"
 	source "package/libvirt/Config.in"
diff --git a/package/kmon/Config.in b/package/kmon/Config.in
new file mode 100644
index 0000000000..7c56f387fa
--- /dev/null
+++ b/package/kmon/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KMON
+	bool "kmon"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  kmon provides a terminal UI for managing kernel modules
+	  and monitoring kernel activities.
+
+	  https://github.com/orhun/kmon
diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
new file mode 100644
index 0000000000..96400977b8
--- /dev/null
+++ b/package/kmon/kmon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e4723d733a2b6ad5f318a6bea77f973f3a9dbfdb727ba00352a13b9db0522194  kmon-1.6.5-cargo2.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/kmon/kmon.mk b/package/kmon/kmon.mk
new file mode 100644
index 0000000000..afd996f376
--- /dev/null
+++ b/package/kmon/kmon.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# kmon
+#
+################################################################################
+
+KMON_VERSION = 1.6.5
+KMON_SITE = $(call github,orhun,kmon,v$(KMON_VERSION))
+KMON_LICENSE = GPL-3.0
+KMON_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
