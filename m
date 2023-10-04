Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19D8E7B60F
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 13:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC77613F3;
	Wed,  4 Oct 2023 13:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AC77613F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ycu7xkz1NQXK; Wed,  4 Oct 2023 13:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4B6460B33;
	Wed,  4 Oct 2023 13:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4B6460B33
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A07931BF2BC
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A3EF820C7
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 13:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3EF820C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hF8q4HlqdpW5 for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 13:13:24 +0000 (UTC)
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7993482033
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 13:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7993482033
ARC-Seal: i=1; a=rsa-sha256; t=1696425198; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=me3HMprMWiHx4DbaujRtSfYAH5f7JtLn0PM7MPK2mrAMk7A1o5FoqbF6PjjUehdLNdUw6sd2TG2UpnPnn7u1iPF+IELaJ1PSktXTwdurb6KFT/3Kic3V6PFBsyXoODhX+STVErZ8gLYjgjneVPCGSrGt112QaXEvyAOoOyBTeoE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696425198;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zRychMzt2tdMiJqOVHIMcL1fAh96esM/jrB9LXcGUNY=; 
 b=AZxPQuwLhfmKoHIAwmmjZ7cITgCcl0DNdKlbgrznEFI1neSjZoLvR9kkGVe79sar8iZkFzDBQVhZSWnMVhQu5tgJGUX36Ap6UXKSb4qskc4ypStgRykiRwf6r8undA+vI7zDswk5QD3dl2fNbwryusGEHByZ6f/ouTlTW6oGr64=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1696425196241625.9192224905073;
 Wed, 4 Oct 2023 06:13:16 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231004131256.2113233-3-enki@fsck.pl>
Date: Wed,  4 Oct 2023 15:12:54 +0200
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003094612.62025-2-enki@fsck.pl>
References: <20231003094612.62025-2-enki@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696425198; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=zRychMzt2tdMiJqOVHIMcL1fAh96esM/jrB9LXcGUNY=;
 b=qNvBMQEdY2QcpYYrbGIzgOsLy9p9AMdfM8wzBR57EJJMb5qOiK+0vtwyJenc4KOk
 HFjwawDpNw2sJayqIJfM3Adde0Iq5OZqeMJm80YGRhHWvfKzsRii8pB3La4yzKYlSVa
 rySdaZ4XSDoDASSDwqC8T0DSTogZeCx987foOPlE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=qNvBMQEd
Subject: [Buildroot] [PATCH v2 2/3] package/dns320l-daemon: new package
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
 package/dns320l-daemon/Config.in           |  8 +++++
 package/dns320l-daemon/S50dns320l-daemon   | 37 ++++++++++++++++++++++
 package/dns320l-daemon/dns320l-daemon.hash |  1 +
 package/dns320l-daemon/dns320l-daemon.mk   | 31 ++++++++++++++++++
 5 files changed, 78 insertions(+)
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
index 0000000000..35bd30a9e5
--- /dev/null
+++ b/package/dns320l-daemon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DNS320L_DAEMON
+	bool "dns320l-daemon"
+	depends on BR2_USE_MMU # fork()
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
