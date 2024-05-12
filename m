Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26525C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 08:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44754220B;
	Sun, 12 May 2024 08:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbEpriJHbWOU; Sun, 12 May 2024 08:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83C7F4220D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83C7F4220D;
	Sun, 12 May 2024 08:20:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 627441BF3F6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 08:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E5766075B
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 08:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_rDsLadHhSL for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 08:19:59 +0000 (UTC)
X-Greylist: delayed 2082 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 12 May 2024 08:19:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF04760790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF04760790
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF04760790
 for <buildroot@buildroot.org>; Sun, 12 May 2024 08:19:57 +0000 (UTC)
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
 by Atcsqr.andestech.com with ESMTP id 44C7jOOI086864
 for <buildroot@buildroot.org>; Sun, 12 May 2024 15:45:24 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 44C7j937086819
 for <buildroot@buildroot.org>; Sun, 12 May 2024 15:45:09 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Sun, 12 May 2024 15:45:09 +0800
To: <buildroot@buildroot.org>
Date: Sun, 12 May 2024 15:44:59 +0800
Message-ID: <20240512074459.1360700-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 44C7jOOI086864
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: [Buildroot] [PATCH] package/kmon: new package
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
From: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Reply-To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Kmon, a Rust-based, text-UI tool for managing Linux kernel
modules and monitoring kernel activities, providing a single
interface for various tools like dmesg and kmod.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 package/Config.in      |  1 +
 package/kmon/Config.in |  9 +++++++++
 package/kmon/kmon.hash |  4 ++++
 package/kmon/kmon.mk   | 12 ++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/kmon/Config.in
 create mode 100644 package/kmon/kmon.hash
 create mode 100644 package/kmon/kmon.mk

diff --git a/package/Config.in b/package/Config.in
index 0c17154877..f17547775e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2753,6 +2753,7 @@ menu "System tools"
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
index 0000000000..87b7ab5986
--- /dev/null
+++ b/package/kmon/kmon.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  bc2d495bfca48cdfe4d4e3cab1dafd887ebbca9310a99613182b4f26c530acc5  kmon-v1.6.5.tar.gz
+sha256  f1d7ca1381b10a10523fbde322ffcd54245328b1b442a9d3e348c800279a29de  kmon-v1.6.5-cargo2.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/kmon/kmon.mk b/package/kmon/kmon.mk
new file mode 100644
index 0000000000..5208124223
--- /dev/null
+++ b/package/kmon/kmon.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# kmon
+#
+################################################################################
+
+KMON_VERSION = v1.6.5
+KMON_SITE = $(call github,orhun,kmon,$(KMON_VERSION))
+KMON_LICENSE = GPL-3.0
+KMON_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
