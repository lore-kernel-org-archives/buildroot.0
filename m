Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355CBE81DFF
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE3EF81F1B;
	Fri,  6 Oct 2023 14:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE3EF81F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDB4lpjW50GM; Fri,  6 Oct 2023 14:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC5F81B3E;
	Fri,  6 Oct 2023 14:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC5F81B3E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D21D41BF34F
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 14:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B784C417BA
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 14:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B784C417BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66k2E5ITWyAs for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 14:05:43 +0000 (UTC)
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7214A4179E
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 14:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7214A4179E
ARC-Seal: i=1; a=rsa-sha256; t=1696601136; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FKiempa+e/HVSYshYbFzBNEpob7CRf6WBdmT8xuGkXmf+66jpV8ykkTjAAoee91Cz/tpcBLCcnLccyKZIukZPiG4JPPdq93Jw22ltr/je4gr5lwGgAOND/FHrLlxgYs0HE4e0CXZYC819yztJskKfC301+c7jtaV5Wqqx4EtTZQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1696601136;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Z0nnypir2xsLwYV4oqT2MTdtol/U1FtVRxHOUyFiPzQ=; 
 b=nb0IgmeonpSiyWuS2dcDrOTeJKrHNYGgiNNfLz9wxRAAXCpW7X7cnPBJ3UYrr6bObIAwiZUytfDLXmVTB2mlpdb7rlwniY6zgSxalGKo+yHwhxVAvfB/J9XXojfPBG76EteHd/i9LSUCbTt1pCXf4C6qFfT/gw0z/eQzXoNHgEQ=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1696601135548891.2762185242651;
 Fri, 6 Oct 2023 07:05:35 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Message-ID: <20231006140511.3840643-3-enki@fsck.pl>
Date: Fri,  6 Oct 2023 16:05:10 +0200
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004131256.2113233-2-enki@fsck.pl>
References: <20231004131256.2113233-2-enki@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1696601136; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Z0nnypir2xsLwYV4oqT2MTdtol/U1FtVRxHOUyFiPzQ=;
 b=nKSx0U7MH1OY/9aO3uIXea3ti9veMAhB5BwdN4FT4a3fYadVOoX8m3jOv9tK+7x3
 JTo2u3K06mvsa8kHmMO2//kMsYn3Vd0dqmCSBz5AEGJ51xUF9xbLADyi71kYOWHY8GY
 G2K/3imAyaPmKMEF0usgJJjbPXFnWKIbQ8PX4vtA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=nKSx0U7M
Subject: [Buildroot] [PATCH v3 2/3] package/dns320l-daemon: new package
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
 package/Config.in                             |  1 +
 .../0001-listen-on-localhost.patch            | 21 ++++++++++
 package/dns320l-daemon/Config.in              |  8 ++++
 package/dns320l-daemon/S50dns320l-daemon      | 42 +++++++++++++++++++
 package/dns320l-daemon/dns320l-daemon.hash    |  1 +
 package/dns320l-daemon/dns320l-daemon.mk      | 32 ++++++++++++++
 6 files changed, 105 insertions(+)
 create mode 100644 package/dns320l-daemon/0001-listen-on-localhost.patch
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
diff --git a/package/dns320l-daemon/0001-listen-on-localhost.patch b/package/dns320l-daemon/0001-listen-on-localhost.patch
new file mode 100644
index 0000000000..50da024024
--- /dev/null
+++ b/package/dns320l-daemon/0001-listen-on-localhost.patch
@@ -0,0 +1,21 @@
+# HG changeset patch
+# User Maciej Grela <enki@fsck.pl>
+# Date 1696540279 -7200
+#      Thu Oct 05 23:11:19 2023 +0200
+# Node ID eca5ed65582402e64c36145290c214aee84b012b
+# Parent  1f945ce22321a876143b38aaf5610c8915172b90
+Subject: [PATCH] Listen on localhost by default
+Signed-off-by: Maciej Grela <enki@fsck.pl>
+
+diff -r 1f945ce22321 -r eca5ed655824 dns320l-daemon.ini
+--- a/dns320l-daemon.ini        Tue Dec 09 12:24:29 2014 +0100
++++ b/dns320l-daemon.ini        Thu Oct 05 23:11:19 2023 +0200
+@@ -4,7 +4,7 @@
+ 
+ [Daemon]
+ ServerPort = 57367
+-ServerAddr = 0.0.0.0
++ServerAddr = 127.0.0.1
+ SyncTimeOnStartup = 0
+ SyncTimeOnShutdown = 0
+ DeviceShutdownDelay = 30
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
index 0000000000..3bc2a60d0b
--- /dev/null
+++ b/package/dns320l-daemon/S50dns320l-daemon
@@ -0,0 +1,42 @@
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
+	start-stop-daemon -s INT -K -x "/usr/bin/$DAEMON"
+}
+
+poweroff() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -s TERM -K -x "/usr/bin/$DAEMON"
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
+		echo "Usage: $0 {start|stop|restart|poweroff}"
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
index 0000000000..bc24a553c2
--- /dev/null
+++ b/package/dns320l-daemon/dns320l-daemon.mk
@@ -0,0 +1,32 @@
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
+DNS320l_DAEMON_PATCH = 0001-listen-on-localhost.patch
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
