Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A137EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 01:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA8741F0A;
	Fri, 16 Jun 2023 01:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA8741F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id re-5-oWqwbtQ; Fri, 16 Jun 2023 01:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 734A041EFE;
	Fri, 16 Jun 2023 01:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734A041EFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0341F1BF36E
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 01:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D097960A79
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 01:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D097960A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GkyGsk23hRAG for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 01:24:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ADB560A71
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ADB560A71
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 01:24:08 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 456F05FD15
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 04:24:06 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 04:24:06 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Fri, 16 Jun 2023 04:23:24 +0300
Message-ID: <20230616012324.75426-1-KAMenyaev@sberdevices.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/15 20:23:00 #21516176
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1686878646;
 bh=HyuiXbk68bdMmRd3+sWhoiA5DaeR3PUeYZQN+z44kIY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=k9chkECsXZ9CCKyah8VjD8kqJyr+2J337956Uh7NxhAEmvWAxk3Uby+HTQ4AJ8jjo
 e1oMhbK0hw20mabKENl1DEC96kV4vAp30uOvBbMCYwni+PZO0nxpjKIfEWLrm6CWxd
 TZpUHaNfk7qq2a5CeHO7SRj2l+KD4Zxig6Gz4DLMVQ1odD7nehQOpQ3okHz5JmSqQf
 wohsAu3jUscKKWWNCylA5Zw497oZ5Htx4V59TbNvwZyI+vQ8OXRSN3KqPgvixytOMY
 fez02LTh/6D4QQl+p4knjDlFRKh3Vq+q38OPs0WvcvVLPnAy4cZXy/2+Fez1jdwQC3
 Ge+4+77++bVYA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=k9chkECs
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: provide pidfile along with
 -x flag
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
From: Konstantin Menyaev via buildroot <buildroot@buildroot.org>
Reply-To: KAMenyaev@sberdevices.ru
Cc: Konstantin Menyaev <KAMenyaev@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

Use pidfile for more accurate process match.
Useful in multiple process instances.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
---
 package/dnsmasq/S80dnsmasq | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index b052259e87..b2cd56adef 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -1,16 +1,21 @@
 #!/bin/sh
 
+NAME="dnsmasq"
+DAEMON="/usr/sbin/$NAME"
+PIDFILE="/var/run/$NAME.pid"
+
 [ -f /etc/dnsmasq.conf ] || exit 0
 
 case "$1" in
 	start)
 		printf "Starting dnsmasq: "
-		start-stop-daemon -S -x /usr/sbin/dnsmasq
+		start-stop-daemon -S -p "$PIDFILE" -x "$DAEMON" -- \
+			--pid-file="$PIDFILE"
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	stop)
 		printf "Stopping dnsmasq: "
-		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
+		start-stop-daemon -K -q -p "$PIDFILE" -x "$DAEMON"
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
 		;;
 	restart|reload)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
