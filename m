Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF16C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 10:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17AF0610E3;
	Thu, 23 Nov 2023 10:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17AF0610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tftRti8JzEgh; Thu, 23 Nov 2023 10:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B5F161095;
	Thu, 23 Nov 2023 10:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B5F161095
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB3821BF48D
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 10:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D157D81F78
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 10:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D157D81F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iVFd7m2Zl5K for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 10:47:04 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 23 Nov 2023 10:47:04 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E64812E2
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15E64812E2
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 10:47:03 +0000 (UTC)
Received: from evilbit.green-communications.fr ([85.168.41.102]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MxmBi-1rFg1D0MQw-00zHu9; Thu, 23 Nov 2023 11:41:57 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 11:39:52 +0100
Message-ID: <20231123104124.28369-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:EjKfgh3lVII74Os/v7hpiyVz+y9Je0Qf0PwJbRxK58TecN9fiOU
 KRgz88RWmpM2JJGx7wNbqXe8k51o+IfiQlYCFr8YDwzo2N2uBJUv3hq/ir3NfMbVFjb2cXn
 AuFYCyHQ7UetjdSHGLXAhRzTHtXi13M8ae3SFhcMyfm4iar7WwYWMpGH/pkMGpzIa7s4HD3
 ox4pK9KREPVi9KlbPsFOw==
UI-OutboundReport: notjunk:1;M01:P0:fhQQDl3omFc=;vNd+FZiHQX46FqcJA8aJHLE1J5y
 cu7QFxvwljck1f6VE30gcPIcoRYtEpZGVvG6XJHdHJ0yHD0eHu5isDrKJosI1ILkdB1y37RcZ
 FP9zk4NBgh8YSIicsNta1J0R0Uw017UMq3SAYBX3paQocIr2c8uya0QXr7SFKtIUJGErWXBXU
 AKYQCjhbbIldfj9qZaVXUfHxQXZYK9Uhm6usEwC8g04qUMGz7teZCCuT6Q0ssb7oAIlKVl+jv
 Xzf4dxIyZyUkT9Kc44T09GdCeoagnFZ3rAkdihq1/pyguyoDFqzGchmmXMUpQVeJ4UtEeLVU5
 Fkl/mSLyVcbjg7xECj2//2c+MvT1Psnv4jV6dTkTh9utmlDoQE+gY9YWDRj0kA5hWx1cAU3rO
 ie8THlOlZnVD7cQZcqVXjyT/NO5IXFmRAxanjRxyJoPmAhXohe7F/BEhMsSliinmQiEwbxADz
 IMnjh4vrHGOKdRE5Z1pNouxdWl59pUhimgKnn8523Z4DLSzINEdjffbNpvef581s3i0QjzAci
 8ENCBDH1FmEJV1u+b8axESjS7rCS7Y17vjXICD/9kdq29eM+hKGi+NYipYWIqqBSjhLPi/goD
 SIIQaPZ+iP/jb6eNv6kIBUlatAKvsZ8hs2NA5acA1CXW/emRD92P1KGvn0TuVCpcIh4f5zPQz
 /SuUNq33Clzk5Cnyy3hovT2cwYMggm0ermRQC7AYqChoGxvWluC/BXwCzlz42akAwEHbz8yfw
 Q236sE11sqC8fc8HgVL3L3mBMloY6InqzgzHvElyubdoHesUtxy1CFVpJat6QgwxzAOhaSFYY
 07ou+5pv9kcu2rgVdGArgti4O0zwlx4o3Li8l5PxFezfe+ZMe+GCQo2E+GIkWDCtrX4ydHV3p
 SGLMTvPQGgtKQgA==
Subject: [Buildroot] [PATCH 1/1] package/openssh: refactor S50sshd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make it look more like the example S01syslogd shell script in
docs/manual/adding-packages-directory.txt.

Functionnally, it changes the following:
- Options can be defined in /etc/default/sshd
- "S50sshd stop" will no longer kill active SSH sessions or sshd daemons
  that run inside a container or chroot.  It is now safe to stop or
  restart openssh inside an SSH session.
- "S50sshd restart" now sleeps between stop and start, reducing the
  probability of failures caused by sshd taking too much time to stop.
- "S50sshd reload" will send a SIGHUP instead of restarting sshd.
- /var/lock/sshd is no longer created.  The daemon does not use it.
  The only reference to /var/lock is in contrib/redhat/sshd.init, which
  uses it as a way to test if sshd is (supposed to be) running.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/openssh/S50sshd | 75 +++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 26 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 22da41d1ca..c3f1cd2906 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -1,7 +1,12 @@
 #!/bin/sh
-#
-# sshd        Starts sshd.
-#
+
+DAEMON="sshd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SSHD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
@@ -12,36 +17,54 @@ start() {
 	# Create any missing keys
 	/usr/bin/ssh-keygen -A
 
-	printf "Starting sshd: "
-	/usr/sbin/sshd
-	touch /var/lock/sshd
-	echo "OK"
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $SSHD_ARGS
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
-	printf "Stopping sshd: "
-	killall sshd
-	rm -f /var/lock/sshd
-	echo "OK"
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
+
 restart() {
 	stop
+	sleep 1
 	start
 }
 
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
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
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-
-exit $?
-
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
