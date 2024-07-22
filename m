Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E53C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B4540187;
	Mon, 22 Jul 2024 12:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bH6rZ66CEWpQ; Mon, 22 Jul 2024 12:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADB0D40284
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADB0D40284;
	Mon, 22 Jul 2024 12:15:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1A61BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6564A40284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHCVrOmGfExi for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5089440187
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5089440187
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:15:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DD6386FDA; Mon, 22 Jul 2024 12:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:15:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d30c1e3c582545a770d40a63be5b7b477d6b1cba
X-Git-Newrev: 3c9a5cee94ee767272290e071bf8bd3e7b98fda8
X-Patchwork-Hint: ignore
Message-Id: <20240722121542.3DD6386FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: rebase init script on layout
 introduced by openssh
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c9a5cee94ee767272290e071bf8bd3e7b98fda8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase S95mpd on commit 1f743f4 (package/openssh: tidy up init script)

$ utils/check-package package/mpd/S95mpd
61 lines processed
0 warnings generated

(smoke test on live system)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore |  1 -
 package/mpd/S95mpd  | 64 ++++++++++++++++++++++++++++++++++++++---------------
 2 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 905d14178f..5d5919340c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -947,7 +947,6 @@ package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/mosquitto/S50mosquitto Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch lib_patch.Upstream
-package/mpd/S95mpd lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
 package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index a258930b3e..ac971e04a2 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -1,33 +1,61 @@
 #!/bin/sh
+#
+# S95mpd	Starts Music Player daemon.
+#
+# shellcheck disable=SC2317 # functions are called via variable
+
+DAEMON="mpd"
+PIDFILE="/var/run/$DAEMON.pid"
 
 # Sanity checks
-test -f /etc/mpd.conf || exit 0
+[ -f /etc/$DAEMON.conf ] || exit 0
 
 start() {
-	printf "Starting mpd: "
-	start-stop-daemon --start --quiet --background --exec /usr/bin/mpd \
-		&& echo "OK" || echo "FAIL"
+	printf "Starting %s: " "$DAEMON"
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 stop() {
-	printf "Stopping mpd: "
-	start-stop-daemon --stop --quiet --pidfile /var/run/mpd.pid \
-		&& echo "OK" || echo "FAIL"
+	printf "Stopping %s: " "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/bin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	# $DAEMON deletes its PID file on exit, wait for it to be gone
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
+	restart
 }
 
 case "$1" in
-	start)
-		start
-		;;
-	stop)
-		stop
-		;;
-	restart|reload)
-		stop
-		sleep 1
-		start
+	start|stop|reload|restart)
+		"$1"
 		;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|reload|restart}"
 		exit 1
 esac
+
+exit $?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
