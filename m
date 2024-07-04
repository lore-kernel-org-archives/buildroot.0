Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F489C31D97
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 10:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B89A40BD5;
	Thu,  4 Jul 2024 10:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ydOWz66OvGy; Thu,  4 Jul 2024 10:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F13840BD2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F13840BD2;
	Thu,  4 Jul 2024 10:17:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CCAB1BF32E
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D31C3405F5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 10:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYkNPYr1Xpgy for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 10:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 548FA40920
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548FA40920
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 548FA40920
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 10:17:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNtF-1s0Olm0n7t-00jlMS; Thu, 04
 Jul 2024 12:17:03 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 12:16:31 +0200
Message-ID: <20240704101631.1860647-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704101631.1860647-1-fiona.klute@gmx.de>
References: <20240704101631.1860647-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rQ6L+MrXWvomB2oF4gy2EZ3yy8ZqhkbptILbciShd0urW+a2D8H
 nFGTZL9NlI3BHwrxy/ugC5i+cIrsrmS+sKixyMJBCRvtbxS9nlhQZJID3yqB2KqW0HsJlEM
 A67sYHhReh+ouuyaCCodzSuOI1tGyehNh6Ql/sN/JxxS85laRy/XFnBijx5jyRt4adKdEjm
 QCUsoMg2WnjQQaIJc9rsQ==
UI-OutboundReport: notjunk:1;M01:P0:0UHu++2/LEo=;4hkLoDQu4f4vcJ0ULCEnV6hDLBF
 yvsztG4Ly7iCyazumbHVv+6PBOQgDQIMrXlV9RbA5dL521VjSRCK6jv52MmMKGcha/HPcpBgB
 AtTWaGYqybbaIsjExThOxm51OUuvzYO3ldmSe0s5Lh5EqgxpwA0LXk0FZvhsxVbULlJmfTL3c
 AcKy7ZIFwyT1SXyi4V0qWQanppcVZoK/T2RIroRmZwFPG2h6zeKKcF/mQhpqM3R90NH32Q1R6
 J/ICVrYi8+syfIKtdwpaWpn1/eVquYSMTVYtNvRQwOZnm+MSr7sg+2KI3EcT++yvn1Pvd73Lo
 yAIB1gZ2zfBPAummjYJOk0USmVAB97iavkTApyXvqJfVfDRpj1LGH8u8Fi+gV4+ZgOY893kpi
 CXR71sjAeK9Y7fvLqfuzfQaCO5porCEe/emIbNB/RZBbsVo6hfhccSXDCW6ePuwa1Ha82ktMY
 oe+4QWZkSImu73ZiRsDlmwcwbM+3Y076Z4nBxQ1aiHRjHWRucgfK1RbvHdGlhv2bCPUUzy7uk
 hwxCKPE9i/lkEMJCRgVV7LBTEVgOA4T5Aj8lj3fqTmEQHozsUjCJgkDwJNCw1xLVGxiv/spdU
 +xy93EsMVZdweKxhlA0rlDUSypTYGaUfDK4QZ9DFyYywpR4jh2f3Vcj1ACmHmeDdPCPXiUJBT
 Vnc9MLhUKktNEFNz1v/QujkhZUJffWcfY62O2FBrjNxNyHPVCImfap4Abo1ad18lzfFlRGVve
 ztqO4VYez4J/B+mbGjDZ0IJKaKMCCpbzLtTzCKwRVrrwweR3vECcm4RdxFXfZcGopoh5Mvpw1
 xRqzlSKOfrMKjOF7CijczlVh3M6mzPZn3riiEjHbq5Xpw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720088223; x=1720693023; i=fiona.klute@gmx.de;
 bh=Ljh9Jt0wqduvPR8yK8AQ1OBOsOP4Z+qbEWcSu6jKUFE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CixsTtakkJbiscRxJF46sotTPFx5861fOYcKsKCNF2/FysM2czJOWdxw+bfglcOW
 f1QZ9CDFzY/oU3WKnW0kAdd3MhSxPtj2N1F/qXIUTtJ4Qy7J70AcK2WGRjds0VshF
 uIWlhK66VMwEAFAiN5K9n1A5gIRSJMyer/IXd1LHrlllD+3ZrEQKS9iPt0EA16Qk9
 R0GuIUfLKfYEBy9NsmIPUXtgoniBsE1UPVHQxDwmol0jAUfxf3c5CLP3dDD/1Kajc
 OoSaTaZKGUzpdtwBSymmgX8ewXd2o4YHDUL7rgUfMvchZoo0CQLmijKcuSM7aWpPH
 qkhrELgoAmTxpe6KPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=CixsTtak
Subject: [Buildroot] [PATCH v4 3/3] package/openssh: implement "reload"
 using SIGHUP
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

This is the documented "reload configuration" method for OpenSSH.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* Manage sshd using start-stop-daemon (instead of kill -HUP).

Changes v1 -> v2:
* Acknowledge changed session binary with OpenSSH 9.8 in commit
  message (patch 1)
* Check sshd exit code on service start (patch 4)

 package/openssh/S50sshd | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index a26a1cc6a9..4a6abb15e5 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -44,6 +44,17 @@ restart() {
 	start
 }

+reload() {
+	printf "Reloading sshd config: "
+	if start-stop-daemon --stop --signal HUP -q -p "$PIDFILE" \
+			--exec "/usr/sbin/$DAEMON"; then
+		echo "OK"
+	else
+		echo "ERROR"
+		return 1
+	fi
+}
+
 case "$1" in
 	start)
 		start
@@ -51,11 +62,14 @@ case "$1" in
 	stop)
 		stop
 		;;
-	restart|reload)
+	restart)
 		restart
 		;;
+	reload)
+		reload
+		;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
 esac

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
