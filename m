Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042D6C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A47C14049C;
	Wed, 12 Jun 2024 18:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewydcMEVmyOd; Wed, 12 Jun 2024 18:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB7B404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB7B404D8;
	Wed, 12 Jun 2024 18:32:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65E8C1BF36A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50A4D83641
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFRLYhR5R7Di for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6E3E8355F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E3E8355F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6E3E8355F
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:32:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgeoI-1stprK0zZk-00gTyG; Wed, 12
 Jun 2024 20:32:02 +0200
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 20:31:32 +0200
Message-ID: <20240612183136.2145705-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612183136.2145705-1-fiona.klute@gmx.de>
References: <20240612183136.2145705-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:b9bFvOHqRcPIR3e055cNiEoS/gaarhfoIaWnotsfYuI84V40SFY
 Mydq7k9E08XFInTQOUJNKrWPevgkFtwgkbxSdvmF6GNT1at4xZa8AdU9xpvgJTM13QEgGs7
 BUURycOi/5YJtVNfeEHNaWNkRR+ieqpGKVSPI/4CRg/Ln/1Nx997yv1AaaNkXmFYIzx88ow
 GVuFy9k9UADzhl4X3AX3Q==
UI-OutboundReport: notjunk:1;M01:P0:jKX6X0svneQ=;xfUDR4x/i7iY4s/qv1+6B5mtuf6
 Cw05ks+kMx9dB9ZOXs3ZnOI6gP6/aU+CbPDrNE/SlRSPxlrLc8vo8LvnTLbJ60O66hb7gEp8E
 552wuODWOrueQFJMi00kldXXox7hOwHhYHuy4eBcA2n9+Y0zIFOodffVdF94xdt4DXX2lPowf
 e9hgc2mClxm58uBHGYz/sSPa56G/Vq70CjZaOySwxrprrvY2nj/fXOAnUiDb0lGOKsNTnqk3y
 /enadWxFHWBe5gP3JxRcqwhPwlcNDBmmSgxbopvcOIniNm42WXdAZD32evTw9LgAaU/1UVC0A
 L0XpGYhRLc0UHji/3SPpooihc2+/dtrFDH2VgHPu0gaU9n00b6wqlx+L9YxOWpvo42b9xMD/b
 vMHQyhkvXZGi5x1lpR4ulAdH99ohBr8366ShTB487TMo+k36oMWmj+jKUZy39wVcer8PIOE8u
 V2UU9vTYOvgINyzfQWfthOxaML/IamduSbgkqixeWizL91ocxvwUiTqdh23+mnTj2HW/aEo82
 0U85CmOyJ/VhTPAJh1bkTtMbgMfMK9aMu0ZMbvmEN6ek75HbJO2SskCqgSws45X6fGBXCwvF3
 f4vzwQEJx9sQ7lOlP7QN3pr112C/b6KaZzLeaFZOc+fNaRbbvyXEJiILtJ+VzAM+Ku3SzC3I9
 FTik9eWOAlX0GIciciZNyZfAlY0+cVSff04Mqu6cfIN8OKQQh80z73EEVVPFx8+X0Spg0ddxU
 5xJtfiPGSetfDWtAOP0FgRKVce8XwFnG+iotlGMY9x2UESYT0j0Q8Os0wFMiZojrPctr3mpEW
 DNjticVyW7jFPs1on8K0luqVC/4NmWtHv/JkLRWPvBzjk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718217122; x=1718821922; i=fiona.klute@gmx.de;
 bh=n/8gCABfsnJyPSiNQOkwW5tSdpvENL70G4RlgDwDnd0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=eAR+GvNSP3Om3wG2MIIRpqszyLDMwWck2w5DGtbnnNZ0fvJYmp+EGN25wECqjDZq
 ClzMi51GU8IeNc8ImXX51uZcJjgqEpxCI1pLDynblhNxdb0iSvrqpMbgq4jrNMt9R
 E3bDr6F0vTIVIsCROeZ486OMLEBKSessFPvvpvDocrNZ4uLu2i/6yIIifU2kCci8p
 M9uVPQVpA7eFB726pcqv2WhJj5E7qcroCL8SdVJRYVH0d6Ggu8bfDbPSTXpxQGmXX
 Qv64vRcffSk4r33bJXoMFuo5xn4smcMr59DuZU2PeTVBcHWxaDFgICnA+J45O9WxZ
 0s8PyTNhdXNPY1mcrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=eAR+GvNS
Subject: [Buildroot] [PATCH 1/4] package/openssh: don't kill open sessions
 on restart
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previously used "killall sshd" stopped all instances of sshd. That
means not only the listening server, but also instances serving
currently open sessions, possibly including the one used to send the
restart command, preventing it from completing the "start" part of
"restart" and leaving the system unreachable over SSH.

Instead, use the PID file that sshd creates by default to target only
the listening server. This leaves any open SSH sessions unaffected.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
I believe this bugfix should be backported to all still supported
releases.

 .checkpackageignore     |  2 +-
 package/openssh/S50sshd | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8a21b3f155..33571b592e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1166,7 +1166,7 @@ package/openrc/0003-init.d-agetty-replace-sbin-agetty-by-sbin-getty.patch lib_pa
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
