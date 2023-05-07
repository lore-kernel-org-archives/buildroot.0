Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9178C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D5F5613E9;
	Sun,  7 May 2023 16:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5F5613E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yKW--Ksr--Cl; Sun,  7 May 2023 16:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9920060C33;
	Sun,  7 May 2023 16:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9920060C33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4971BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43EBA4016D
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43EBA4016D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijNGqHOcC8DD for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:53:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 240444177A
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 240444177A
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:53:47 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N95Rn-1qFa0e12vf-0164tH; Sun, 07
 May 2023 18:53:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 18:53:37 +0200
Message-Id: <20230507165340.42151-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507165340.42151-1-laurent@vivier.eu>
References: <20230507165340.42151-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KAfu/jmCkxqCptCwgcfUnSk1iAhlR6XE7wZ8I9teLcYrVtRV1Fo
 Ficl3zNHTdWWRxvcyKUcnI/142NuqT7JyEzR1y2WQvHULLnVehndAi32O5YuTHatnge2/o0
 fJaveKueWbiNWAfYMMTBhft72f5otP+EqdyyDUNCJo9CN0fcaJqn3nDIS3vebZ7egUbKzc5
 BwsZCF4vmW1kHLs7Ryi1Q==
UI-OutboundReport: notjunk:1;M01:P0:eNdkg0yDL9U=;X5xBHzwahDxsvvx0KT/4L8rAK7/
 EPBAxti8WsA4o65FjVh4CFxBETBa8vayLay94192CIi+Rp6mHNZF5sPCS3mlM9fuljZhKLWPQ
 7ZgrH1nLzQovOdLCa39IXzzmflfErvpw9QBXWAQYmrZw0OwfmEtV6r0Had7ypx2vPS/l40aGC
 0weoDZGIBNT6yzaF7aam83xSBn2lctlYYscHtPc1iz3nTuWb3S3mAbmoTszX/roEaBxDw/l6V
 Xz9SCqpt56JhRSwjufniwDxrz+uk/0/WmOn8BoOY5GJj4CYyGSHKvLjVjoILI3hxYWYF1YQyK
 OUBtUdgJzcLZ12aXyqmExqwm3O1eRkR1fyo/XM2F4EUjDuGIMcVDNGMpmcxdZYBR6EdnBaFql
 qY3VTHjAMRZZa25n/8PDtlWu796G/AZxlwzm6asvq4RK22KG8+lWGo2fmk9cKKRZ+47weEuQQ
 J0BT/fyQES5LB+39emWwvgRefGDqbLXeec863TzqBgsSLIMqDcQ8dDrzDZ4C39Wogho2JOEnh
 0zRgPYAYazXFawJgXyivk6wQltv0YXAp6FJMI9FRq9uXd4xbZ5Kin5uMUTn5l8PgIaTYZeblT
 d6p5M9tANGyeLOE9Gs6pbiDNr3I6IqQUi1xdTOYspj6cg2aVAqC5mjcxA9h1AMqzsG+zr3BuF
 lZfnzOObPpvdSDaD8rfqsuLspSjKd8CgXwiBFwaKug==
Subject: [Buildroot] [PATCH v12 2/5] petitboot: add pb-discover daemon
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
 package/petitboot/S15pb-discover | 54 ++++++++++++++++++++++++++++++++
 package/petitboot/petitboot.mk   |  4 +++
 2 files changed, 58 insertions(+)
 create mode 100644 package/petitboot/S15pb-discover

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
new file mode 100644
index 000000000000..83305ed9ea8a
--- /dev/null
+++ b/package/petitboot/S15pb-discover
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+DAEMON="pb-discover"
+PIDFILE="/var/run/$DAEMON.pid"
+LOGFILE="/var/log/$DAEMON.log"
+
+PB_DISCOVER_ARGS="-l $LOGFILE"
+
+if [ "$(pb-config debug)" = "enabled" ] ; then
+	PB_DISCOVER_ARGS="$PB_DISCOVER_ARGS --verbose"
+fi
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
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
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
