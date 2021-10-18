Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF13EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873076128B
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 873076128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E53A83027;
	Mon, 18 Oct 2021 19:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wE5WFsVzGsnA; Mon, 18 Oct 2021 19:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B10A482A56;
	Mon, 18 Oct 2021 19:31:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0271BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0A98607C4
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjwSd6tLMYv7 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76FF760817
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 36D02875D5; Mon, 18 Oct 2021 19:24:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:27:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 436378ecd5872e884839751eac2e487f952be4db
X-Git-Newrev: a8295d4c9e57ab4aa337eba658be65a50bcfb3b4
X-Patchwork-Hint: ignore
Message-Id: <20211018192438.36D02875D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uqmi: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8295d4c9e57ab4aa337eba658be65a50bcfb3b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/uqmi/Config.in | 15 +++++++++++++++
 package/uqmi/uqmi.hash |  3 +++
 package/uqmi/uqmi.mk   | 14 ++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 871df1e7bb..0899146576 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2174,6 +2174,7 @@ F:	package/racehound/
 F:	package/redir/
 F:	package/rtl8812au-aircrack-ng/
 F:	package/uredir/
+F:	package/uqmi/
 F:	package/wayland-utils/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 48f365d773..92026e85c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2343,6 +2343,7 @@ endif
 	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
 	source "package/unbound/Config.in"
+	source "package/uqmi/Config.in"
 	source "package/uredir/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
diff --git a/package/uqmi/Config.in b/package/uqmi/Config.in
new file mode 100644
index 0000000000..21f0bd9077
--- /dev/null
+++ b/package/uqmi/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_UQMI
+	bool "uqmi"
+	depends on !BR2_STATIC_LIBS # libubox
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBUBOX
+	help
+	  This command line tool originates from the OpenWrt project
+	  to configure LTE modem in QMI mode for WAN connection.
+
+	  https://git.openwrt.org/project/uqmi.git
+
+comment "uqmi needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS
diff --git a/package/uqmi/uqmi.hash b/package/uqmi/uqmi.hash
new file mode 100644
index 0000000000..2db5d330e2
--- /dev/null
+++ b/package/uqmi/uqmi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-br1.tar.gz
+sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  main.c
diff --git a/package/uqmi/uqmi.mk b/package/uqmi/uqmi.mk
new file mode 100644
index 0000000000..f20c3f5141
--- /dev/null
+++ b/package/uqmi/uqmi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# uqmi
+#
+################################################################################
+
+UQMI_VERSION = 0a19b5b77140465c29e2afa7d611fe93abc9672f
+UQMI_SITE = https://git.openwrt.org/project/uqmi.git
+UQMI_SITE_METHOD = git
+UQMI_LICENSE = LGPL-2.0+
+UQMI_LICENSE_FILES = main.c
+UQMI_DEPENDENCIES = json-c libubox
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
