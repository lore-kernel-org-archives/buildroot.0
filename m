Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EADE93805
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 20:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1033E616DA;
	Sun, 12 Apr 2026 20:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9L3AMe94vX7; Sun, 12 Apr 2026 20:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3214D616EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776026628;
	bh=Ibvze8M0Kv5FhK6yx8VXAABvKK0s3I9ANZ/wR7/cBm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qn0GnmX1KSlZYA9xpFjvfaub2Hrv2tWIilzhvtcjyYqltb8wzk/lP9eUeFb+rkktj
	 IS9dklJ1PAWtpa79Ik1HlD3uzP9JqszQv9jmKyAhHIAqQWp+9LA0jV1bSE8gX0ZjAR
	 75ct70vC5Gmr8/KssFri7JhedgEe0wUBz++tTsq9IxU+ftrFMGBuzTL0HJITE3ueOj
	 o8pEsuPfaaODkZt1VccWwHmEntQj4BxGLfO73VphaEB6N1L+iNH4UZKNbo6OwbNzew
	 pBQRLu4NNSoqZSQ8NSBNk4WUBv1jGKFeCMsGTdGtD64nBeBZpQeciVtHLxBkKPFFCq
	 u6hbBD58zGSKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3214D616EB;
	Sun, 12 Apr 2026 20:43:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63EEB283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 556D1616EB
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yx5rOIkVQ4S for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 20:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 735D9616DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 735D9616DA
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 20:43:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F33208123C; Sun, 12 Apr 2026 20:43:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 22:42:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 356c092389cf91a992442d5ea050841c6695fac7
X-Git-Newrev: 8b2b857b1f0e0548ecc8ebaa9ca50f39c272cdc1
X-Patchwork-Hint: ignore
Message-Id: <20260412204345.F33208123C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ugetty: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b2b857b1f0e0548ecc8ebaa9ca50f39c272cdc1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Minimal getty implementation with optional ppp and ssh multiplexing support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/busybox/busybox.mk |  1 +
 package/ugetty/Config.in   | 10 ++++++++++
 package/ugetty/ugetty.hash |  6 ++++++
 package/ugetty/ugetty.mk   | 23 +++++++++++++++++++++++
 6 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e9c8a5a0f..1ad64e876e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2711,6 +2711,7 @@ F:	package/rnnoise/
 F:	package/sedutil/
 F:	package/tpm2-totp/
 F:	package/triggerhappy/
+F:	package/ugetty/
 F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
diff --git a/package/Config.in b/package/Config.in
index fedff0e22d..71501cea53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2895,6 +2895,7 @@ menu "System tools"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
 	source "package/tpm2-totp/Config.in"
+	source "package/ugetty/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 	source "package/watchdog/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a33548c355..ebe169cdb9 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -72,6 +72,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_TAR),tar) \
 	$(if $(BR2_PACKAGE_TFTPD),tftpd) \
 	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
+	$(if $(BR2_PACKAGE_UGETTY),ugetty) \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
diff --git a/package/ugetty/Config.in b/package/ugetty/Config.in
new file mode 100644
index 0000000000..e00e9fb73a
--- /dev/null
+++ b/package/ugetty/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_UGETTY
+	bool "ugetty"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # std=c17
+	help
+	  A minimal getty for embedded Linux that auto-detects the
+	  client and dispatches incoming serial connections to a login
+	  prompt, a PPP session, or the local SSH server as
+	  appropriate.
+
+	  https://github.com/ryancdotorg/ugetty
diff --git a/package/ugetty/ugetty.hash b/package/ugetty/ugetty.hash
new file mode 100644
index 0000000000..b69c068a3f
--- /dev/null
+++ b/package/ugetty/ugetty.hash
@@ -0,0 +1,6 @@
+# Locally calculated
+sha256  302fe8a41eb8a752d08c82779f3c71b4b3060ddc48749a019135b0e649cde84c  ugetty-f1b7858778800b7256e9874f266c1d16ced22a6e.tar.gz
+sha256  26738bf10eec3fef6ee16c1dadc9279444552d9a86ff96122809af0529a8fec7  LICENSE
+sha256  a3290942cbf3fc43da5569318ccaa1e7fc601c30f81e32e51a55f5157a030ae3  LICENSE.0BSD
+sha256  15efcf4646d41aabd27e0cba3cb205e28acf5159b905c028ebed883f64fbefea  LICENSE.CC0
+sha256  0b230d23f22b80ffefcf65015f6e2308c2199dfaece79878b3ab13ad2577e685  LICENSE.MIT-0
diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
new file mode 100644
index 0000000000..0e306a02c2
--- /dev/null
+++ b/package/ugetty/ugetty.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# ugetty
+#
+################################################################################
+
+UGETTY_VERSION = f1b7858778800b7256e9874f266c1d16ced22a6e
+UGETTY_SITE = $(call github,ryancdotorg,ugetty,$(UGETTY_VERSION))
+UGETTY_LICENSE = BSD-0-Clause or MIT or CC0-1.0
+UGETTY_LICENSE_FILES = LICENSE LICENSE.0BSD LICENSE.CC0 LICENSE.MIT-0
+
+define UGETTY_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) bin/ugetty
+endef
+
+# Install ugetty->getty symlink to ensure ugetty is used
+define UGETTY_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/bin/ugetty \
+		$(TARGET_DIR)/sbin/ugetty
+	ln -snf ugetty $(TARGET_DIR)/sbin/getty
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
