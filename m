Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E7DC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 11:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79892400DA;
	Wed,  5 Jun 2024 11:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmszTuwlh0F8; Wed,  5 Jun 2024 11:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A29540A98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A29540A98;
	Wed,  5 Jun 2024 11:14:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8B21BF5DD
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 11:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6575B401B4
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 11:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tD3LyTsCvLC5 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 11:14:18 +0000 (UTC)
X-Greylist: delayed 61947 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Jun 2024 11:14:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AF9E401A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF9E401A6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AF9E401A6
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 11:14:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.39]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOKc-1saKWR14qk-0144EX; Wed, 05
 Jun 2024 13:14:13 +0200
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 13:13:46 +0200
Message-ID: <20240605111347.1581931-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:U/E01KF7VLWQxgS0Z3XjCM3Qr/dh5Mko5iJUA3bWuJ7inY8f9yT
 ZRpv1zRVnKgUcJmAE0Sl2mWBIBh1MdqgnuLJ6qhwCBgn2VKXeKjqVJSHP9VghAsYxsMkWm0
 pID2SUJR0M0PNIWcDOP8ngeS9JGiprOAU6QcevRQj5IhK2CIw2zFVowMKtXMWrztd4K4fmY
 IgJqeVgjlU4PyIeU4ysxw==
UI-OutboundReport: notjunk:1;M01:P0:fe/qxpqIV3E=;GP1KfWNAN6wP2vlWtyRnpU/U7AB
 zMqCgWUS5wQr5bIn4Fc1P3b6FAIH8JuyZzEF2VJg9ePKWxpTcR+UvhmCrSsgl7dOcFhwYOUqn
 MdgkdD8tPqAO2v9bNC8WW5QMs8leT7XnwsUqkyoQAZlSZcW35nFeAvuKplSiDblp1wLCyqOGf
 PpGiRpK657cQt1E2K2nkmxCMpRwtT26B4Jkg8U5o37N4M7OyQG30bIW1+pUln1rOdSjjhDVNF
 2jt9dgWVQhaYgGSI/azJ/XA0npqlXSGKSSjJwtxngKkCTfH+EQMd/2/q98fqhVd3PSwWAXy87
 hstjOTqmlQ57GP+OhuINKnaQrkVuziZ0JHGgWcW3VUe1JEVgmaXtmVH5jOrKg6kriSTeiJd1j
 izgMpNzpZrr49RKBkHLWAkvU+e/iQH7SmzQPrcz4G+JEXynYbqA+ZjFs7u9RdtLboMOpMlXXi
 oW2wlwqx7+K9EOIfzl9SWViMlbgsybZ9JI61f5jLJhK+vEqkYAn0Gq/Sg+rKikO+XQ49cL2tr
 1GFKURNOxppFaqe4nNfp+HCbMOdtykmjbqRVHShStDHVvQOfnfgZLseoEJaTJXwDqhRwHaZI2
 naKfGi2Xhcc2bD647sqkpLZZHVyT5N8HZ3UWcoC3DQSR7DSg2qIbw4EbWGZ+GTiPgn5JXzQ0J
 qJzoNkvezcrReXD8uXGTQN0A4rCrHZJoxkRhbBgDamOjOdHuWNYAk5vNQAF4AeXjDdEVFXv7k
 2sTBgCq/SJmeyf0/6GNVjtobxMmo22RpgorVxIYD+NnqwnGaVlxL9d9J7LUmuaDfPh18DA/qC
 TDWGnODLbb6Wz9uBXnAwAG+9acXKGyKT2vai/gvZFsgMY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717586053; x=1718190853; i=fiona.klute@gmx.de;
 bh=ry6AElrwgUW/5KQMOZItKN4tXqckiF5WAEJYmzz8vdw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b4huylkSlG29fFO8cXnXqVyHqnWFyEj4xnCZQzW8V5HFyQeiQLcjuWceOTjKycBB
 JIB713Q82Hh7nFErNVzi+2yt8NpPmnARbhkATQE9mRyfIRY03O1oAaxOQnP6E3c5J
 qSh43gvQdtF8DIL3a30uWk0u7ahvmlsNo14ccF69Ob1yD6IdYuBGZIDExWeMkqcfm
 5bq+d/yFZpBXVkfHStA+fIJrfdzmj7KtSfiJkGRcduBKrYtEKM+IL7/MnkUW8TiXh
 N58AhYe1Jcv+f32qOrf9kLpFdDP8w2GJWO4dEG4AHN4YqIss4ctX27YuYOuu+pFVu
 KL5jOvt4831Iqb1Qjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=b4huylkS
Subject: [Buildroot] [PATCH 1/2] package/busybox: Add crond init script
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
cron (currently that could be package/dcron). Users will need to
select a suitable location for their crontabs, using either runtime
configuration in /etc/default/crond or Busybox build
configuration. Note that crond fails to start if the crontabs
directory doesn't exist.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 package/busybox/S50crond   | 65 ++++++++++++++++++++++++++++++++++++++
 package/busybox/busybox.mk | 13 ++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 package/busybox/S50crond

diff --git a/package/busybox/S50crond b/package/busybox/S50crond
new file mode 100644
index 0000000000..834c2787fa
--- /dev/null
+++ b/package/busybox/S50crond
@@ -0,0 +1,65 @@
+#!/bin/sh
+
+DAEMON="crond"
+PIDFILE="/var/run/$DAEMON.pid"
+
+# Note that the Busybox default location for crontabs
+# /var/spool/cron/crontabs is on a tmpfs in the default Buildroot
+# filesystem layout. If you want persistent crontabs, override that
+# either using either the "-c" runtime option of crond in CROND_ARGS,
+# or the CONFIG_FEATURE_CROND_DIR Busybox build configuration option.
+CROND_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# BusyBox' crond does not create a pidfile, so pass "-f" on the command line
+# and use "-m" to instruct start-stop-daemon to create one.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- -f $CROND_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	# wait for process to be gone
+	while true; do
+		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
+		sleep 0.1
+	done
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+		rm -f "$PIDFILE"
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
index eb5e7ad922..a3ba12f8e2 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -312,6 +312,17 @@ define BUSYBOX_INSTALL_SYSCTL_SCRIPT
 endef
 endif

+# Only install our crond script if no other package does it.
+ifeq ($(BR2_PACKAGE_DCRON),)
+define BUSYBOX_INSTALL_CROND_SCRIPT
+	if grep -q CONFIG_CROND=y $(@D)/.config; \
+	then \
+		$(INSTALL) -m 0755 -D package/busybox/S50crond \
+			$(TARGET_DIR)/etc/init.d/S50crond; \
+	fi;
+endef
+endif
+
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
 	if test ! -e $(TARGET_DIR)/etc/inittab; then \
@@ -407,6 +418,7 @@ define BUSYBOX_INSTALL_INIT_OPENRC
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef

@@ -419,6 +431,7 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 	$(BUSYBOX_INSTALL_SYSCTL_SCRIPT)
+	$(BUSYBOX_INSTALL_CROND_SCRIPT)
 	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
 endef

--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
