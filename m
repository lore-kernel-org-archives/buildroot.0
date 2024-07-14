Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BADC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF5C60643;
	Sun, 14 Jul 2024 17:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAjQDkOSA9SF; Sun, 14 Jul 2024 17:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB73607FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB73607FA;
	Sun, 14 Jul 2024 17:32:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A45751BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CA4C811FF
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gP7Vy75BXwWQ for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A887181203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A887181203
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FFB98690A; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:31:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dc80614442cc3942a372a8c31abd22c1bc96241
X-Git-Newrev: 02d8e072d1149264601d87762c77cc806d29044b
X-Patchwork-Hint: ignore
Message-Id: <20240714173210.4FFB98690A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: include S01syslogd from source
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

commit: https://git.buildroot.net/buildroot/commit/?id=02d8e072d1149264601d87762c77cc806d29044b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual describes package/busybox/S01syslogd as the reference of
how an init script should be written. Include it from source instead
of having a copy in the manual to ensure actual code and manual stay
in sync.

Also use long options in the paragraph after the script to follow the
same style.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-directory.adoc | 65 +++---------------------------
 docs/manual/manual.mk                      |  5 +++
 2 files changed, 11 insertions(+), 59 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 2039c2c7cc..4ca11507e1 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -578,70 +578,17 @@ not start before +S40network+.  The scripts are started in alphabetical
 order, so +S01syslogd+ starts before +S01watchdogd+, and +S02sysctl+
 start thereafter.
 
+[source,sh]
 ----
-01: #!/bin/sh
-02:
-03: DAEMON="syslogd"
-04: PIDFILE="/var/run/$DAEMON.pid"
-05:
-06: SYSLOGD_ARGS=""
-07:
-08: # shellcheck source=/dev/null
-09: [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-10:
-11: # BusyBox' syslogd does not create a pidfile, so pass "-n" in the command line
-12: # and use "-m" to instruct start-stop-daemon to create one.
-13: start() {
-14: 	printf 'Starting %s: ' "$DAEMON"
-15: 	# shellcheck disable=SC2086 # we need the word splitting
-16: 	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
-17: 		-- -n $SYSLOGD_ARGS
-18: 	status=$?
-19: 	if [ "$status" -eq 0 ]; then
-20: 		echo "OK"
-21: 	else
-22: 		echo "FAIL"
-23: 	fi
-24: 	return "$status"
-25: }
-26:
-27: stop() {
-28: 	printf 'Stopping %s: ' "$DAEMON"
-29: 	start-stop-daemon -K -q -p "$PIDFILE"
-30: 	status=$?
-31: 	if [ "$status" -eq 0 ]; then
-32: 		rm -f "$PIDFILE"
-33: 		echo "OK"
-34: 	else
-35: 		echo "FAIL"
-36: 	fi
-37: 	return "$status"
-38: }
-39:
-40: restart() {
-41: 	stop
-42: 	sleep 1
-43: 	start
-44: }
-45:
-46: case "$1" in
-47: 	start|stop|restart)
-48: 		"$1";;
-49: 	reload)
-50: 		# Restart, since there is no true "reload" feature.
-51: 		restart;;
-52: 	*)
-53: 		echo "Usage: $0 {start|stop|restart|reload}"
-54: 		exit 1
-55: esac
+include::S01syslogd[]
 ----
 
 *Note:* programs that support reloading their configuration in some
 fashion (+SIGHUP+) should provide a +reload()+ function similar to
-+stop()+.  The +start-stop-daemon+ supports +-K -s HUP+ for this.
-It is recommended to always append +-x "/sbin/$DAEMON"+ to all the
-+start-stop-daemon+ commands to ensure signals are set to a PID that
-matches +$DAEMON+.
++stop()+. The +start-stop-daemon+ command supports +--stop --signal
+HUP+ for this. It is recommended to always append +--exec
+"/sbin/$DAEMON"+ to all +start-stop-daemon+ commands to ensure signals
+are set to a PID that matches +$DAEMON+.
 
 Both start scripts and unit files can source command line arguments from
 +/etc/default/foo+, in general, if such a file does not exist it should
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index e851a084ae..ca5a14f838 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -7,4 +7,9 @@
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.adoc) $(wildcard docs/images/*))
 MANUAL_RESOURCES = $(TOPDIR)/docs/images
 
+define MANUAL_INIT_SCRIPT_REF
+	cp package/busybox/S01syslogd $(@D)/S01syslogd
+endef
+MANUAL_POST_RSYNC_HOOKS += MANUAL_INIT_SCRIPT_REF
+
 $(eval $(call asciidoc-document))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
