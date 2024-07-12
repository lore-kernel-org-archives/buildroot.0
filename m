Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58934C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A724187C;
	Fri, 12 Jul 2024 09:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwFpUdt-EasT; Fri, 12 Jul 2024 09:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F25F41957
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F25F41957;
	Fri, 12 Jul 2024 09:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF041BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F09EF4187B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9D2BGMi4UpU for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:48:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 641B3417FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 641B3417FC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 641B3417FC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:48:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatVb-1rvsrn2ivT-00lpXX; Fri, 12
 Jul 2024 11:47:56 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:47:17 +0200
Message-ID: <20240712094717.2539892-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712094717.2539892-1-fiona.klute@gmx.de>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:pKVZQ7/adED0kRBuqR992540eFDSEhR07y9LcoWEmDILiBBuC3W
 nA2X7gSg+OwzZt3VKDBC+C9psXGElNASAgi9qZXbqT6xTBrDS7YFaSHyzxa4iGXKsImIunr
 tWknckJ6t+Dst03934MYZjI1zyxEeWtDFqCrSFEv5cQo2rGgUVEXWSR9Wi+vgWuvsuqWDUs
 0Skj2UJXV+A2auWZd/FgQ==
UI-OutboundReport: notjunk:1;M01:P0:p/XZZNgQifU=;sAXmaAUCns2yw4CmOrDpaahAFp8
 Zs5ZjxHf0qZQ7W8egMwG2kz025IZ+Fnytfe5H7qg5sHt0Stuga2XGJ4+FVvZMSlhb9SV4Paiy
 k6ydjiielK8e1ttkEeyagJpBxpmT061PP48U81gSGMJN03tU+lD/61Hh8rdc68rvs9F8lCX2L
 IuLFK81kDK2I9b1Nq7yyxDyPR/PsBycdv6KgPoddaFOFhEdMJ/Cz3Ea7OwOBjXUv4SWBkoIdw
 r+QTx/n6YY9E7ObFl0JAt5YCI9NNZ4RWfS2aepqa46POfqisTf9aisqBrhuBH2F9pbny64EeG
 l2PBhTGmdzr7rgHXG5R1RYvN6kFSazAnzIVsUNotZArzOayprbEY0O6Suz2Ex2BNEXoAuPMP0
 zDLnnpsKRdnhvBn9huBGBGEgaDYV4PDtSVQfq3LwIoPXyEYHBV4yk0Ftf58YHMAGa1PxUMA2O
 x9NF+aZ8wE+tWL6nf16P+K8hniyNFhiGah71unQKd7N7PH0zSlBCDeouGr5oZEvaM2eN2Vzp/
 eX91YdviGspX07Jo1Xi1xLDMpjcqzpYRBKqX2u938VG05iehBArYnTJMSUl/lyVbyVUUjR4il
 S0oF6/uSHyUK9Wq9CaWVsRqLm7givtagMAtiNA2GDKakpdyKfsest8x+8iESLW+0LZ2AmjX7d
 BQTC0GI7IBM468mF/+PBSV2oUjCGech4YFK64c5Vxcxws83drKyaF4tBuO58FUyTRu1tOk28U
 LzOiS8qT63WdqF2jDgzqwmshGA3hgK3BHr9mn4HdZCYG0PAe5s1xwO1N4xx1YL3IVd9MKe6iM
 7jCNKgR+rPXPnlK6yQV6qIHw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777676; x=1721382476; i=fiona.klute@gmx.de;
 bh=w3B+RI+7pxmCXCdzZ3KxF2J0N0iRpPuj/eCuDaar2eQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nF9/zbI6lYfq0MHdnL8sM1qSTKjrS29MpLuTyRCCBPL3zydVkdJVNSOQKhPbJcSH
 Ii8sskqx+zd00uBs+McsXjP2XOt0IhU0StOYmsTORLityXN9JZ/Mf8eduKi/eIixl
 RfsQ793K6Vf+Q5o/ZWWN1vQyx0IaETeR8L5Hyza61ZPo3W6nZlDM5q8FerxyUdboV
 LlT0ztCpMn1BD9XMNQXq7d4eo797TRn9IBygfkURUNntayyKW/65IYiPv8hgB/G0V
 AoL4hxW6p+LS3QKG9IXXuC2J8MDhUQ8cqw/EDdXhytzkpihsqsWLPmnlqFfNHF/zo
 L82I41OJI4yNA0HS1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nF9/zbI6
