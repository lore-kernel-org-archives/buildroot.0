Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C70CCA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6177560802;
	Thu,  4 Sep 2025 16:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9b104tl4P6vj; Thu,  4 Sep 2025 16:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 783E8607C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783E8607C7;
	Thu,  4 Sep 2025 16:34:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D0CAAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FAD74009C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXjKrznxqoZp for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE942400A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE942400A0
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCD1A87E99; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:13:05 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: a5bf31c297cfdf7f8725028d16227fbde7e1f02f
X-Git-Newrev: 5d4d8ef5909ebd75a7ef5e006989285763ecdd49
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.DCD1A87E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/thttpd: remove
 package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d4d8ef5909ebd75a7ef5e006989285763ecdd49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Despite the last thttpd release 2.29 back in 2018, the package doesn't
build with modern compiler (gcc-15) and Autoconf (newer than 2.13) [1].

Remove TestThttpd from our testsuite.

[1] https://lore.kernel.org/buildroot/20250811203206.1506378-1-romain.naour@smile.fr/

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit c6b8ddab6e596d658a1ed8d516ad10f306f0232f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                             |  9 +++++
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/thttpd/Config.in                     |  9 -----
 package/thttpd/S90thttpd                     | 54 ----------------------------
 package/thttpd/thttpd.hash                   |  3 --
 package/thttpd/thttpd.mk                     | 46 ------------------------
 package/thttpd/thttpd.service                | 10 ------
 support/testing/tests/package/test_thttpd.py | 26 --------------
 9 files changed, 9 insertions(+), 150 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index dc3e4d2985..5c31c24fbd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.05.2"
+
+config BR2_PACKAGE_THTTPD
+	bool "thttpd has been removed"
+	select BR2_LEGACY
+	help
+	  thttpd is no longer maintained actively by upstream and has
+	  been removed from Buildroot.
+
 comment "Legacy options removed in 2025.05.1"
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
diff --git a/DEVELOPERS b/DEVELOPERS
index e3e0a13b4b..f848c93b57 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2006,7 +2006,6 @@ F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_tesseract_ocr.py
-F:	support/testing/tests/package/test_thttpd.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_tree.py
diff --git a/package/Config.in b/package/Config.in
index 32af8f05a1..0371d063e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2683,7 +2683,6 @@ endif
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
 	source "package/tftpd/Config.in"
-	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
 	source "package/tinyproxy/Config.in"
 	source "package/tinyssh/Config.in"
diff --git a/package/thttpd/Config.in b/package/thttpd/Config.in
deleted file mode 100644
index bd97bc7a75..0000000000
--- a/package/thttpd/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_THTTPD
-	bool "thttpd"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  thttpd is a simple, small, portable, fast, and secure HTTP
-	  server
-
-	  http://www.acme.com/software/thttpd/
diff --git a/package/thttpd/S90thttpd b/package/thttpd/S90thttpd
deleted file mode 100644
index 94b079b050..0000000000
--- a/package/thttpd/S90thttpd
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-
-DAEMON="thttpd"
-PIDFILE="/var/run/$DAEMON.pid"
-
-THTTPD_ARGS="-C /etc/thttpd.conf"
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
-		-- $THTTPD_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		# thttpd does not remove the pid file on exit
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/thttpd/thttpd.hash b/package/thttpd/thttpd.hash
deleted file mode 100644
index a29b9b2dcb..0000000000
--- a/package/thttpd/thttpd.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  99c09f47da326b1e7b5295c45549d2b65534dce27c44812cf7eef1441681a397  thttpd-2.29.tar.gz
-sha256  be059e6b8219d5bb5480fa6a2864bbb34892f56951d03d08b356bc1fa8c81a01  thttpd.c
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
deleted file mode 100644
index d9cb5c9071..0000000000
--- a/package/thttpd/thttpd.mk
+++ /dev/null
@@ -1,46 +0,0 @@
-################################################################################
-#
-# thttpd
-#
-################################################################################
-
-THTTPD_VERSION = 2.29
-THTTPD_SITE = https://acme.com/software/thttpd
-THTTPD_LICENSE = BSD-2-Clause
-THTTPD_LICENSE_FILES = thttpd.c
-THTTPD_CPE_ID_VENDOR = acme
-
-THTTPD_MAKE = $(MAKE1)
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-THTTPD_DEPENDENCIES += libxcrypt
-endif
-
-define THTTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/usr/sbin/thttpd
-	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
-	$(INSTALL) -D -m 0755 $(@D)/extras/makeweb $(TARGET_DIR)/usr/bin/makeweb
-	$(INSTALL) -D -m 0755 $(@D)/extras/syslogtocern $(TARGET_DIR)/usr/bin/syslogtocern
-	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/usr/sbin/thttpd_wrapper
-	$(SED) 's:/usr/local/sbin:/usr/sbin:g' -e \
-		's:/usr/local/www/thttpd_config:/etc/thttpd.conf:g' \
-		$(TARGET_DIR)/usr/sbin/thttpd_wrapper
-	$(INSTALL) -d $(TARGET_DIR)/var/www/data
-	$(INSTALL) -d $(TARGET_DIR)/var/www/logs
-	echo "dir=/var/www/data" > $(TARGET_DIR)/etc/thttpd.conf
-	echo 'cgipat=**.cgi' >> $(TARGET_DIR)/etc/thttpd.conf
-	echo "logfile=/var/www/logs/thttpd_log" >> $(TARGET_DIR)/etc/thttpd.conf
-	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/etc/thttpd.conf
-endef
-
-define THTTPD_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/thttpd/S90thttpd \
-		$(TARGET_DIR)/etc/init.d/S90thttpd
-endef
-
-define THTTPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/thttpd/thttpd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/thttpd.service
-endef
-
-$(eval $(autotools-package))
diff --git a/package/thttpd/thttpd.service b/package/thttpd/thttpd.service
deleted file mode 100644
index e3c93e7b3c..0000000000
--- a/package/thttpd/thttpd.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Tiny HTTP Daemon
-
-[Service]
-PIDFile=/run/thttpd.pid
-ExecStart=/usr/sbin/thttpd -D -C /etc/thttpd.conf
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
diff --git a/support/testing/tests/package/test_thttpd.py b/support/testing/tests/package/test_thttpd.py
deleted file mode 100644
index 007bc91f2d..0000000000
--- a/support/testing/tests/package/test_thttpd.py
+++ /dev/null
@@ -1,26 +0,0 @@
-import os
-
-import infra.basetest
-
-
-class TestThttpd(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-        """
-        BR2_PACKAGE_THTTPD=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", cpio_file])
-        self.emulator.login()
-
-        msg = "Hello Buildroot!"
-
-        self.assertRunOk("thttpd -V")
-        self.assertRunOk(f"echo '{msg}' > /var/www/data/index.html")
-        self.assertRunOk("wget http://localhost/index.html")
-        self.assertRunOk(f"grep -F '{msg}' index.html")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
