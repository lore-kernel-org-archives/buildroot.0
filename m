Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97277C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 11:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 332DE400E4;
	Mon,  5 Aug 2024 11:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ldaL-oVlrwk; Mon,  5 Aug 2024 11:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 009E1400F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 009E1400F1;
	Mon,  5 Aug 2024 11:12:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D3711BF329
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 11:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A1E04027D
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 11:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoaU2bqsXC3X for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 11:12:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307A240263
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307A240263
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 11:12:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C09084091; Mon,  5 Aug 2024 11:12:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Aug 2024 13:12:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 327312359a742f40d35c241958602b2026f0a1ba
X-Git-Newrev: 9ef47358431814d752f1005f99415f3f3e205fe6
X-Patchwork-Hint: ignore
Message-Id: <20240805111250.1C09084091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nethogs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ef47358431814d752f1005f99415f3f3e205fe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/nethogs/Config.in    | 10 ++++++++++
 package/nethogs/nethogs.hash |  3 +++
 package/nethogs/nethogs.mk   | 21 +++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 68729f721b..8e46beff00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2204,6 +2204,7 @@ F:	utils/config
 F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
+F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
 F:	package/python-jc/
diff --git a/package/Config.in b/package/Config.in
index e21987717f..2ac351cce5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2527,6 +2527,7 @@ endif
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
+	source "package/nethogs/Config.in"
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
 	source "package/netstat-nat/Config.in"
diff --git a/package/nethogs/Config.in b/package/nethogs/Config.in
new file mode 100644
index 0000000000..2d6b44739c
--- /dev/null
+++ b/package/nethogs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETHOGS
+	bool "nethogs"
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_NCURSES
+	help
+	  NetHogs is a small 'net top' tool. Instead of breaking the
+	  traffic down per protocol or per subnet, like most tools
+	  do, it groups bandwidth by process.
+
+          https://github.com/raboof/nethogs
diff --git a/package/nethogs/nethogs.hash b/package/nethogs/nethogs.hash
new file mode 100644
index 0000000000..fd1f236250
--- /dev/null
+++ b/package/nethogs/nethogs.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  957d6afcc220dfbba44c819162f44818051c5b4fb793c47ba98294393986617d  nethogs-0.8.7.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nethogs/nethogs.mk b/package/nethogs/nethogs.mk
new file mode 100644
index 0000000000..98c4f5f008
--- /dev/null
+++ b/package/nethogs/nethogs.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# nethogs
+#
+################################################################################
+
+NETHOGS_VERSION = 0.8.7
+NETHOGS_SITE = $(call github,raboof,nethogs,v$(NETHOGS_VERSION))
+NETHOGS_LICENSE = GPL-2.0+
+NETHOGS_LICENSE_FILES = COPYING
+NETHOGS_DEPENDENCIES = libpcap ncurses
+
+define NETHOGS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) nethogs
+endef
+
+define NETHOGS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/nethogs $(TARGET_DIR)/usr/sbin/nethogs
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
