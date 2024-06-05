Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C16C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 11:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D6AE41483;
	Wed,  5 Jun 2024 11:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IekLTAEqz3cl; Wed,  5 Jun 2024 11:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E206B414F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E206B414F8;
	Wed,  5 Jun 2024 11:14:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B98AB1BF5DD
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 11:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6806401B4
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 11:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XxhihpAuSH2 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 11:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 074DA401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 074DA401B1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074DA401B1
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 11:14:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.39]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1smXrO2l4M-00aMBF; Wed, 05
 Jun 2024 13:14:16 +0200
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 13:13:47 +0200
Message-ID: <20240605111347.1581931-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605111347.1581931-1-fiona.klute@gmx.de>
References: <20240605111347.1581931-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JaxoXUt9bE+iegv/JOPVo4WeSwv2ZOgqz/u70DPZ+0EKa5McLJt
 0eGe6Op+2QMSAMFs3vdYcs1BRbCrto4VUdrugrLBgGoFqzUYTAP9sDuEY6CH9AtuGMhEkFu
 Z4rpUkxZo0qBIwjL38dEyAH3cas494qAwu9SWLLUIIXSoF21+VpCIQUSrqpG+JCQYuj9tCO
 TIRBD6rNuvLjkfXQeMXmg==
UI-OutboundReport: notjunk:1;M01:P0:ULrDG+nvF5U=;xHgEyHFuryIMEXp8qVXSFmzgCPm
 0N/NiIrSKwJOMZxLx1idjNFKorHUTPksIM9toWClmbzQ6H4Z2/3schP8gG+wt404ph0LlyG5+
 yKOv167PK/ziz7brEn3BxevcJYozOqjyXxQEFEIHWLs/ytladYyxFmXXF2cvcEtEB2AJIyAEc
 cVprciLyZ9qfyRNfWs2T1ufR0uP7+zSfLMIUxDzhg1lLowv6gg/6gVVBZty+lf1UDcRsyQWrE
 HHTqEANi3HM6Dw+jrfo6RuxafgtNUTMLkcgiDaBTua8GdtjqA+z0TNXI3RoAW6lSJtCAVowGF
 y3qqse4drQuFD/Nj1j8Vo1cEiKlQNj+IM40JT/PpPo+xqNIj0VC3YsV60ZzOGHpMuFsgwmpF1
 6RufoNXpOhY3jqsy7js34EcQExg2/dbOSj5r6L/35p9QQfx/yHVWISuiMosF8Z0bCVFOSDqaY
 cXVkNJ1TOXhvQ9JMgN8aLIL9bQvxnfV9/TjaM2+MYF8EWJoCvSX3vBRsjf7ylnVena1JU/S9V
 Ul6ixazXikzARDFDQVLYvy7FLjVnde8EydaWdnUvaVK4/c34d53uzf5G7SMj7Zudfcy06ga5W
 LzbkcNs3di9rUG8hBQc3i6W2jfGNedJ/BXOsvgZso2KJC98t+FakqvmEdNnydmemnWgR6nkMM
 wwuhzqmnYB+aMH13yWs1tQTZ18+62INhymGQKZUpSg44vyqkcQVzJ632I6Z237Wybv6qNtwyR
 LagghPFlnKAEHb0EnZTlmgo/gP77ciXb7X/51sN9HhQA3t7QS0/Sff4KaM+GTlIlFS+blBaA7
 VdJNmsPLG8XiN6cwW9MV2Te2nE+5hoWjuHwyRvChynQ9g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717586056; x=1718190856; i=fiona.klute@gmx.de;
 bh=eRRuiynKAPczRd49e78p4d3XAk0XAkjO6f8HVNF3yT8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:cc:content-transfer-encoding:content-type:
 date:from:message-id:mime-version:reply-to:subject:to;
 b=nZ42pVE3Dmv76lY1lpffqXM0BTTokN5wTyqmqXmtTmRjW1IIBTEvI9tRZJEK4ThP
 ySEMBT0CmyXtN2UAbetb12PrATYAvlOxmTbPg5HjghAMQG6uB7zVtpH4U8vzcSp/H
 J3Yzl7e6My4UV2CfbaVJAd5W+O/dqsTwPBoTOewuWesa1tit6Sm7oXrlLmWUTf+gp
 lI3TwjMhHphHGwMr5sem+XZlz5RKj/tE8z2LBnYpfGb+ZFM5kSPlaOId74XlF/rqB
 GYl1m1yExfyEzGfPxyYSqQdjB0JPsA06NhaKxf+tiWYiiw+bIKQitOQ6ZBfNZ03Mb
 Pi3uYTsdDiWbiMnHeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nZ42pVE3
