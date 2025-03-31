Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D4EC3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 17:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A98F48196A;
	Mon, 31 Mar 2025 17:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1uGq1DyphV2; Mon, 31 Mar 2025 17:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A18DE8193E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A18DE8193E;
	Mon, 31 Mar 2025 17:12:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D68121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 17:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA46840712
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 17:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxamo-J_q-js for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 17:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 894EC40956
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 894EC40956
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 894EC40956
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 17:12:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.117.119]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEUz4-1tsCCM0gIs-00C1xx; Mon, 31
 Mar 2025 19:12:20 +0200
To: buildroot@buildroot.org
Date: Mon, 31 Mar 2025 19:12:12 +0200
Message-ID: <20250331171212.1059104-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ETEt9NhnSpZO8xIueXkEKzidfkxfDQPR5/7D6c7jnESiiczHEjp
 GqiOicPc0+mPqxK+MLMpJqzFHMB2GUwrK7K6BOjCvcF1rzfKfc2vEVlIPStDeYGt+1vZCuD
 iZgvMPxVorSfGUkfuglTy/DJpeKS3mhkpLSJ3cA4E8d59YMOSFZx6Yocf+4ikNqDhWYKA7F
 jLKXe7/HQixghg9Klpwww==
UI-OutboundReport: notjunk:1;M01:P0:mIIa5E3RscI=;RlGfCHlAOUol8LgLbYmJv7puv4M
 e/wRLGeE3zEFPoJ9zW9/QOWH+wgP3XgDKmwcWh1clfEdXukJOuZliZbbBoIngHA9txuGhKQRL
 g880H6ju+MIL5XUCMnKpueM7CBUr0taXVrucGsKbBFPay7t7Unv0+uGozLlsoBl/7gPhdB6Og
 yDG1E/05fOJbnpQbP2pdf8m7G+QmNU4+WLASE9Hoob0ju73q9vaz9EaF8ZZeli41lhtyUnswF
 BuF7bXOsEowehpcgYrTBg80Th22YBlj4IebW2mhonBEUxVL7Q6f09yEidhJ7/T62//oiEVGCe
 LC1ab1mrkp6xeWxLqQmyX3OsJ6k2HivzhuwVDBOxYGBNu5apqdf3AzDMJJhxVGKyD4gaSR/kA
 LxvByKPpy6Fkk0ELPx9PFBHTO7o3KVx3GPXPse4p4J/T9s4aa6+v2NLorl/VP/wRgOL6jbG+7
 77eWbY2grP67Lc9Dgs7PWB9YoraZXMfYz26eZoAiQoGySdxR9qlcpmeJWmCeWbAAM37jWnphR
 bCrcIOdui+TTq66gL4ivN8In+oDtROWtsBhtGRWLZGXc0rB+PtFBNKa+pgDYNCgEl3SeYcC0r
 Ypxw9fF22T8kYItBqEhN9XLB9jr2kXZ78k389gzJU6F/h939cLL+c8BiSvepCMEiHxhBcRhd2
 zHK/f9LuQcuDO7fK+253HJugnLl/OpBofkzTRbxhhfYZ5jEt0E8Dyr4D8EDWhBQoF/SNOW95V
 FdgTkTthx+SwLe4wYAWlpuIWz40Lod2DqJKfuizxkkrXHHfhVP/55mDQjtGXUuNttPVM223Hh
 bfS7acLIF+diCcJRzS8GMMvEUWAtvqb2603Xfmb5ivzgpwg4QNCcerncK60hvTVHz60iZeMYV
 PliYeuPF6wgw0mMW+ApMrGTLbFt19aPO+AfcHpntBNbulppDfAoGPETcgmmGkEeUPCee4uu2C
 ZW3ImXrdZ7GRG3LsyHSYMMt4OfCN62aL8Da4FkNnQtjBHrWCnIFelAz+uwpERYPuNz0QuAy3j
 fYjBFK/D/vtBU8i7nQXufr0QPfaM2f0W7nFaiqgHT5eqNXNevouM9vU1fMmzww5+QRvq5ImB1
 3mtOuS9sseToc91+3dMdIzega+/5bwM/woAnY+7p2QDBIGD0a3ku7O9lZ53vN94RcEXcrxtVo
 NF+2PEkmgv+cEC7QL3QQ0rExkqApXKkJK40kW4MceLr6TPHe/9Vh/K8bdNHDhyM11tkAI7Ka+
 07STR6S5N9J1Cm7bx+fKQGhn7pzONDJ7XWH8jYSZhJ8auopZTRsFSNRW+3N+FhbKOnfj6o8gD
 5ZSWJNffjxwt6XmVL2ad3hV27dldp//DkojOr6unOOrlrLqvZ69Fg4o8I1M/x5ggwAxEx7UhJ
 JsGfJTe8CIyCwVhLmurzMLucuPT/TmCO3Nnrlhg60QkFGDYnWc6ulgRaui4nMtD5MGME78Phg
 1QoAuMaG7EQmEPszH183+h82cJ8F/gNSWiFEj5BJLydwfrNTq
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1743441140; x=1744045940; i=fiona.klute@gmx.de;
 bh=rFCeAvTXtQpNaT59/bx/FWAwAyAmWoYYAa99AGaPLfI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Bqn8aliFb6k7YWHL+2ZimZSnz3O//zEq1/9fC/Gx0bIyMXTgf//aLjygCOdnxX1m
 CGbSBlxQaRcEp1XYS1E9LMDG2qboVh/va3LuTrpNUzpE6Q2TqOuucQAH14s2HShhy
 CvizqcwwAfEfT4IKk+ltUZXb4nL7nn0mh7m0kHjZdTJOL4oWEvpuGkEACZFt2jlk5
 v8dL9JVxkrVmCYqs6l2bZyWXGguMyY8IMr+bOZQpBZknsx8HyxJHy0FkHb7tLO9ty
 +EVv78vA0KneVYkz3OSIoCasJpRrKPFr8nrDTWw4GX8w/rfv6BOyldz2Tg3sBqU1g
 YEpgvtCJIgma4tDkrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Bqn8aliF
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: fix init script
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Restart would regularly fail because it did not wait for the old
process to be gone before starting the new one. Rewrite the script
according to current style to fix that, and add reload support (see
mosquitto docs for limitations of reload).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---

