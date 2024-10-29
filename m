Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119E7D3A68D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 19:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF47606F6;
	Tue, 29 Oct 2024 19:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aENCuogwMrg3; Tue, 29 Oct 2024 19:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 955F160594
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 955F160594;
	Tue, 29 Oct 2024 19:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4B84EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 19:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C4D880D54
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 19:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysH3FmD_m7M5 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 19:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 399D680D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399D680D4D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 399D680D4D
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 19:04:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.191]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1t5aOx3ipF-005ZiA; Tue, 29
 Oct 2024 20:04:35 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Tue, 29 Oct 2024 20:04:19 +0100
Message-ID: <20241029190420.2381778-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:w00JOuDaU3E3MaLVySorvCsHOen0S/7gtTVKqzZd3VUfJ6PsV0U
 vYyXLX7JRmWw1T5kCMgVLKwPhn2lL49cAcsNG3AoNlFcT68QiSalKiv1knDrjlFmh5heI3i
 T5sojKXx61FZn3NaQFtSy5sRYc9Xqb84YAIUgJDtfZmbgTJ2+Y7+m9bMFd0Zn9S2tj+7djJ
 xfhjx+IGHeTjHJRnyB5mQ==
UI-OutboundReport: notjunk:1;M01:P0:Z8RVXlUwtlo=;IxYJZAs5Whp0REsVYcTYyK3VsTz
 XXLGtxO2H2qI1geObLahZHO48DDwdxcSa6thrviOU5Uc7ZXlAZf+vhGlMaogdO3rX3x0XhmSo
 MY0dBFE38WvGdnXKH0gfuPg143MhHaYO5MykOTDq/yVWAOAUk/AQpCK8SdY58Bu6idr3mHRL5
 XPN9NZHNJH9+3kIGSJz9Dc4tafgLtnHnSbygqOLpVf2C04U1oKYPda5kjc4usKacM6IYNfYIJ
 mmnNCWJ2tJNOILh86UBMdRuM0AQj5NpeirpG/5ZXfWDlf4aNK/EBhT58gq47TvvkSIdQVwoDz
 Vjq7S0bYAbUpqbt3Ak7nwp1ehTQHiLsVEkZ/jbWRJArF6q9M+D5RH1f3mX8zBPeO7bekqXDyT
 MU/RWoEpfniuTDKQZ/ORL1S46D2xLLLxLX4mF5gV2util68j4KSUn9PqaUyCqEbteEGcIW+Pv
 YCyGj4dHY++6P0z5wtYjNxFM81daN84fgjKo3fsV/Ij60NTlGIgavqSjyMFa3XOksoT6L3pCz
 jeNVsYwPtiXK3iyhYUuhXPxu8JqLModMJoTfbLXoBGoS6ZhGT0t8xsL4ovuJAgfqWb3/8YIsn
 WzA6T9PMJTdX3RmlYhNoOYsBdV7V80VQ4EfHTDOXP2m7Zgo0uxqDQ8QpGAOyApIN04HvNtY4j
 rwl77ooL43EABTQO4ov0blKqK8lDXKLh9GyZVsN4um9FQyabU21rjZDMCgHy2xKXbsRvoybXb
 D1L2+blk51tRovxuArD/hFDOANKI0CYQjkI36wNbQW1Cq8gp4bDcDlYa/jrlwNHvzi4gUxZn/
 pJ4+Wgpogu890F+2xeIW/gHg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730228675; x=1730833475; i=fiona.klute@gmx.de;
 bh=5VOfjreZiaAGJNhna1EgrQ2A2ax8offbImQmQ278a5w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PYtkCj2cJ1r8bslzfzSM0CiPRMpQVuRA6McmJRQAAYMQ5xtmje0OSBw+Ufd8mgOk
 Zea0+x7V2FqqyO7Jwc4PiBiU+rFIi/tuO+Rt809xwQOtd8okiA++PAiHSRObLacWp
 vN1L/pOoyjltBrNyxVSPj7IYsx1aMAjvFR0gYTVBSpN70ntvdCelisl2dnnktdtUg
 UC9aNUcXUUjxn9pFeZUcAjPhUbaE8R3CP9rsRbN/M4GPhAtMVFu/YyS6gIw7p5MBH
 Stxug2dt+6/R9aZbgyjLDGzj6DqRSRxLN+3ashhJIP+22rrzyWCFKCHoi6ptrnLDE
 LD+nBGH5tHRlNcFOOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PYtkCj2c