Subject: [Buildroot] [PATCH 2/2] package/busybox: Add ifplugd init script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>, "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The init script will be installed only if no other package provides
ifplugd (currently that could be package/ifplugd). Users can configure
the interface(s) which ifplugd should watch either using
/etc/default/ifplugd (for one interface) or using per-interface
symlinks to the script in /etc/init.d (for any number of
interfaces). The action script that ifplugd runs when a link change is
detected must be supplied separately.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
make check-package complains about "Incorrect PIDFILE value" in the
script. To support running multiple instances I need to support
multiple (per-interface) PID files. Is there a better way to handle
that, or explicitly silence the check?

 package/busybox/S41ifplugd | 84 ++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 13 ++++++
 2 files changed, 97 insertions(+)
 create mode 100644 package/busybox/S41ifplugd

diff --git a/package/busybox/S41ifplugd b/package/busybox/S41ifplugd
new file mode 100644
index 0000000000..4d3b56ab6d
--- /dev/null
+++ b/package/busybox/S41ifplugd
@@ -0,0 +1,84 @@
+#!/bin/sh
+
+DAEMON="ifplugd"
+
+# Each ifplugd instance handles only one interface, so this script is
+# designed to be symlinked per interface. For each interface create a
+# symlink with .IFACE appended to the name. E.g. to launch ifplugd for
+# eth1 create a symlink from /etc/init.d/S41ifplugd.eth1 to this
+# script. DEFAULT_IFACE sets the interface the non-symlink script will
+# use, set it to empty in /etc/default/ifplugd to disable the default
+# instance and use symlinked instances only.
+DEFAULT_IFACE="eth0"
+# If your action script is not in the default location
+# /etc/ifplugd/ifplugd.action, use the "-r" option to set the
+# location.
+IFPLUGD_ARGS="-M"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+NAME_IFACE="$(basename "$0" | cut -s -d. -f2)"
+if [ -n "$NAME_IFACE" ]; then
+	IFACE="${NAME_IFACE}"
+elif [ -n "$DEFAULT_IFACE" ]; then
+	IFACE="${DEFAULT_IFACE}"
+else
+	# no interface configured
+	exit 0
+fi
+
+PIDFILE="/var/run/${DAEMON}.${IFACE}.pid"
+IFPLUGD_ARGS="${IFPLUGD_ARGS} -i ${IFACE}"
+
+# BusyBox' ifplugd does not create a pidfile, so pass "-n" in the
+# command line and use "-m" to instruct start-stop-daemon to create
+# one.
+start() {
+	printf 'Starting %s for %s: ' "$DAEMON" "$IFACE"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- -n $IFPLUGD_ARGS
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
+	printf 'Stopping %s for %s: ' "$DAEMON" "$IFACE"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	# wait for process to be gone
+	while true; do
+		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
+		sleep 0.1
+	done
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
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
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a3ba12f8e2..22ce04f473 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -323,6 +323,17 @@ define BUSYBOX_INSTALL_CROND_SCRIPT
 endef
 endif

+# Only install our ifplugd script if no other package does it.
+ifeq ($(BR2_PACKAGE_IFPLUGD),)
+define BUSYBOX_INSTALL_IFPLUGD_SCRIPT
+	if grep -q CONFIG_IFPLUGD=y $(@D)/.config; \
+	then \
+		$(INSTALL) -m 0755 -D package/busybox/S41ifplugd \
+			$(TARGET_DIR)/etc/init.d/S41ifplugd; \
+	fi;
+endef
+endif
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
 	if test ! -e $(TARGET_DIR)/etc/inittab; then \
@@ -418,6 +429,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
@@ -431,6 +443,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
+	$(BUSYBOX_INSTALL_IFPLUGD_SCRIPT)
 	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef
--
2.45.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
