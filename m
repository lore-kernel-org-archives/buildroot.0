Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC86C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7FE60BBE;
	Fri, 12 Jul 2024 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_nAGk0ZqAl8; Fri, 12 Jul 2024 12:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E2B61312
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E2B61312;
	Fri, 12 Jul 2024 12:50:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB8981BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E164F417DC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0eyBtpZ3ePr for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35D1F417D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D1F417D2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35D1F417D2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:50:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QJD-1sT4fm0581-00A7DD; Fri, 12
 Jul 2024 14:50:11 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:49:53 +0200
Message-ID: <20240712124956.3925574-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712124956.3925574-1-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oWpXMCltOd/Z0p7ZgdJsZiooJttWbvcEqwydgOUQvJj+R8VfI+f
 UlqWi57e7yjoBmbJnLxYaQEYZqgPqWA+lnP97drdp3ePiVkYjXB49v3WvWQZmM/NnHnFupK
 ZZ6dV5zALiqdKnH7MyvxySvUIophQIitXgXGlBUU7uBAvNNR7Envr7H2jIr9rhhlkhgIAxc
 9QFz4ttKCu3Ium7glr7rA==
UI-OutboundReport: notjunk:1;M01:P0:rmTIWTTXU2Q=;U4u3zx2C+IvpmmN+rSs4XqtbZzP
 UTPd083JZkBCfHewgC1bRJuQwxlv1vsE7qSLos/+HKa+PKkXUWAQMT3kN8qnPNkO/8DA3aruA
 7+F4n8c+950Zv/byfpNOfKyQ2F8tCdKTBIOwRaxXpbKY1WxiBEOCCgAZFr36QJUvhgJUs9Bup
 R2Qg+ivH2GOGah6A1R/XZDRjvBE5xV+8ZLrLsFpcG+oMbQVJT88Tdf0kpcgxG0fJaxWpWDrwP
 5KeEnwhRT+7powTdnnn8mE+8kR2sq7b6rO113l3lI07y6+ujbfa4rhyz1CsB4tD47X6u1R1xb
 s/6YDMfmDIso1/ma1OP60hGUiCx6KoTdj05ZgAh/lx6Uitcf8O/VphaVMFq6lIqYMPG/fixxt
 OS58KlKQVcKSq9gOUcSmFYh5SI1ROR1wT+Ky1+k77m0ee9/Z1JcVfW21KadMhxCGNq2gvAA2y
 7DuE7M0enQa0UezEsxUuTg2nFMN9dQcQgCyQ0PMo8WftVelPIgw4BTSc184G6eO9CNiU+54bP
 tuT78YvKDLj8f3kZbEJVX1l156pMwxdBih5icKgVQhe9AEEIWGVrWvSOK5ymaOoSkgyzHjIQb
 1elH9woLIPAUXY7+rh57tLRo2zmqSaAko0pkQTNV8w0rqryKSlOhUuiYh6efVg7v7rni7JXTw
 gp6jZQ6pW7LdRiV2nJD95hqyFbctrIwupXoZamYf5wvoodiQNRtRHX5Df3PnZGZ/THUzjeWyp
 KthHkPdsZ1bB+DJAZvFkiQFdMi8dYx1fpTAA1X/EPUhiK0PGY0vhxXRU1A0vsQ+RKxOwZD055
 KNPIGv5m8K3sJhezzcbv2F0w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720788611; x=1721393411; i=fiona.klute@gmx.de;
 bh=k11H17kowI9Y3tDHgC2QdtL/EqxDzua7fgNIV1pRLxY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Cid5tfkVlwR9YusdlUP6rgdkM4o3+beKC/E8wo8Y1UBLvW2KqDtKoGq4M/mLCx/j
 Grcb7Ax8BdJm0NF93MWAdXHnrqbk3Hkjx5xVPri7Xj2uGdoiWGYFVlXaOVtA3CJk2
 7CAKZeZIlbBdl708l2QtWZ+kco2xtHIC96rizAKJBLAoO+TQwwe4D2GsqBrGLDKLD
 v8ONwfJO/nkMN7Ckap7fAVrkhvZ6RpaBa6/cHnYpP6N9VeqMT0luKzciMDij09Qbi
 Uwjx8lMyus0DFPMCf1AZueWvs9+ulBSVOm4HXhNLaJ9ptHMRNOqfU4uoOEwmBIZlZ
 JGv3vnKOdk2qjoFNyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Cid5tfkV
Subject: [Buildroot] [PATCH v2 3/6] docs/manual: include S01syslogd from
 source
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The manual describes package/busybox/S01syslogd as the reference of
how an init script should be written. Include it from source instead
of having a copy in the manual to ensure actual code and manual stay
in sync.

Also use long options in the paragraph after the script to follow the
same style.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Update the manual paragraph below the reference script to match its
  style

 docs/manual/adding-packages-directory.adoc | 65 ++--------------------
 docs/manual/manual.mk                      |  5 ++
 2 files changed, 11 insertions(+), 59 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 0b7221aae0..0335e5a37c 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -578,70 +578,17 @@ not start before +S40network+.  The scripts are started in alphabetical
 order, so +S01syslogd+ starts before +S01watchdogd+, and +S02sysctl+
 start thereafter.

+[source,sh]
 ------------------------------
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
 ------------------------------

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
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
