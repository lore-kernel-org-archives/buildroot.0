Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E611FC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A264195E;
	Wed,  3 Jul 2024 15:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vo0IgSS5qYiZ; Wed,  3 Jul 2024 15:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13F541982
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13F541982;
	Wed,  3 Jul 2024 15:57:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F07A1BF33A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C0B54011B
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weZFWAVJ5RWY for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A2A8C400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A8C400BA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2A8C400BA
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:57:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.8]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0X8u-1sAmhH12WK-00zLGQ; Wed, 03
 Jul 2024 17:57:51 +0200
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 17:57:31 +0200
Message-ID: <20240703155731.914910-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703155731.914910-1-fiona.klute@gmx.de>
References: <20240703155731.914910-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4P8qIGWbAX0jW5calxmoZRy2BgwtZnLEvtJjYZ77CPaEw0/QZuV
 iRpdaea0WSkbba3UHFLZBaxAN2D7MDQ96DKcKw06FeQGNAj+VdZ2no5gwFURQVd46aH4d4A
 1EjQKcNMzPqwNzJ/7SBYBCVghjB28hXXb0G86k7T9hnvyXRW4UNyOS7Wh9inK6RiCyqtBWX
 RhqjlGhcffaYbHkMq6Fng==
UI-OutboundReport: notjunk:1;M01:P0:WpDYt2EkJ7E=;1fPhKV34DTgGSRuHGAXY+6K8PWB
 OIkdIjCRsNufpIgahB8jCSLIDQ8ex7vwW6hMXnIxodUnG9fOstYYRstNq4edMMx9lFagvOdAz
 kkv9lYsj/GE/qhPkIFdPOjUHjdQ+tezZ7k6PCfSCLetelpfqKRuGKQbmdZq1enDs46tUiNkWF
 8phN1jxMwHyqkbOeciamdkq299yH7RruzOxhOyKIAiOmqPzpDjlqDwek/ZZM1KglHETyqZTB4
 hJd7nCo/WM+j6PuKJSEDh6ViZIPRTgDSjMwDFIlsMhhl2bTIW/pyIeKfz9shdNEStaKz48ecp
 7oV1zKhm9w/MZwGUMqjZuSkYWANhfUv3Z+lwpQVNxaoVByr1vCkqCFHhX73SwZru4Yn2aNWHS
 uEn23qwfL407lKr/TdaojXuEMu5AI9QlOmyqj3grKk8fyNAEFs5mYsetcEq099PV8VA5W3Gva
 F5Ym2WRDbWCqZ2eu4AYqlLAdfPUFkU0KIpONsgOu+kZO/sHEQbtCq1k8XmPeK+8herTc4n2Qv
 ShnL5cBC1SxEpQo4C/skMN6aIatqcymGiv5m83MlV96PZsVTOy3eKgwe5mkuTJlUBMAWYt98L
 Qb2dDlC+dt2s2QJ1QHaTQ/UiFL03SmIsAEORwzgXWPlhFbcjN6vMhlZ4M5+HP8lwq2QNkgAc2
 qSqhDeeL1bbCRue/1HjJmU9OsOidVKBUFZGukmSKApmCI7wRdxdbi15bgEv+7Eof16O6NoM2M
 lT6G8jYr7qvHhmPZvqeVSW7gV0JMekKOfS5khMv3KWDPPCZX+YpcKP0dlzGP0gjmvpx9yDxh6
 Dg3eT31WN/4NH/ztPwxPh0Ml0cIyLCaFT5jx2Bv9A9EKA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720022271; x=1720627071; i=fiona.klute@gmx.de;
 bh=wprTPPt6fYgArP9Z0Tokx062WSkFVRb9980lG8eGqso=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IJb552JGbiIw7z12hV23VIA8ax9zwHXSR95CAzu9t41lxweQKpAFPcMC8P0wNisH
 xuH136EmvKksjB7BUsqJr72uhUoI9D/3UUfI04hfXl/PgtbH3bKa483Yo+1XOF9YZ
 eUKIkAnzf3DWPMfhNLVQZwoAfiODp94hZXE4bMoqPy9fn0TAltA4FW82pY0uvB0QM
 FsDU0rdya4shHMJohh1MluajHqkKIIXVHIavvVl+amL0GP3HAgTccaoRQlMkjnKQd
 SCqpxJN+kLNOVomCHKgNe2HH57LMH9h/RGhRey+R/NcugCVHStYEI+1i1qWjjVmRh
 q+wSOzv8vTX6LhE8xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IJb552JG
Subject: [Buildroot] [PATCH v3 3/3] package/openssh: implement "reload"
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
index 5d953a3d4d..b80b8660a7 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -41,6 +41,17 @@ restart() {
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
@@ -48,11 +59,14 @@ case "$1" in
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
