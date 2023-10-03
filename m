Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE4AE7543F
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 10:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4802681097;
	Tue,  3 Oct 2023 10:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4802681097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCZHwYVPK7pQ; Tue,  3 Oct 2023 10:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 292808224A;
	Tue,  3 Oct 2023 10:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 292808224A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85F371BF34D
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ED58403C4
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 10:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ED58403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1J8oWYyB9wk for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 10:01:38 +0000 (UTC)
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01E2940102
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 10:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E2940102
ARC-Seal: i=1; a=rsa-sha256; t=1696326389; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L9imVehxHhMNvUgqDtRSbcKMe0FFhdmQSnoYL9iEJNfrqsVxVKTZqAIj/VbkQNiEdh0Ibrj7oauqVZ5S/K3KsMZbGo2vVMWaUNcXijFPur7byBZH35B9pa66Fgn38RkzM4VTF5gRGU7GoY+UdmPHyghAOjtLqHifr0WR3Axec9Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696326389;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VPNXqt6HPf505Hqk4WGtdRbfJU0TxDRw/gGtQoPbPk0=; 
 b=DhxC1wxoqdw0+Q+JTQQR5qmP+wL7OBzEepASIRBTYLA0mbt4lKVQdjI0U6PJahOJbT/czKQEBn0krelj5DE6SL24/XektG0EjuwEDlFG4ZksilAAoY7Fe4Kgsfpdl91Zm7iqPmTRnIxnNk2ujbWhBZQEDnYAH2z5JM77gBi/HuI=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1696326388786576.1395111189111;
 Tue, 3 Oct 2023 02:46:28 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231003094612.62025-3-enki@fsck.pl>
Date: Tue,  3 Oct 2023 11:46:11 +0200
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003094612.62025-1-enki@fsck.pl>
References: <20231003094612.62025-1-enki@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696326389; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=VPNXqt6HPf505Hqk4WGtdRbfJU0TxDRw/gGtQoPbPk0=;
 b=rGEPLQv+7J/8NGbyvExTr/k5MOI5lhXX9VCDpdw7EUOs60xftgNnKecDpN1QmjV2
 qT00vCChre1U1+Q+jdM+WN+/fHfPP6AYlL7fIPeDo0Ehe+ekjY9SXP9O/b16Owp/ee+
 MSD5wT6nasITs5hUEMO8rIZnk3bRzaK5F39g/aQQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=rGEPLQv+
Subject: [Buildroot] [PATCH 2/3] package/dns320l-daemon: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maciej Grela <enki@fsck.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dns320l-daemon is a simple system management daemon for the D-Link DNS-320L
NAS. It handles power, Wake-on-LAN, temperature, fan speed and some LEDs.

Signed-off-by: Maciej Grela <enki@fsck.pl>
---
 package/Config.in                          |  1 +
 package/dns320l-daemon/Config.in           |  7 ++++
 package/dns320l-daemon/S50dns320l-daemon   | 37 ++++++++++++++++++++++
 package/dns320l-daemon/dns320l-daemon.hash |  1 +
 package/dns320l-daemon/dns320l-daemon.mk   | 31 ++++++++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 package/dns320l-daemon/Config.in
 create mode 100644 package/dns320l-daemon/S50dns320l-daemon
 create mode 100644 package/dns320l-daemon/dns320l-daemon.hash
 create mode 100644 package/dns320l-daemon/dns320l-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 228e9eb1e3..f1c451890f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2684,6 +2684,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
+	source "package/dns320l-daemon/Config.in"
 	source "package/docker-cli/Config.in"
 	source "package/docker-compose/Config.in"
 	source "package/docker-engine/Config.in"
diff --git a/package/dns320l-daemon/Config.in b/package/dns320l-daemon/Config.in
new file mode 100644
index 0000000000..c335e749f0
--- /dev/null
+++ b/package/dns320l-daemon/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DNS320L_DAEMON
+	bool "dns320l-daemon"
+	select BR2_PACKAGE_INIPARSER
+	help
+	  MCU Daemon for the D-Link DNS-320L
+
+	  https://www.aboehler.at/hg/dns320l-daemon
diff --git a/package/dns320l-daemon/S50dns320l-daemon b/package/dns320l-daemon/S50dns320l-daemon
new file mode 100644
index 0000000000..3e0b4a3339
--- /dev/null
+++ b/package/dns320l-daemon/S50dns320l-daemon
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+DAEMON="dns320l-daemon"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -x "/usr/bin/$DAEMON"
+	status="$?"
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
+	start-stop-daemon -K -x "/usr/bin/$DAEMON"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+		;;
+esac
diff --git a/package/dns320l-daemon/dns320l-daemon.hash b/package/dns320l-daemon/dns320l-daemon.hash
new file mode 100644
index 0000000000..4396eb8f5d
--- /dev/null
+++ b/package/dns320l-daemon/dns320l-daemon.hash
@@ -0,0 +1 @@
+sha256  eac74a64f0d4127748e629b8a5f723eab58ac83064a3f249f97b85bcd7faf061  tip.tar.bz2
diff --git a/package/dns320l-daemon/dns320l-daemon.mk b/package/dns320l-daemon/dns320l-daemon.mk
new file mode 100644
index 0000000000..fd87ac1be3
--- /dev/null
+++ b/package/dns320l-daemon/dns320l-daemon.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# dns320l-daemon
+#
+################################################################################
+
+DNS320L_DAEMON_VERSION = 1.0
+DNS320L_DAEMON_SOURCE = tip.tar.bz2
+DNS320L_DAEMON_SITE = https://www.aboehler.at/hg/dns320l-daemon/archive
+DNS320L_DAEMON_LICENSE = GPL-3
+DNS320L_DAEMON_DEPENDENCIES = iniparser
+
+define DNS320L_DAEMON_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+endef
+
+define DNS320L_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dns320l-daemon $(TARGET_DIR)/usr/bin/
+	$(INSTALL) -D -m 0600 $(@D)/dns320l-daemon.ini $(TARGET_DIR)/etc/
+endef
+
+define DNS320L_DAEMON_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/dns320l-daemon.service $(TARGET_DIR)/lib/systemd/system/
+endef
+
+define DNS320L_DAEMON_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/dns320l-daemon/S50dns320l-daemon $(TARGET_DIR)/etc/init.d/S50dns320l-daemon
+endef
+
+$(eval $(generic-package))
-- 
2.39.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
