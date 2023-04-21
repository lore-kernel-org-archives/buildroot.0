Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B1BC7618E
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 18:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB3CE70005;
	Fri, 21 Apr 2023 18:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB3CE70005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKrwg8Dj9SZJ; Fri, 21 Apr 2023 18:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B083E70002;
	Fri, 21 Apr 2023 18:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B083E70002
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 516A41BF2C2
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 290E86FFA4
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 290E86FFA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82FkkLIygPiO for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 18:50:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 120FD6FFED
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 120FD6FFED
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 18:50:11 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MDeAZ-1pzasi02PH-00Ar4g; Fri, 21
 Apr 2023 20:50:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 20:50:00 +0200
Message-Id: <20230421185003.1221000-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421185003.1221000-1-laurent@vivier.eu>
References: <20230421185003.1221000-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Uovlm3uUFkBCZ5eW+/DeIh7Qrp2cqlEFbcNn7z2vXebhoE/iar/
 fD8OC1sVqIbEUjvFnewJKtHKX9fFtkxt/PMOn9wEL3KCmUWId7vFudnBY5vLPrqJcGFPuz+
 WfE8Ie21BPeHeVdqb77pwpVsWCLq0ehBFZeOdZXaJhf2BtfenaWsabh61Lspv68sS7TVX8V
 AL33WvJ8w39zdy9DBvHvA==
UI-OutboundReport: notjunk:1;M01:P0:juhAF5kS02o=;kYEtCFXPSeg2VNdvqzm6Fdbf1BN
 cfy/5eL0K7CFXa4Y+zeBGOl5g4SO/FsB9q3Eo2HNXIjSRyZGr8qMeR5epvnr+LW+PPp+JQxxL
 +HSXnGhAicciC+4YKLXKmR6wHXFaY+e7nojhfCnhVhIdaEadv/BNY020h3pTRu4lCur3GbZlU
 HOoNXgm/NpHcUmd4zyOdpkY8dIyDffMQLH2+3bwAV+0nJc7Bgv2PC++idMuUH1HOoDmD/pl73
 GLO5fFltF+JCNWh83asuH1YSZVike3BR4QSI6eVbbiyyGoJpThv7bCDooROJ0MT2fnrs206y1
 0Wz70lAi1q4ebv3BA5HwlEcy9fN7FFFqBTd10z7rIw52ViIBdJel01f4eZ8F3hXOtODRHtl0J
 vBxaj+LRByWrRqqNFdEf1NwdEXZ5bgXt3PQ0O2VVDTlnEty9P+9/S/wBMtA0kr7mDGzadk/hc
 HLLk/iw8YPWcnV9EBEunbSYkctOkudJ8G7u3Z1sJe5l1LqZpcon5iXnbIof4TRhCO3MGgrefQ
 Sc2lSL4CmjlfQdB4H8dkR70nTZw011/UV3ELOWJzq2aVCoj9O1gm+zz9OEKEsoVBYnTJJleen
 3uQNcB3UgmmKhtseoBvWDV+d9mAZoJTVFcUPWCWpLsaBV3oKQgfF5IxkVU9XlyUAN3QhCQwEH
 jh2vGfbFXpJfoBPx2KJKoH2T9wWAJ4v1m5NV0j7o3Q==
Subject: [Buildroot] [PATCH v11 2/5] petitboot: add pb-discover daemon
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 package/petitboot/S15pb-discover | 53 ++++++++++++++++++++++++++++++++
 package/petitboot/petitboot.mk   |  4 +++
 2 files changed, 57 insertions(+)
 create mode 100644 package/petitboot/S15pb-discover

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
new file mode 100644
index 000000000000..56a22f6bdc83
--- /dev/null
+++ b/package/petitboot/S15pb-discover
@@ -0,0 +1,53 @@
+#!/bin/sh
+
+DAEMON="pb-discover"
+PIDFILE="/var/run/$DAEMON.pid"
+LOGFILE="/var/log/$DAEMON.log"
+
+PB_DISCOVER_ARGS="-l $LOGFILE"
+
+if [ "$pb-config debug)" = "enabled" ] ; then
+	PB_DISCOVER_ARGS="$PB_DISCOVER_ARGS --verbose"
+fi
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -q -b -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $PB_DISCOVER_ARGS
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
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
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
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+		;;
+esac
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index a798e7ca614f..4d56b73938e7 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -53,6 +53,10 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
+	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
+		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	ln -sf /usr/sbin/pb-udhcpc \
+		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 endef
 
 PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
