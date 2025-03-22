Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55103C35FFC
	for <buildroot@archiver.kernel.org>; Sat, 22 Mar 2025 11:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34754251E;
	Sat, 22 Mar 2025 11:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLqdUeeW6b3b; Sat, 22 Mar 2025 11:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153134251D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153134251D;
	Sat, 22 Mar 2025 11:57:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92F1A5E
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 11:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8484D4251C
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 11:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ld69nNO8Tabr for <buildroot@buildroot.org>;
 Sat, 22 Mar 2025 11:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94061406D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94061406D4
 for <buildroot@buildroot.org>; Sat, 22 Mar 2025 11:57:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 812D4881D5; Sat, 22 Mar 2025 11:57:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Mar 2025 12:34:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 486672da0243f5f397d91ff50bc0ed23cec96348
X-Git-Newrev: e59cb9e95630efbefadead1ffa8f11e11fc13737
X-Patchwork-Hint: ignore
Message-Id: <20250322115753.812D4881D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lowdown: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e59cb9e95630efbefadead1ffa8f11e11fc13737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/lowdown/Config.in    | 14 ++++++++++++++
 package/lowdown/lowdown.hash |  5 +++++
 package/lowdown/lowdown.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 026670cece..a0e0183257 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1636,6 +1636,7 @@ F:	package/libite/
 F:	package/libnet/
 F:	package/libteam/
 F:	package/libuev/
+F:	package/lowdown/
 F:	package/mg/
 F:	package/mdnsd/
 F:	package/mini-snmpd/
diff --git a/package/Config.in b/package/Config.in
index 120a71dd2d..60b375e674 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2779,6 +2779,7 @@ comment "Utilities"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
 	source "package/logsurfer/Config.in"
+	source "package/lowdown/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
 	source "package/pdmenu/Config.in"
diff --git a/package/lowdown/Config.in b/package/lowdown/Config.in
new file mode 100644
index 0000000000..00ae6fcce6
--- /dev/null
+++ b/package/lowdown/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LOWDOWN
+	bool "lowdown"
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS
+	help
+	  Simple markdown translator to HTML5, terminal, and more.
+	  Useful for providing the same help texts both for a CLI
+	  and web.
+
+	  https://kristaps.bsd.lv/lowdown/
+
+comment "lowdown needs a toolchain w/ wchar and shared library support"
+	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS
diff --git a/package/lowdown/lowdown.hash b/package/lowdown/lowdown.hash
new file mode 100644
index 0000000000..0b4d1fd25d
--- /dev/null
+++ b/package/lowdown/lowdown.hash
@@ -0,0 +1,5 @@
+# SHA512 from release archive https://kristaps.bsd.lv/lowdown/snapshots/
+sha512  316b27384f83cb57fa414c315556fd177f2998c009e031986446e82252f276dc68adfeb263b88640deccb7084da4771d0ee8fae7d37388dba4e1a0aa426c701d  lowdown-1.4.0.tar.gz
+
+# Locally calculated
+sha256  204658eb0d5ba87935056630534cdafd21ed29597e0a9c9f8f557779a3fb99d4  LICENSE.md
diff --git a/package/lowdown/lowdown.mk b/package/lowdown/lowdown.mk
new file mode 100644
index 0000000000..d88b70327a
--- /dev/null
+++ b/package/lowdown/lowdown.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# lowdown
+#
+################################################################################
+
+LOWDOWN_VERSION = 1.4.0
+LOWDOWN_SITE = https://kristaps.bsd.lv/lowdown/snapshots
+LOWDOWN_LICENSE = ISC
+LOWDOWN_LICENSE_FILES = LICENSE.md
+
+define LOWDOWN_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
+endef
+
+define LOWDOWN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define LOWDOWN_INSTALL_TARGET_CMDS
+	$(INSTALL) -t $(TARGET_DIR)/usr/bin -D -m 0755 $(@D)/lowdown
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
