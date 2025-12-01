Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9A6D116F3
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 14:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F3A403F7;
	Mon,  1 Dec 2025 14:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6_aDzaiqAz1; Mon,  1 Dec 2025 14:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A0AC4023E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0AC4023E;
	Mon,  1 Dec 2025 14:09:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4701BD
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA2DF60DDD
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m34Y1zGsfNOU for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 14:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C420B60DA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C420B60DA2
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C420B60DA2
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:08:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F3956C17B4F
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:08:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 25434606BB;
 Mon,  1 Dec 2025 14:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F5FF1191823C; Mon,  1 Dec 2025 15:08:56 +0100 (CET)
Date: Mon, 01 Dec 2025 15:08:53 +0100
MIME-Version: 1.0
Message-Id: <20251201-rasdaemon-v3-1-8ad394bdc372@bootlin.com>
References: <20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com>
In-Reply-To: <20251201-rasdaemon-v3-0-8ad394bdc372@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764598136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PkVqFtPtgftWJZoss9hxmYgcM58ACZODoPK8PzOrF7c=;
 b=GGCaQm8EX1WWQ/ldrdKlSPoR5UkLdLBQT0vcn3E87Z7jmrxMzUe4xq9GPHRQni2JzW5ftO
 YgD3HHXRX0tOby7+03IcQNxOhovdq+X3xo7wQfcMGypZHryfmaKNUKlfvfu/hnEJhZHmi4
 TcO3d3A/OeQxfRT/a8LAvtEDn6Yhr3SF5w7+Em+sb+vvovIgr45a2AJbSUA7dNUJmBOVxw
 /bX0zzfHRbc+Lq57SJDe2L77FOMEY71Xs+LHDO+d+HOIwmp7XQEDVYCyfy5dWi74sbO2HH
 kuBl8F5srEaBNIM+asvQtfZq8UAMJsXJ2ryqtHJDRgjTqZe6RAzAjkGjd2Z1Zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GGCaQm8E
Subject: [Buildroot] [PATCH v3 1/2] package/rasdaemon: Add rasdaemon package
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rasdaemon is a tool that aims to replace the edac-tool and provide a way
to collect all hardware error events reported by the Linux kernel in a
common framework.

Add a new package to support rasdaemon in the 'Hardware handling'
section. It depends on libtraceevents to detect the ftrace events
generated by the kernel and on sqlite to store these events.

Support for the PCIe AER events is optionnal and implies a dependency on
pciutils so also add a dedicated 'sub-option' to enable it.

Add a SYSV init script to start / stop the daemon

Add myself to the DEVELOPERS file.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 DEVELOPERS                       |  3 ++
 package/Config.in                |  1 +
 package/rasdaemon/Config.in      | 25 ++++++++++++++++
 package/rasdaemon/S95rasdaemon   | 63 ++++++++++++++++++++++++++++++++++++++++
 package/rasdaemon/rasdaemon.hash |  3 ++
 package/rasdaemon/rasdaemon.mk   | 33 +++++++++++++++++++++
 6 files changed, 128 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index db001d6bb0707a5877c0849fa85fa736377e60dd..b1ead6d26c4e8ff160bcc7ed85b0945ac5e551dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -341,6 +341,9 @@ F:	package/tcpdump/
 F:	package/ti-uim/
 F:	package/uhubctl/
 
+N:	Bastien Curutchet <bastien.curutchet@bootlin.com>
+F:	package/rasdaemon/
+
 N:	Baxiche Su <baxiche@gmail.com>
 F:	package/qt6/qt6multimedia/
 
