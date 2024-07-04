Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AA6C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 10:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B0340B91;
	Thu,  4 Jul 2024 10:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBWidFqva5mT; Thu,  4 Jul 2024 10:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 191DD40BEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 191DD40BEA;
	Thu,  4 Jul 2024 10:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BECB1BF982
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37DD68478F
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10gvz5m4RUDm for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 10:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB87E8478D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB87E8478D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB87E8478D
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 10:17:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIwz4-1siV641mR8-00I1Rb; Thu, 04
 Jul 2024 12:17:02 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 12:16:29 +0200
Message-ID: <20240704101631.1860647-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704101631.1860647-1-fiona.klute@gmx.de>
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:F2+N/XLAkxAH433axLA+0KhtRLLfHRh7KGbqWBCE0662pQAqVb1
 LPvMEn+IY9tk1wIvsuZy1K0pSSocqtoeSXT2Qma+LoRp2Q/ERPIgCzU6kyKWCtLLfFYUz0H
 0gUv50Hym0Bi9R20tOQ3OR9KzdGgkH0BlKM7ETf8uUz1CO3p6u+2v2NIFIulfDe59OEZaHr
 rFK1bDFYEtpV1ZMru/GRQ==
UI-OutboundReport: notjunk:1;M01:P0:WjxQV1vigJQ=;SRgDozDlo8V/TOHDhDKCKwDL8YU
 K7CdOy7ksx839vSCEUlV6/QfTQ2i4l7w3eY6qd7bTuxTJNP6DHfvRJxMB90tyy2gGnZmnJXhw
 ZkTSwS0m5tkZdKLQQbIG130veW1bgoJak8ZE+kW1KXY/s77tG8vljBruFQZYvm2fvmE2GG2zX
 hFyK1IROF9DK3LG7VfOiSXrNx8hGHMqguq25XNguqbe1W8py2Wv3r7P4Z/cbtO8rtppx1xQWp
 Hgtz7Vh5Voe79OOWJczrS3aZBy4eByRnLrj2euSoixsZqHMGgIknru0jPOzFhnOGqAkW5uFzh
 VZgMEYVMVv49E5zXkefWiLVG/ieIqg8Hd7OjczT2qT83lRNgajKA5uGgt5UnvRVCJbE/CUMI/
 4pL3IkFmOcpFrRm4E3eRG3oyh+ZEHWYFevOMtDcFCzyrtwgRk3CHUJ+olwK87YUdG8U5mvtQi
 ixI+paZgKU0Pa93l4aDbttS0DnfidqppoNIejK3XlSQjHkteTapShB0n7V5UZijv/2ASMBUT3
 WjbGw1icX3b/Aw//ZYsUsMkYX44tlrX0YOAXcVN1rkPmMKr/acxxnedZmvNqcDT+0E7Ex37yU
 5ODiWZRmPWqLq8W7OaiQPPoxCAPoaCwHCC4qAHs3SuOJW5VXitqEMGwvVfr3XUDUqwjk3xwfT
 bBDC/TIjvBuagyCrG3VqiySORA6OoMPTHjy0uX2kuY0eKdHtBrvkS7INLHrmwDlSqaoqIdVV6
 II+jj4h0oP0oYBoVkFwnLygOJ+SmQnIVkqu8vHq4Oh6BsVxG+vPmAcoDSpWm2EhRkX/olDCRj
 vSYwPRJmYOg6zakKDjqPODfbzN3mAp7OJ5j2WABSmMj2k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720088222; x=1720693022; i=fiona.klute@gmx.de;
 bh=FRYhwVtSfUS6uwwhHJlL0Eqc/AXap8jGT3MXaw334Lw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qzgdBNToquHOLcu35zi4kMfbVZ2ONY/Fq6pJHvkiUWfku4GxnG8GPIXBdayBZOBy
 HGWqnwLZFf90hA8ClUtGyEb4Dcrt48wCcejavkagjnXGKnPeaY1yCqXLNOtRqmwMT
 u2ILHyT+E4yg2NFjKIHPbHYJuUtW5kaidPynq0o/TfQ8Gnqwwqi86I4w17Forsi5j
 Zqo7hTO64xRJtjjr6VjyXw9+66GW7w7Nau4JEr92uUZSPneBilM7UMRyfoRjpSbB0
 iRaPavykIvX0L0tDp6mjFUOG0Q3XJoFdUTg44quq2wphFVujEqF4Qn5+OGmhQiG7l
 CO59FMk2s3MpM/6bLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=qzgdBNTo
Subject: [Buildroot] [PATCH v4 1/3] package/openssh: manage sshd using
 start-stop-daemon
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
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

start-stop-daemon uses the PID file to target only the intended
process, and has built-in capability to check if it is running. This
ensures any open SSH sessions are unaffected, as well as unrelated
processes (in case a daemon crashed and the PID got reused).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v3 -> v4:
* Avoid start-stop-daemon --retry option, the Busybox implementation
  silently ignores it.

Changes v2 -> v3:
* Manage sshd using start-stop-daemon.
* Set DAEMON variable, removing a checkpatch warning.

Changes v1 -> v2:
* Acknowledge changed session binary with OpenSSH 9.8 in commit
  message (patch 1)
* Check sshd exit code on service start (patch 4)

 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 27 +++++++++++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1e1fc9018e..2edbae93d8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1149,7 +1149,7 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
 package/openrc/0004-init.d-agetty-start-agetty-after-all-sevices.patch lib_patch.Upstream
 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch lib_patch.Upstream
 package/openrc/0006-Also-create-run-lock-subsys-directory.patch lib_patch.Upstream
-package/openssh/S50sshd lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
+package/openssh/S50sshd lib_sysv.Indent
 package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch lib_patch.Upstream
 package/opentyrian/0001-Move-definitions-that-don-t-need-to-be-exposed-from-opl-h-to-opl-c.patch lib_patch.Upstream
 package/openvmtools/0001-no_cflags_werror.patch lib_patch.Upstream
diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 22da41d1ca..5ad156bf17 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -3,6 +3,9 @@
 # sshd        Starts sshd.
 #

+DAEMON="sshd"
+PIDFILE="/var/run/$DAEMON.pid"
+
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0

@@ -13,16 +16,29 @@ start() {
 	/usr/bin/ssh-keygen -A

 	printf "Starting sshd: "
-	/usr/sbin/sshd
-	touch /var/lock/sshd
-	echo "OK"
+	if start-stop-daemon --start -p "$PIDFILE" \
+			--exec "/usr/sbin/$DAEMON"; then
+		echo "OK"
+	else
+		echo "ERROR"
+		return 1
+	fi
 }
+
 stop() {
 	printf "Stopping sshd: "
-	killall sshd
-	rm -f /var/lock/sshd
+	if ! start-stop-daemon --stop -p "$PIDFILE" \
+			--exec "/usr/sbin/$DAEMON"; then
+		echo "ERROR"
+		return 1
+	fi
+	# sshd deletes its PID file on exit, wait for it to be gone
+	while [ -f "$PIDFILE" ]; do
+		sleep 0.1
+	done
 	echo "OK"
 }
+
 restart() {
 	stop
 	start
@@ -44,4 +60,3 @@ case "$1" in
 esac

 exit $?
-
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