Policy question: Mosquitto supports configuring a PID file in the
configuration, but not on the command line. Using that would improve
the init script: We could let Mosquitto fork to background on its own,
instead of via start-stop-daemon. The default config would be easy to
adjust, but it would require people already using Mosquitto with
custom config files to adjust those to add the pid_file setting. Would
that be preferable for Buildroot? If yes, I can update the patch.

 .checkpackageignore            |  1 -
 package/mosquitto/S50mosquitto | 79 +++++++++++++++++++++++++---------
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5350c6633a..2f9c65c8a3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -823,7 +823,6 @@ package/mono-gtksharp3/0001-Fixes-MONO_PROFILE_ENTER_LEAVE-undeclared.patch lib_
 package/mono-gtksharp3/0002-Mono-compilation-error-branch.patch lib_patch.Upstream
 package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch lib_patch.Upstream
 package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
-package/mosquitto/S50mosquitto Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
diff --git a/package/mosquitto/S50mosquitto b/package/mosquitto/S50mosquitto
index 5241a071d7..89989179c1 100644
--- a/package/mosquitto/S50mosquitto
+++ b/package/mosquitto/S50mosquitto
@@ -1,35 +1,74 @@
 #!/bin/sh
 
+DAEMON="mosquitto"
+PIDFILE="/var/run/$DAEMON.pid"
+MOSQUITTO_CONF="/etc/mosquitto/mosquitto.conf"
+
+[ -f "$MOSQUITTO_CONF" ] || exit 0
+
 start() {
-	printf "Starting mosquitto: "
-	start-stop-daemon -S -q -m -b -p /var/run/mosquitto.pid \
-		--exec /usr/sbin/mosquitto \
-		-- -c /etc/mosquitto/mosquitto.conf
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Starting %s: " "$DAEMON"
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/usr/sbin/$DAEMON" \
+		-- -c "$MOSQUITTO_CONF"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
+
 stop() {
-	printf "Stopping mosquitto: "
-	start-stop-daemon -K -q -p /var/run/mosquitto.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
 }
+
 restart() {
 	stop
 	start
 }
 
+reload() {
+	printf "Reloading %s config: " "$DAEMON"
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
 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
+	start)
+		start;;
+	stop)
+		stop;;
+	restart)
+		restart;;
+	reload)
+		reload;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
 
 exit $?
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