diff --git a/package/Config.in b/package/Config.in
index 12f327cb273526781d931b834e24d0df5024e80e..1a93cec2fa22e3a6e70acbf799b32b00d5e8b5de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -584,6 +584,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/rasdaemon/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
diff --git a/package/rasdaemon/Config.in b/package/rasdaemon/Config.in
new file mode 100644
index 0000000000000000000000000000000000000000..68cef3a313bf2b82a8306ed5e0ec581cd618531d
--- /dev/null
+++ b/package/rasdaemon/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_RASDAEMON
+	bool "rasdaemon"
+	depends on !BR2_STATIC_LIBS # libtraceevent
+	select BR2_PACKAGE_LIBTRACEEVENT
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
+	help
+	  rasdaemon is a tool that collects all hardware error events
+	  reported by the Linux Kernel from several sources (EDAC, MCE
+	  PCI, ...) into one common framework.
+	  See https://github.com/mchehab/rasdaemon for details.
+
+if BR2_PACKAGE_RASDAEMON
+
+config BR2_PACKAGE_RASDAEMON_AER
+	bool "Enable AER support"
+	select BR2_PACKAGE_PCIUTILS
+	help
+	  Enable handling of AER (Advanced Error Reporting) events on
+	  PCIe
+
+endif
+
+comment "rasdaemon needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/rasdaemon/S95rasdaemon b/package/rasdaemon/S95rasdaemon
new file mode 100644
index 0000000000000000000000000000000000000000..390ff9c9029ba9122217f13eb88bac7715c1c05f
--- /dev/null
+++ b/package/rasdaemon/S95rasdaemon
@@ -0,0 +1,63 @@
+#!/bin/sh
+#
+# S95rasdaemon	Starts Rasdaemon.
+#
+# shellcheck disable=SC2317 # functions are called via variable
+
+DAEMON="rasdaemon"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf "Starting %s: " "$DAEMON"
+
+	if ! grep -q debugfs /proc/mounts ; then
+		echo "FAIL : debugfs is missing"
+		return 1
+	fi
+
+	start-stop-daemon --start --pidfile "$PIDFILE" --make-pidfile \
+		--background --exec "/usr/sbin/$DAEMON" -- -f
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
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON"
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
+reload() {
+	restart
+}
+
+case "$1" in
+	start|stop|reload|restart)
+		"$1"
+		;;
+	*)
+		echo "Usage: $0 {start|stop|reload|restart}"
+		exit 1
+esac
diff --git a/package/rasdaemon/rasdaemon.hash b/package/rasdaemon/rasdaemon.hash
new file mode 100644
index 0000000000000000000000000000000000000000..e1b600a4893bef2f58c86f6d742fb7cbcb480fc8
--- /dev/null
+++ b/package/rasdaemon/rasdaemon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7e12459f9477036491ac2b1e4c07cc3e8efea6dcd30525a263ab1f83910b773a  rasdaemon-0.8.4.tar.gz
+sha256  39bc367cd7cd291d217447632b28a74be414a52b142b1875ac8789184aeca7b2  COPYING
diff --git a/package/rasdaemon/rasdaemon.mk b/package/rasdaemon/rasdaemon.mk
new file mode 100644
index 0000000000000000000000000000000000000000..50ac97a37dcbe63443bddca505ebc7c929116e53
--- /dev/null
+++ b/package/rasdaemon/rasdaemon.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# rasdaemon
+#
+################################################################################
+
+RASDAEMON_VERSION = 0.8.4
+RASDAEMON_SITE = $(call github,mchehab,rasdaemon,v$(RASDAEMON_VERSION))
+RASDAEMON_LICENSE = GPL-2.0+
+RASDAEMON_LICENSE_FILES = COPYING
+RASDAEMON_AUTORECONF = YES
+
+RASDAEMON_DEPENDENCIES = libtraceevent sqlite
+# rasdaemon uses argp.h which is not provided by uclibc or musl by default.
+# Use the argp-standalone package to provide this.
+ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
+RASDAEMON_DEPENDENCIES += argp-standalone
+RASDAEMON_CONF_ENV += LIBS="-largp"
+endif
+
+ifeq ($(BR2_PACKAGE_RASDAEMON_AER),y)
+RASDAEMON_DEPENDENCIES += pciutils
+RASDAEMON_CONF_OPTS += --enable-aer
+else
+RASDAEMON_CONF_OPTS += --disable-aer
+endif
+
+define RASDAEMON_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/rasdaemon/S95rasdaemon \
+		$(TARGET_DIR)/etc/init.d/S95rasdaemon
+endef
+
+$(eval $(autotools-package))

-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
