Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15F6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 403F782CAC;
	Sun,  5 Dec 2021 10:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2z2LKnzwMEN; Sun,  5 Dec 2021 10:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 762D581045;
	Sun,  5 Dec 2021 10:20:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BF921BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F004D81045
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJdvlgXPpEXT for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:20:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04AAB80D0C
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:20:54 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 207so15172580ljf.10
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 02:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhKSGlKn7GX+PaT8ywbVebD8yYujY+Bj6od6MUDtjgY=;
 b=RO7aXy+A3Iu6Qjr3aheJV5AC7nsJab1mcHDUPLWhi9znnUPKeEiMj1An52EF9YeuOw
 uFJdcHyEZmUB2TjQASjDLHUty86sIT+Vtv765n8nXAW6cRrmjAUCAC+YXAIhEl2ZevEj
 NRwX6Q6+PUq3jY9XAFhWv6uNkFK/yhfMU4sZzJKANNC6HEPUGv/mplMHMA33d+numN1S
 xXRuwVsIpmcsbqf7pDdu4TXeQ16JyMSXDR04BGi9S7jl0q9j92dX2QnMNgRZyIJpbbFh
 HPTK2nIhfx49/90jUtDZTbl0xD0NUCeZN9lrG1KMvUhWS8FAPHPgsZywnASLYazOiZ8f
 6KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZhKSGlKn7GX+PaT8ywbVebD8yYujY+Bj6od6MUDtjgY=;
 b=ill7v0nS/ISyUIaFaPzkbzMeD2Gc7Un1QwHLWqvGng24wg75j8GSo1aCsLAadcXx4z
 Aubpx1jkyYkHMDzquAi5joW2VHaSwM/OYHSLIdJd3wkA7ibi3QATD8k+YNgF2/k15f2g
 gMS9uSFALZxliEmEjopSNK3uaNiSrdE7Hh29MROajeDAjfH0j+v1NePqT1BkPcsG5WeE
 ULtNiTLXt128FOKkvP9xEeLNinyFv/DzVmi888IW1BulW74Tzy3uRDEA89CIV2tiPYa9
 t2QKxne8DtDx+rr9ImHs6qRZOBO5HNKWZdR8qmi+J2T9VAOOtylkL1gBv7VTqd3zcHFM
 XZRA==
X-Gm-Message-State: AOAM530RWkKwcBwMJ9O6F4gbDFKNTYw1M3d7AKEXlHPlfFb/Pj29FnWW
 8FxU84C8nGyYrAMzCJv+JWsZwKxgHABBeA==
X-Google-Smtp-Source: ABdhPJzwW9Hj4oazdGup7bSPAIfyjVKzEPnSMRqYxaULf2/19+6Bmrjwgdw41xs1jjVJuhySzXBGcw==
X-Received: by 2002:a05:651c:555:: with SMTP id
 q21mr30007727ljp.193.1638699652558; 
 Sun, 05 Dec 2021 02:20:52 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id z37sm1050508lfu.79.2021.12.05.02.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 02:20:52 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 11:20:11 +0100
Message-Id: <20211205102010.2834942-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] docs/manual: add section on start script
 recommendations
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 docs/manual/adding-packages-directory.txt | 96 +++++++++++++++++++++++
 docs/manual/configure.txt                 |  1 +
 2 files changed, 97 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 4ceb3fd772..72e8dac5ff 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -554,3 +554,99 @@ over time. Such patches should not be downloaded, and instead be added
 locally to the package folder.
 
 If the +.hash+ file is missing, then no check is done at all.
+
+[[adding-packages-start-script]]
+=== The +SNNfood+ start script
+
+Packages that provide a system daemon usually need to be started somehow
+at boot.  Buildroot comes with support for several init systems, some
+are considered tier one (see xref:init-system[]), while others are also
+available but do not have the same level of integration.  The
+recommended one in Buildroot is the BusyBox init.
+
+All packages providing a system daemon must provide a start script for
+BusyBox init, and should provide a systemd unit file.  For consistency,
+the init script must follow the style and composition as defined in the
+reference: +package/busybox/S01syslogd+.  There is no recommendation for
+systemd unit files, but if a package comes with its own unit file, that
+is preferred over a local one.  Provided of course that the unit file
+is compatible with a Buildroot system.
+
+The name of the start script is composed of the +SNN+ and the daemon
+name.  The +NN+ is the start order number which needs to be carefully
+chosen.  For example, a program that requires networking to be up should
+not start before +S40network+.  The scripts are started in alphabetical
+order, so +S01syslogd+ starts before +S01watchdogd+, and +S02sysctl+
+start thereafter.
+
+------------------------------
+01: #!/bin/sh
+02:
+03: DAEMON="syslogd"
+04: PIDFILE="/var/run/$DAEMON.pid"
+05:
+06: SYSLOGD_ARGS=""
+07:
+08: # shellcheck source=/dev/null
+09: [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+10:
+11: # BusyBox' syslogd does not create a pidfile, so pass "-n" in the command line
+12: # and use "-m" to instruct start-stop-daemon to create one.
+13: start() {
+14: 	printf 'Starting %s: ' "$DAEMON"
+15: 	# shellcheck disable=SC2086 # we need the word splitting
+16: 	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+17: 		-- -n $SYSLOGD_ARGS
+18: 	status=$?
+19: 	if [ "$status" -eq 0 ]; then
+20: 		echo "OK"
+21: 	else
+22: 		echo "FAIL"
+23: 	fi
+24: 	return "$status"
+25: }
+26:
+27: stop() {
+28: 	printf 'Stopping %s: ' "$DAEMON"
+29: 	start-stop-daemon -K -q -p "$PIDFILE"
+30: 	status=$?
+31: 	if [ "$status" -eq 0 ]; then
+32: 		rm -f "$PIDFILE"
+33: 		echo "OK"
+34: 	else
+35: 		echo "FAIL"
+36: 	fi
+37: 	return "$status"
+38: }
+39:
+40: restart() {
+41: 	stop
+42: 	sleep 1
+43: 	start
+44: }
+45:
+46: case "$1" in
+47: 	start|stop|restart)
+48: 		"$1";;
+49: 	reload)
+50: 		# Restart, since there is no true "reload" feature.
+51: 		restart;;
+52: 	*)
+53: 		echo "Usage: $0 {start|stop|restart|reload}"
+54: 		exit 1
+55: esac
+------------------------------
+
+*Note:* programs that support reloading their configuration in some
+fashion (+SIGHUP+) should provide a +reload()+ function similar to
++stop()+.  The +start-stop-daemon+ supports +-K -s HUP+ for this.
+It is recommended to always append +-x "/sbin/$DAEMON"+ to all the
++start-stop-daemon+ commands to ensure signals are set to a PID that
+matches +$DAEMON+.
+
+Both start scripts and unit files can source command line arguments from
++/etc/default/foo+, in general, if such a file does not exist it should
+not block the start of the daemon, unless there is some site specirfic
+command line argument the daemon requires to start.  For start scripts a
++FOO_ARGS="-s -o -m -e -args"+ can be defined to a default value in and
+the user can override this from +/etc/default/foo+.
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index c9eef567f4..60860d2c71 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -377,6 +377,7 @@ good solution.
 Note that if +systemd+ is chosen as init system, /dev management will
 be performed by the +udev+ program provided by +systemd+.
 
+[[init-system]]
 === init system
 
 The _init_ program is the first userspace program started by the
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