Subject: [Buildroot] [PATCH 6/6] package/network-manager: rewrite init script
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This brings the NetworkManager init script in line with the standard
Buildroot init script pattern, including the script name.

Reload using SIGHUP is also supported now, note that the
NetworkManager documentation cautions that not all parameters can be
changed at runtime (without a full restart).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore                        |  1 -
 package/network-manager/S45NetworkManager  | 68 ++++++++++++++++++++++
 package/network-manager/S45network-manager | 41 -------------
 package/network-manager/network-manager.mk |  2 +-
 4 files changed, 69 insertions(+), 43 deletions(-)
 create mode 100644 package/network-manager/S45NetworkManager
 delete mode 100644 package/network-manager/S45network-manager

diff --git a/.checkpackageignore b/.checkpackageignore
index 7cb4b98bfc..d39b5bdebd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1020,7 +1020,6 @@ package/netsurf/0002-do-not-cross-compile-nsgenbind.patch lib_patch.Upstream
 package/netsurf/0003-fix-compilation-without-curl.patch lib_patch.Upstream
 package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch lib_patch.Upstream
 package/nettle/0001-disable-testsuite-examples.patch lib_patch.Upstream
-package/network-manager/S45network-manager Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLastLine lib_sysv.Variables
 package/nfs-utils/S60nfs Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Variables
 package/nginx-modsecurity/0001-config-use-pkg-config.patch lib_patch.Upstream
 package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch lib_patch.Upstream
diff --git a/package/network-manager/S45NetworkManager b/package/network-manager/S45NetworkManager
new file mode 100644
index 0000000000..9f3398a347
--- /dev/null
+++ b/package/network-manager/S45NetworkManager
@@ -0,0 +1,68 @@
+#!/bin/sh
+
+DAEMON="NetworkManager"
+PIDFILE="/var/run/$DAEMON.pid"
+
+# shellcheck source=/dev/null
+test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	[ ! -d "/var/run/$DAEMON" ] && install -d "/var/run/$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- --pid-file="$PIDFILE" $NETWORKMANAGER_ARGS
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
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	# NetworkManager deletes its PID file on exit, wait for it to
+	# be gone
+	while [ -f "$PIDFILE" ]; do
+		sleep 0.1
+	done
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+	printf 'Reloading %s config: ' "$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
deleted file mode 100644
index bc775d3b20..0000000000
--- a/package/network-manager/S45network-manager
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-
-# Allow a few customizations from a config file
-test -r /etc/default/NetworkManager && . /etc/default/NetworkManager
-
-PID=`pidof NetworkManager`
-case "$1" in
-	start)
-		printf "Starting NetworkManager ... "
-		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
-		if [ -z "$PID" ]; then
-			/usr/sbin/NetworkManager $NETWORKMANAGER_ARGS
-		fi
-		if [ ! -z "$PID" -o $? -gt 0 ]; then
-			echo "failed!"
-		else
-			echo "done."
-		fi
-		;;
-	stop)
-		printf "Stopping NetworkManager ... "
-			[ ! -z "$PID" ] && kill $PID > /dev/null 2>&1
-		if [ $? -gt 0 ]; then
-			echo "failed!"
-		else
-			echo "done."
-		fi
-		;;
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
-	*)
-		echo "usage: $0 {start|stop|restart|sleep|wake}"
-		;;
-esac
-exit 0
-
-
-
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index cbd2ba8839..3937982c5f 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -163,7 +163,7 @@ NETWORK_MANAGER_CONF_OPTS += -Dnmcli=false
 endif

 define NETWORK_MANAGER_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
+	$(INSTALL) -m 0755 -D package/network-manager/S45NetworkManager $(TARGET_DIR)/etc/init.d/S45NetworkManager
 endef

 define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
