Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A549C7EE43
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 11:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461654246F;
	Fri,  9 Jun 2023 11:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461654246F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id od2O9rD9gmuo; Fri,  9 Jun 2023 11:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DA71424A8;
	Fri,  9 Jun 2023 11:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA71424A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAD111BF37F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93B1A60BA9
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B1A60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOjOtbgxf1hJ for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 11:25:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27AF760AD0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27AF760AD0
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 11:25:30 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mgvj1-1pfxCS0VXZ-00hN6Q; Fri, 09
 Jun 2023 13:25:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 13:25:19 +0200
Message-Id: <20230609112522.97790-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609112522.97790-1-laurent@vivier.eu>
References: <20230609112522.97790-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2wzVBeRe0YNGiI/EWMuNv9UMdJaMFSRPnFt8wHltbqRwF46IgAn
 eaVPyMpq5NENaG5MNc/gYHqeurS3bnb+gR6DKaYeeFbzOqxRNLs/ui+r0n8QuSqXuwD07l2
 47/wrK2/aB9y0oNhQZ9Zjp5ZXqNAV1Y0zxgGqIPC1YZgQF9np2ZvdQK+lAWMbALoeV0uOPE
 7c7kr+YjRltw5tbnEwJqg==
UI-OutboundReport: notjunk:1;M01:P0:kNAwcmBWg+c=;291a4Z/ecgFJT0SE6iqnEQ9CaYg
 QkCC30EVpzf7QITTnXxDe1IkrfMcFPjFm/+P7l2AQcmLI3DJ2sG5Lg1Y1uizFVlUuRctsTR2U
 q+6Bczk9LBojfad0s2XNSCUnoBRn61KHz+5UxKaFTqsCwCozdRZXI7Zk+ZpcS34gi6h3SfMFN
 KqO35WpcHISRMgLUO+a77SVuKviduXP6QXgpH2LACE+6UZ/eEvwipTSejFxU3hFKdH7VPW1s5
 B0i0c2QvWFmmZ5ZhSu3AfGOekTKv0Egr83T9lF9o7IPHHNQDOvWlmgCgPU3xZ2uCMSEmOsb/x
 EqZ84Ej+Xkb4JeBsVw6jO5f8W1eFHA9dYlT9hXqS9o1Ud3/TcX2hPpv6qHkKZLtBB9Ty1yyI3
 vdulWXwI9znUh736C280l6dfE48Q0dlsGkl2XzkGzmOH3/vyIv3Ue2rrePgobFEmWcjdRabDA
 iaDCkySMu0Fk0PiNxi7Ln6FE6l9/kfYL4JjUsWxQB8c3buUuhoWjF936XQI6c66bOYddiznYT
 kCisp6u+etGfN+U2kQ4rIEaNodeGnzXvD0MQCqHp3PV+4mQMbqyYShgHgUE2Jy35ZqTA77zK4
 3xYGAilW31xhi9SwpNWWdh2jhLAMaYsohBnlbur8cy5EvMhr0Z6yFikcAdVxC5+5nQPrR3FXj
 y6YYNhmJwKyvvrUL7p5/W4M+T+b48T1bHxAXuxi8+Q==
Subject: [Buildroot] [PATCH v13 1/4] petitboot: add pb-discover daemon
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
