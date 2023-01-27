Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3926C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AC79417CD;
	Fri, 27 Jan 2023 12:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC79417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukUqBe5R2awq; Fri, 27 Jan 2023 12:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9901840452;
	Fri, 27 Jan 2023 12:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9901840452
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B86A81BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9352A408A5
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9352A408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpDRraYgSdPS for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:25:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84CAD40452
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 12:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84CAD40452
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DDFF87E6E; Fri, 27 Jan 2023 12:25:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 13:21:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c373ca0572e2017e04bd48a9ce63151fb23e378a
X-Git-Newrev: 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483
X-Patchwork-Hint: ignore
Message-Id: <20230127122526.6DDFF87E6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: add new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fluent Bit is a super fast, lightweight, and highly
scalable logging and metrics processor and forwarder.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Peter: add DEVELOPERS entry, drop STATIC_LIBS dependency]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                         |  3 ++
 package/Config.in                  |  1 +
 package/fluent-bit/Config.in       | 12 +++++++
 package/fluent-bit/S99fluent-bit   | 72 ++++++++++++++++++++++++++++++++++++++
 package/fluent-bit/fluent-bit.hash |  3 ++
 package/fluent-bit/fluent-bit.mk   | 49 ++++++++++++++++++++++++++
 6 files changed, 140 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b973c37b82..385a46ccf9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2820,6 +2820,9 @@ F:	support/testing/tests/package/test_perl_lwp_protocol_https.py
 F:	utils/size-stats-compare
 F:	toolchain/
 
+N:	Thomas Devoogdt <thomas@devoogdt.com>
+F:	package/fluent-bit/
+
 N:	Thomas Huth <huth@tuxfamily.org>
 F:	board/qemu/m68k-mcf5208/
 F:	configs/qemu_m68k_mcf5208_defconfig
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..b281a67157 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2610,6 +2610,7 @@ menu "System tools"
 	source "package/efivar/Config.in"
 	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
+	source "package/fluent-bit/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/gkrellm/Config.in"
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
new file mode 100644
index 0000000000..11ceb55d4f
--- /dev/null
+++ b/package/fluent-bit/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FLUENT_BIT
+	bool "fluent-bit"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBYAML
+	help
+	  Fast and Lightweight Logs and Metrics processor.
+
+	  https://github.com/fluent/fluent-bit
+
+comment "fluent-bit needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/fluent-bit/S99fluent-bit b/package/fluent-bit/S99fluent-bit
new file mode 100644
index 0000000000..f4ba0e4448
--- /dev/null
+++ b/package/fluent-bit/S99fluent-bit
@@ -0,0 +1,72 @@
+#!/bin/sh
+
+DAEMON="fluent-bit"
+PID_FILE="/var/run/$DAEMON.pid"
+CONF_FILE="/etc/$DAEMON/$DAEMON.conf"
+
+FLUENT_BIT_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PID_FILE" --exec "/usr/bin/$DAEMON" \
+		-- -c "$CONF_FILE" $FLUENT_BIT_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PID_FILE"
+	status=$?
+
+	if [ -f "$PID_FILE" ]; then
+		pid=$(cat "$PID_FILE")
+		rm -f "$PID_FILE"
+
+		# https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/yaml/configuration-file#config_section
+		# The default grace time is set to 5 seconds, so use 6 seconds to have some margin.
+		timeout=6
+		while kill -0 "$pid" 2>/dev/null; do
+			[ $timeout -eq 0 ] && status=1 && break
+			timeout=$((timeout - 1))
+			sleep 1
+		done
+	fi
+
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+start)
+	start
+	;;
+stop)
+	stop
+	;;
+restart | reload)
+	restart
+	;;
+*)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+	;;
+esac
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
new file mode 100644
index 0000000000..ce7cea7b59
--- /dev/null
+++ b/package/fluent-bit/fluent-bit.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8ff5566389033669feabc9c69a5c6f417dad5c8b066454388e6a706507262acf  fluent-bit-2.0.8.tar.gz
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
new file mode 100644
index 0000000000..f7727834dd
--- /dev/null
+++ b/package/fluent-bit/fluent-bit.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# fluent-bit
+#
+################################################################################
+
+FLUENT_BIT_VERSION = 2.0.8
+FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
+FLUENT_BIT_LICENSE = Apache-2.0
+FLUENT_BIT_LICENSE_FILES = LICENSE
+FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
+
+FLUENT_BIT_CONF_OPTS += \
+	-DFLB_DEBUG=No \
+	-DFLB_RELEASE=Yes \
+	-DFLB_EXAMPLES=No \
+	-DFLB_CHUNK_TRACE=No \
+	-DFLB_BACKTRACE=No
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=Yes
+FLUENT_BIT_DEPENDENCIES += luajit
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
+endif
+
+# Force bundled miniz to be linked statically.
+# https://github.com/fluent/fluent-bit/issues/6711
+FLUENT_BIT_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF
+
+# Move the config files from /usr/etc/ to /etc/.
+# https://github.com/fluent/fluent-bit/issues/6619
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information.
+FLUENT_BIT_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
+
+define FLUENT_BIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
+		$(TARGET_DIR)/etc/init.d/S99fluent-bit
+endef
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