Subject: [Buildroot] [PATCH 1/2] package/chrony: rewrite start script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This patch brings package/chrony/S49chronyd in line with the start
script standards. Note that users will need to update the location of
any script config from /etc/default/chrony to /etc/default/chronyd.

One deviation from the standard remains (and thus the check-package
override): The PID file is placed in /var/run/chrony/$DAEMON.pid. This
is necessary because chronyd drops privileges, and would not be able
to delete the PID file from root-owned /var/run on shutdown.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I'm happy to drop the config rename if it's considered too disruptive,
but it's a simple rename, so I hope it's fine.

 .checkpackageignore       |  2 +-
 package/chrony/S49chrony  | 26 ----------------
 package/chrony/S49chronyd | 65 +++++++++++++++++++++++++++++++++++++++
 package/chrony/chrony.mk  |  2 +-
 4 files changed, 67 insertions(+), 28 deletions(-)
 delete mode 100644 package/chrony/S49chrony
 create mode 100644 package/chrony/S49chronyd

diff --git a/.checkpackageignore b/.checkpackageignore
index e9fc94b863..bf70e2c22c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -360,7 +360,7 @@ package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
 package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
-package/chrony/S49chrony Shellcheck lib_sysv.Indent lib_sysv.Variables
+package/chrony/S49chronyd lib_sysv.Variables
 package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
 package/cmocka/0001-Don-t-redefine-uintptr_t.patch lib_patch.Upstream
 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
diff --git a/package/chrony/S49chrony b/package/chrony/S49chrony
deleted file mode 100644
index f75233fe5e..0000000000
--- a/package/chrony/S49chrony
+++ /dev/null
@@ -1,26 +0,0 @@
-#!/bin/sh
-#
-# Start chrony
-
-[ -r /etc/default/chrony ] && . /etc/default/chrony
-
-case "$1" in
-  start)
-	printf "Starting chrony: "
-	chronyd $CHRONY_ARGS && echo "OK" || echo "FAIL"
-	;;
-  stop)
-	printf "Stopping chrony: "
-	killall chronyd && echo "OK" || echo "FAIL"
-	;;
-  restart|reload)
-	"$0" stop
-	sleep 1
-	"$0" start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/chrony/S49chronyd b/package/chrony/S49chronyd
new file mode 100644
index 0000000000..6c1525dd76
--- /dev/null
+++ b/package/chrony/S49chronyd
@@ -0,0 +1,65 @@
+#!/bin/sh
+#
+# Start chrony
+
+DAEMON="chronyd"
+# /var/run/chrony is owned by the chrony user, this allows chrony to
+# delete the PID file during shutdown, long after dropping privileges.
+PIDFILE="/var/run/chrony/$DAEMON.pid"
+CHRONY_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf "Starting %s: " "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- $CHRONY_ARGS
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
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
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
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 11270206bd..bcf69a59db 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -79,7 +79,7 @@ define CHRONY_INSTALL_TARGET_CMDS
 endef

 define CHRONY_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/chrony/S49chrony $(TARGET_DIR)/etc/init.d/S49chrony
+	$(INSTALL) -D -m 755 package/chrony/S49chronyd $(TARGET_DIR)/etc/init.d/S49chronyd
 endef

 define CHRONY_INSTALL_INIT_SYSTEMD
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
