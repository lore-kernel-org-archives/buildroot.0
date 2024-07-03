Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF10C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4A08418D2;
	Wed,  3 Jul 2024 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78uF7bQoORrq; Wed,  3 Jul 2024 15:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F0A41940
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F0A41940;
	Wed,  3 Jul 2024 15:57:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55EA81BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4324D60E87
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYt7REqR--HN for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0168060D91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0168060D91
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0168060D91
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:57:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.8]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatVb-1rsSlV3SkF-00ZHGj; Wed, 03
 Jul 2024 17:57:46 +0200
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:57:29 +0200
Message-ID: <20240703155731.914910-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703155731.914910-1-fiona.klute@gmx.de>
References: <20240703155731.914910-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oR5JuUk0M2aD38piyIJaZbahWeTu6+i3k9PC23lAs2uR0qALw2w
 tG7zXLftaJ5SqM9gkbvJ81ujNUqHuVLGyC1CmGiv8Raug6YqPVHSz4DADrowOB8x3QtVAdR
 OP8lNdy0HoZKw7Vxmd49R4CgkZHPUvYs/bTjoJsxLE84P4epAllGw04aJWWzaMJoYrh64gO
 4mRKFpBe0G0OqfI1uDh7g==
UI-OutboundReport: notjunk:1;M01:P0:LIUav7HamLA=;uIrFrjHJ6cdiL8C6LOk4ue3ovWo
 G6AjmCtfXK2u03cijcpnV1ix+GqWllfNBsYAh8SAqJGtViDFMvfh9qYZiKCTE6yeOrnx7UoB3
 R5/jH/FWnmaqCnnkSusAxbnibb29ZFW4vHMskWDyE6zWQSafI8Ep6NTIJ5FyrBT6va6A2ukul
 Kle0AXpbxhYsVrtIDn7kxPa8XZCqa+TAY7E2uzxtBYY0fVvR/xVjcQt3PxB5aBZg8uv5F6vv7
 DzBeIakyIW06GKeRGkp7qfJH0fnCsQxBS9myT14LzjRS9ISsv+g9eMOyGTL7W/qfivmb/3tfT
 6OtU4fF8iPpbfnIvM67x3idA3RiBtSGFUxMSzrT9ZT3IymWxkyTOpF8puSFI7PIzPxzbP5m/B
 H1M1SWU6DcOqGmLHequ1krQ4/2diqEt70OVvIZImR82qkB/71SE40h6BGDa9sEMa4NRKFvJxX
 /gjPIXD+kPHRtrFfmumYNO6xLtfVRNsg+AYgetTal+EclGt2nAR4JK+ACPMycN/h+/cBfiNyK
 DfraOvW/qUJQ2vs4wbAjF27EtvAhlhWHsRizBiuSmZdJjdML1+dorybc+1wohKm8MfOKaak7F
 P+LkZhO0/+Q5ZE5weeHONKAds0phSAnX/0/iJq2AxEudR1H8QzGfIYcs/zmZvlFTI066Cy7RZ
 j2GprYA0hxhJvDpzQ9Ge9MXEiIxjGp5WFCHvcYOmYRzg3xbDFSl25rA3MyHw6OU3EjZNz5eKK
 GG1u4zquBWMraWKbXi/C6KmEuK4a0HiTxa6aGYg+uC7m5VFasYsBHSkHdYu8n8JPshx92Zgtb
 RKY1Ao2NvJTxMYBo/xGkpRJQyvsu8nfpbk8WBjL/e/OS8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720022267; x=1720627067; i=fiona.klute@gmx.de;
 bh=+n6IfN2bpr+K5Goo4JIy3vXNX6phyO1vtXVU/U3A4DA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MUIB4o44R4+q7EGEGqims3545ROUTBiyADyZVpFFtGClHx57bI4nSFeW9nQqjrY9
 TWksNJeKkjgQc8DDWNrYEg1q/b4RfiznVdxj6bzjL0iGeXOvCb2ir6qSDB4AvBcdK
 VNgyZCbDkovsrtO0whOyQVEIBNkEO1gq1R1Bp2baWaEY74crGZHuFhV1U3P/qY6GG
 BxfSmfLOrAkfQ1KPOjJMeDjiIXIRhb38U+3eUPNtd0pGB1ZTGJEVTyaEF+itm3gcQ
 r72v7nG5x3CXP0RWPqunXxR75aJ4AGPrRegOhxp5Gex2jr50pJ4A2ePszunwCQaxE
 yci/kr/tIy6gGFO1OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MUIB4o44
Subject: [Buildroot] [PATCH v3 1/3] package/openssh: manage sshd using
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
process, has built-in capability to check if it is running, and if it
has terminated on stop. This ensures any open SSH sessions are
unaffected, as well as unrelated processes (in case a daemon crashed
and the PID got reused).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* Manage sshd using start-stop-daemon.
* Set DAEMON variable, removing a checkpatch warning.

Changes v1 -> v2:
* Acknowledge changed session binary with OpenSSH 9.8 in commit
  message (patch 1)
* Check sshd exit code on service start (patch 4)

 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 26 +++++++++++++++++++-------
 2 files changed, 20 insertions(+), 8 deletions(-)

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
index 22da41d1ca..071f6f0e99 100644
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

@@ -13,16 +16,26 @@ start() {
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
-	echo "OK"
+	if start-stop-daemon --stop --retry 5 -p "$PIDFILE" \
+			--exec "/usr/sbin/$DAEMON"; then
+		echo "OK"
+	else
+		echo "ERROR"
+		return 1
+	fi
 }
+
 restart() {
 	stop
 	start
@@ -44,4 +57,3 @@ case "$1" in
 esac

 exit $?
-
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
