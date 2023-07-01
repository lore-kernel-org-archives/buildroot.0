Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB0EEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C55940465;
	Sat,  1 Jul 2023 20:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C55940465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ebcb_CPHS4jC; Sat,  1 Jul 2023 20:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8475F402F7;
	Sat,  1 Jul 2023 20:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8475F402F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4AD1BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7FB060AF8
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7FB060AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DTZOn4s85-7c for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:42:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16ED760AE9
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16ED760AE9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03FA186309; Sat,  1 Jul 2023 20:42:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 22:41:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b9877a4b93c5f849c293b1c220490be5ed241ec
X-Git-Newrev: 0c4c7da2f33cd701f614709e85a097a8751d81a4
X-Patchwork-Hint: ignore
Message-Id: <20230701204244.03FA186309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: improve init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c4c7da2f33cd701f614709e85a097a8751d81a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use pidfile for more accurate process match
- Fix coding style issues to be able to drop a problem reported by
  check-package on missing variables

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore        | 2 +-
 package/dnsmasq/S80dnsmasq | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 847f823ed0..278b150cb6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -359,7 +359,7 @@ package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch Upstream
 package/dmraid/0001-fix-compilation-under-musl.patch Upstream
 package/dmraid/S20dmraid Variables
-package/dnsmasq/S80dnsmasq Shellcheck Variables
+package/dnsmasq/S80dnsmasq Shellcheck
 package/docker-engine/S60dockerd Indent Shellcheck Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch Upstream
 package/domoticz/S99domoticz Shellcheck
diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index b052259e87..175daf9d26 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -1,16 +1,20 @@
 #!/bin/sh
 
+DAEMON="dnsmasq"
+PIDFILE="/var/run/$DAEMON.pid"
+
 [ -f /etc/dnsmasq.conf ] || exit 0
 
 case "$1" in
 	start)
 		printf "Starting dnsmasq: "
-		start-stop-daemon -S -x /usr/sbin/dnsmasq
+		start-stop-daemon -S -p "$PIDFILE" -x "/usr/sbin/$DAEMON" -- \
+			--pid-file="$PIDFILE"
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		printf "Stopping dnsmasq: "
-		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
+		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart|reload)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
