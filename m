Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED76E8FDD8
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 09:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48115406BE;
	Sat, 27 Dec 2025 09:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AV0fodwFIrLv; Sat, 27 Dec 2025 09:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F42A40694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766829107;
	bh=A4OPCGKH01gD6ft+rR0toXnAZA7z7LmHzyLBFMS/T2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ARAcK2KvFUufqDIN73O5hfeNN+AQ+gfPJqNoLrEvb60jE9yu44Tklrw+zuank9YGh
	 c18NySXlmJYSo6vVAuRwNXwLkZt11I0dGBIZbjd50cUlpdUu+rmS1zKm/sro/Dl6Bw
	 CVuYwD7Ax3/WjWAa3FdckBiTdEkPx2pZHiOw8vve0vHIEZwgqpQgaXID6hYuTHzsk/
	 Pq2XSZkCzoE/l/nSygguZjAmPSkkqHYZ4MDjO3ikaDavCKV2SDwALgEAcBFKibhZCB
	 J0hipzHJH/IG5l1Fd5y/MPNO8oGzXhGd9lanLnIC0jF8CtdXzE55hfPsGInU9fzDZN
	 clMTuiE/BSL3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F42A40694;
	Sat, 27 Dec 2025 09:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D63B119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 923C180C28
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmiNeDZZY-21 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 09:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9659D80C26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9659D80C26
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 09:51:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80C6C81F87; Sat, 27 Dec 2025 09:51:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 10:51:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bde2b2adafd94b9ac213ac2080615332118ad688
X-Git-Newrev: 8df8272281f2b4d2243db3562bb9cc2005f6a24d
X-Patchwork-Hint: ignore
Message-Id: <20251227095142.80C6C81F87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nqptp: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8df8272281f2b4d2243db3562bb9cc2005f6a24d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the Not Quite PTP timing library necessary for
AirPlay2 support with shairport-sync.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/nqptp/Config.in  | 13 +++++++++++
 package/nqptp/S90nqptp   | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/nqptp/nqptp.hash |  3 +++
 package/nqptp/nqptp.mk   | 24 ++++++++++++++++++++
 6 files changed, 102 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d83540b6bf..a9eb5d9231 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3317,6 +3317,9 @@ F:	package/kmemd/
 N:	Torben Voltmer <mail@t-voltmer.net>
 F:	package/espflash/
 
+N:	Trammell Hudson <hudson@trmm.net>
+F:	package/nqptp/
+
 N:	Tudor Holton <buildroot@tudorholton.com>
 F:	package/openjdk/
 
diff --git a/package/Config.in b/package/Config.in
index 22970b4d45..f33c116ec5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2593,6 +2593,7 @@ endif
 	source "package/nload/Config.in"
 	source "package/nmap/Config.in"
 	source "package/noip/Config.in"
+	source "package/nqptp/Config.in"
 	source "package/ntp/Config.in"
 	source "package/ntpsec/Config.in"
 	source "package/nuttcp/Config.in"
diff --git a/package/nqptp/Config.in b/package/nqptp/Config.in
new file mode 100644
index 0000000000..ec5d2ece2e
--- /dev/null
+++ b/package/nqptp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NQPTP
+	bool "nqptp"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  nqptp is a daemon that monitors timing data from PTP clocks
+	  it sees on ports 319 and 320. It maintains records for one
+	  clock, identified by its Clock ID.
+
+	  It is a companion application to Shairport Sync and provides
+	  timing information for AirPlay 2 operation.
+
+	  https://github.com/mikebrady/nqptp
diff --git a/package/nqptp/S90nqptp b/package/nqptp/S90nqptp
new file mode 100644
index 0000000000..0cd579a339
--- /dev/null
+++ b/package/nqptp/S90nqptp
@@ -0,0 +1,58 @@
+#!/bin/sh
+
+DAEMON="nqptp"
+PIDFILE="/var/run/$DAEMON.pid"
+
+NQPTP_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/bin/$DAEMON" \
+		-- $NQPTP_ARGS
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
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/nqptp/nqptp.hash b/package/nqptp/nqptp.hash
new file mode 100644
index 0000000000..a37f7149db
--- /dev/null
+++ b/package/nqptp/nqptp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1df1d5edd5b713010d6495b3abca4c1cf4ad8fa6029df0abeb9e4de8e0eb707a  nqptp-1.2.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/nqptp/nqptp.mk b/package/nqptp/nqptp.mk
new file mode 100644
index 0000000000..70e7e72d15
--- /dev/null
+++ b/package/nqptp/nqptp.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# nqptp
+#
+################################################################################
+
+NQPTP_VERSION = 1.2.4
+NQPTP_SITE = $(call github,mikebrady,nqptp,$(NQPTP_VERSION))
+NQPTP_LICENSE = GPL-2.0
+NQPTP_LICENSE_FILES = LICENSE
+NQPTP_DEPENDENCIES = libconfig host-pkgconf
+# git clone, no configure
+NQPTP_AUTORECONF = YES
+
+define NQPTP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/nqptp $(TARGET_DIR)/usr/bin/nqptp
+endef
+
+define NQPTP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/nqptp/S90nqptp \
+		$(TARGET_DIR)/etc/init.d/S90nqptp
+endef
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
