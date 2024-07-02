Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C5DC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2864C414A2;
	Tue,  2 Jul 2024 16:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5loa3N5opa06; Tue,  2 Jul 2024 16:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDDB8414B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDDB8414B3;
	Tue,  2 Jul 2024 16:57:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8071BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 170218206B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZlERVlirXnD for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1DB481FEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DB481FEE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1DB481FEE
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:57:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Udt-1sVYRR12bZ-005BT8; Tue, 02
 Jul 2024 18:57:16 +0200
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 18:57:05 +0200
Message-ID: <20240702165708.3796162-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702165708.3796162-1-fiona.klute@gmx.de>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1HYdiaXwiZtMkRIGKHXWq+ms4+y+euFtaAdY8j5yWtWjE1RTDb7
 4GXhs5MjzsTY957U3Lt3Toj6Ip58of4meGU8vNrVELYjIJlUJd+f3T03J075YuSa6uTpDpy
 YBNe1Mv0Wxp5fLjAhMplzdcSJhlBoQCUg/TAaN0ygxm2pfjwv6Yl5OVH3wJdbnyWQme9jmb
 TuHDPdB08fWNky1m/3N9A==
UI-OutboundReport: notjunk:1;M01:P0:7kwdVFxl/pk=;nMOafhDr2Tat6z9S0oaS/aHgOTi
 j/v9RI6TejaChWsCutJ2bA429AYF2ouyUJJiM3s4niZoiPRLXCMEnYrvqYz6/qzH+O4w57yDa
 dIRjS+bBVoNlLvm7wk4bIs8prK0eblwuk8nqzhBZv8iIG4FesZQUd/sH8HVPuLfVG1lOlwgTc
 ULw5SCL2lzAmxOeA6vJb8jUfQlDXMTWPsUkTVh3ncQHmHjTLLUMmpVJ4iwnIf1ZpWjFBNt8s4
 9ptmg/8cw1IivxsjTWuIiqu+6gZJDbfLOw51Ot4RyJgYpZqage+Jia0jbuHXQZ8BUm+j5WUU0
 8uRJ80HU//AMs5p2SEPmGWh77MIkyHncQyjivuOtP3+5Aj5slle5tHKh/ldx1yxsyvkFFwosh
 MIIN2f8yOeCM5xYyUVs1b2/nq1itoF3FvyBjEKOfcH3ddtTmhZMRZWWWm7OyOe97POWGvfzqg
 YF/MJm1vHIk5qshI0MOLghRlGhQxtKChMPuhI6YnGcADBeGU7F7ta+aAE4ULw4MivNY/+fJg5
 K1bhxv9vzyC+QIwGIfDQKw/Q7pLjE1f1w2SieCTB6sKKvfOhaJQK6AoCtCA27U3zBpfLts1Hd
 Y9ImVgH5MBy+S74xNiSan+ywcuoZnrwc9ZIFC9feBGskwcuighNkVRZsDlJrtLx+z651FHtzD
 VobLKUiFwDvR3KRnS019//kpQXqRfPvEUqUa0bUl+VWAGKrS/KNN+Q0T231dBNX3Hugaaa6ap
 ImWzPjwTmBrv+Z2IUM7pc3Gh7sSOWB9V1j1Mmn+w+b3DeZ8doPm3u6wsPBVhGDlshbnfsIPHd
 PEcNKG0t7zEC6+n+grN8BxMd+LNVSLgqFikLpklJnsvKY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719939436; x=1720544236; i=fiona.klute@gmx.de;
 bh=mBTA3d3yqYC54BK6S+Nb5XRPlMNk/KjEBqpg/FM5AyY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WBy98UggBo1kvJxL2lyXgN6A2dyZc37IwzO3S5ueQV5ubqT1tPlct8v9AdYxSZD3
 s1rkP6ZT01lAFg0UceUhCoC1UW4y8hpNtg8NoJnToMoJHzLlM4JoVaTcjW4DnaDUQ
 qboK+h5DiacZKlBdR9a4LyVEfKWaO3BxaociNoG7YeH2snW7bPD/0Viw0pgF3pKFo
 nCXqYHlRcGhU58SBkyHLhcIUlIKTymSZj2rle2VE4ler4ivij9/BGrqFsqPmPhET8
 MSYsrVAo7sjCiv8Zh4CkSTr6goF6vMSzZlt3lYXeS8h+lZcrLcCxgzVS3Zlb/Ghy+
 NLBjKXEhDNrRtC1VFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=WBy98Ugg
Subject: [Buildroot] [PATCH v2 1/4] package/openssh: don't kill open
 sessions on restart
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The previously used "killall sshd" stopped all instances of sshd. With
OpenSSH before 9.8 that meant not only the listening server, but also
instances serving currently open sessions, possibly including the one
used to send the restart command, preventing it from completing the
"start" part of "restart" and leaving the system unreachable over SSH.

Instead, use the PID file that sshd creates by default to target only
the listening server. This leaves any open SSH sessions unaffected.

With OpenSSH 9.8 open sessions are handled by the separate
sshd-session binary so killall does not hit them any more, but
a targeted "kill" command is still desirable.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Acknowledge changed session binary with OpenSSH 9.8 in commit
  message

 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1782161337..9c4a760117 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1150,7 +1150,7 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openssh/S50sshd lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
+package/openssh/S50sshd lib_sysv.Indent lib_sysv.Variables
 package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 22da41d1ca..f1ff9dfec1 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -3,6 +3,8 @@
 # sshd        Starts sshd.
 #

+PIDFILE="/var/run/sshd.pid"
+
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0

@@ -14,15 +16,25 @@ start() {

 	printf "Starting sshd: "
 	/usr/sbin/sshd
-	touch /var/lock/sshd
 	echo "OK"
 }
+
 stop() {
 	printf "Stopping sshd: "
-	killall sshd
-	rm -f /var/lock/sshd
+	pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+	if [ -z "${pid}" ]; then
+		echo "ERROR: not running"
+		return 1
+	fi
+	kill "${pid}"
+	# SSHD deletes its PID file when exiting, wait for it to
+	# disappear.
+	while [ -f "${PIDFILE}" ]; do
+		sleep 0.1
+	done
 	echo "OK"
 }
+
 restart() {
 	stop
 	start
@@ -44,4 +56,3 @@ case "$1" in
 esac

 exit $?
-
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
