Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43ECC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F5341955;
	Fri, 12 Jul 2024 09:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0nLYF53EDIJ; Fri, 12 Jul 2024 09:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC9C4187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EC9C4187C;
	Fri, 12 Jul 2024 09:48:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B255D1BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FEA160654
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TttXa-JbM74 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3090B60643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3090B60643
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3090B60643
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:47:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUjC-1sAwsP1ePS-010tQ2; Fri, 12
 Jul 2024 11:47:51 +0200
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 11:47:14 +0200
Message-ID: <20240712094717.2539892-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712094717.2539892-1-fiona.klute@gmx.de>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:U2gsHqLRfLdJt4E00FS6/2YMZvDCMNkWw19+0dGVw5XeasAG+ed
 00/eetPZ+9GyVswXhkJ/96SxgeVecSH7WySiMUEJ/Ay58h7knnggTrb29SppDp+FTKgbYbX
 g19Fo3QqXt6lz0k5amC2jMPmwIEDy9unfxA5FUIYmi1QR33+oMZC8r60ktPHW1XolY/Wvzx
 jdUE+VqrdXVAHe52jT07Q==
UI-OutboundReport: notjunk:1;M01:P0:uHtfgc2oqNw=;uI4rmo8RfS0t4aRqcybeXuqjifz
 +0tRQCj1b+hEFOO8kd+teOD0VmHUDvIqYQIdnISLH3w8H9wbbc1iG6GzC45T5tJYDmKepvP0m
 EpoMn/C4shvg6Y0NaGpatd7k3zSuD03pv4ii1bLlY/Y2a8odQLS6Nrl0s3w2fOz+21t4Hkmgc
 QpIMFvrREU/rSmzgTkahOsg9ZrkC+YM29TqTWbYGsxrTGSIrJABypanssSwJWyWlY9UYSWo3C
 Q4ttHm6FJzUyUIJ/ITprnIrYVfYbQfNTeBPjF3JUtMgAC0Y1J1tIZo0AvxzPEn9dXWhCKfYCd
 d92whN6o6TjMolhAePyZgPO1IS4R8iHnf5IHm+e/rocaIjsYOnGtSraLZ+fd+URpa7qSZxd//
 JpO0sIk4xmx24Udd1ph19dufaraf3MnNk1Ur1OWU1cUTnnHnl0Bc+7VUwIMv6SMhpneHbPMzs
 Fr53qR0aWn1TEIaKfo9PyY6jJLpSW7pEMvmFfxsBcaTMF/1ePGQi1mgz+6VtskFbIMjRc7o0M
 Sch/M94ERbAp6FRClCHYtYQVpffayl3CXAR9UP1LwLdG5SbrnL9IFI5g3TYOkA8d4QnHWqGnH
 soDExylE1gXeoxcOrVVTUqdOq4cszegfHFOsikVRryFXP2dzIdgK5DE1Esey0RxRXAl2Qwv9Z
 /1WFcTJUDf0pzW5CHXbKzxk7K09tDz+jnJznu2F2lSATeSRPsAWneGmM+G9t+1kG6fFOPNCoC
 qoRzk19V8UnxN0XRhrFx9rCoFFNNmvnFDjjYgArpEDHG4gc/RKDMbBOvzBznbv5bQHZRivDAk
 pLzI1wUxSSC7lPBa3t+CUhTg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777671; x=1721382471; i=fiona.klute@gmx.de;
 bh=qbf6KaUhwtFp9pn0JIgYphj7iFGhyM/R49MUHir/M4g=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HY+4TKTBAdCUbZyUWifW9exkatTr6yYpnm6q1eweW6dTLuuVjXRwQj12R8Gbl+12
 SlD41FwslgCyfK3LpL3RBFj+VeAo5tiLOuB4kDqNVLoRtzFRbA+EV3MPaKQpNLpyP
 bk0iGSYikSp8Gd8PV2jCq4S8b7rKXGN6AIM5mMA+H9NuWE0yZhOzIpip8V9UozUkE
 BBxVJbrnZzRuHch47jypxrdFs7L95zfHcxMX/m/XFEpXcA10h9W2WrWe4lDddZxpF
 y7I+UZzCvn8WCp4H3yOT+2d30f1pYDVZJ+Ol2TVFnj+4XOVK0jnB5v/KsvnkQTtn4
 99q6ARjZLm0pGUxX6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HY+4TKTB
Subject: [Buildroot] [PATCH 3/6] docs/manual: include S01syslogd from source
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

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 docs/manual/adding-packages-directory.adoc | 57 +---------------------
 docs/manual/manual.mk                      |  5 ++
 2 files changed, 7 insertions(+), 55 deletions(-)

diff --git a/docs/manual/adding-packages-directory.adoc b/docs/manual/adding-packages-directory.adoc
index 0b7221aae0..c61f78228b 100644
--- a/docs/manual/adding-packages-directory.adoc
+++ b/docs/manual/adding-packages-directory.adoc
@@ -578,62 +578,9 @@ not start before +S40network+.  The scripts are started in alphabetical
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
