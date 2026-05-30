Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36C6CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C0161BDC;
	Sat, 30 May 2026 13:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KT3olbZMaOwA; Sat, 30 May 2026 13:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1BC6F544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780147225;
	bh=7JzuoFP2aLzqidWPDDcBxov+xcijKrNBfwR6cuUZj/U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T/sz9rpJQ5k79Hk76QZFsg0Kcm4KiBdWFMgxj24WZsr4l/oG6C95wtBEjcw2gBCed
	 ZslN5CeICDJuvizLr/zm1mPycJg+ajFnal7JswPVcjM6zaX1GNqR/e2OqhlJIhxXVt
	 aNKJJXM80iB6u4fsRWoCo76cuZcd+HCKuG+W2t7GTRePm0QzgVQxV56kh5+g+F4DiL
	 j8pRYfFje8CjaVZCrCt7lOMXaKwFvPeKp0Da/lfHAjppLGYB9SOKF2TZ+hYicqzH50
	 2gAD18UYOu7V6whH9j74BwX43KoHOino4Vt/pZ7DqpoyqzkAQcWsxIPZVe1mfOwxjq
	 EsR6AaWs1XvJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C1BC6F544;
	Sat, 30 May 2026 13:20:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EBE3F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C4784843
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElFjSXrVxoB3 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC7884833
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CC7884833
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:20:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71EF487500; Sat, 30 May 2026 13:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:19:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 354b8442f89b88c031c8f36f6a7c3d6a3cc5b975
X-Git-Newrev: 8c73968354a75608b24ea59877471f4568cc824e
X-Patchwork-Hint: ignore
Message-Id: <20260530132010.71EF487500@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dtui: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c73968354a75608b24ea59877471f4568cc824e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

DTUI is a small TUI for introspecting the state of the system/session
D-Bus. It shows current services and lets you introspect objects and
their interfaces.

This package is built with Rust/Cargo.

Upstream: https://github.com/Troels51/dtui
License: MIT
Signed-off-by: Christopher Obbard <obbardc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/dtui/Config.in | 18 ++++++++++++++++++
 package/dtui/dtui.hash |  3 +++
 package/dtui/dtui.mk   | 13 +++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d67faa0e2..1adeaf7efe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -704,6 +704,9 @@ F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
+N:	Christopher Obbard <obbardc@gmail.com>
+F:	package/dtui/
+
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
 F:	package/rauc-hawkbit-updater/
diff --git a/package/Config.in b/package/Config.in
index c4f279efbb..19c4ac2221 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2811,6 +2811,7 @@ menu "System tools"
 	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/dtui/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/dtui/Config.in b/package/dtui/Config.in
new file mode 100644
index 0000000000..65d51df7d5
--- /dev/null
+++ b/package/dtui/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_DTUI
+	bool "dtui"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  dtui is a minimal TUI for introspecting the state of the
+	  system/session D-Bus. It shows current services and lets
+	  you introspect objects and their interfaces.
+
+	  https://github.com/Troels51/dtui
+
+comment "dtui needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
new file mode 100644
index 0000000000..a1189ba0d1
--- /dev/null
+++ b/package/dtui/dtui.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  59d430ad546c7a0af3a1fce08aaf05dc17e9b295ba56dbfbd64ddb67e3525ba2  dtui-3.0.0-cargo5.tar.gz
+sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dtui/dtui.mk b/package/dtui/dtui.mk
new file mode 100644
index 0000000000..fad5f818b4
--- /dev/null
+++ b/package/dtui/dtui.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# dtui
+#
+################################################################################
+
+DTUI_VERSION = 3.0.0
+DTUI_SITE = $(call github,Troels51,dtui,v$(DTUI_VERSION))
+
+DTUI_LICENSE = MIT
+DTUI_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
