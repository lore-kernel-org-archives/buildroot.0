Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D34C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 18:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE61E4057D;
	Wed, 12 Jun 2024 18:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 886ldK3FH7mA; Wed, 12 Jun 2024 18:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F7A405ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F7A405ED;
	Wed, 12 Jun 2024 18:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CABD1BF36A
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6913140150
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 18:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCWOYjkS5IZE for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 18:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C6A640AF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6A640AF2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C6A640AF2
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 18:32:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.102]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjjCL-1sfkxK0JtD-00leMF; Wed, 12
 Jun 2024 20:32:05 +0200
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 20:31:34 +0200
Message-ID: <20240612183136.2145705-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612183136.2145705-1-fiona.klute@gmx.de>
References: <20240612183136.2145705-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:f2FihWW6RCaExAlwDTqAsC7kwGPkyQcuqEtDkZIPyTxCcq3wh+E
 3SdPVyRBp/bkZmALE0PHZyETA9vDSDsyrDFG6nMgQcAnDEfqIRWD9OiNR/vIPrPeMlaR64w
 OONOaVF9zWjEfn8/oK6iFjtUzgB6DVZ6/oWAGhOJOjTbQT+vh3c+ntAIDhS7Uv/GeFWD8vd
 mPv+QJKYsYCulqJgzHxpA==
UI-OutboundReport: notjunk:1;M01:P0:dq3fPu16gcs=;mgJe+IfscZYs/5ImUDpw3Gu7VLE
 BbA0aPmw/Hmq66irAsHUtuTmGlfD/uvrDvkBa/sBW7Pb+P3UwrznbFCo37yWfyeBzMFoHVmwW
 ENHslniRbdSpumo/v0CUIYE+DISnRwV6MvMIWTG3eidV2xmbl7hJqJj3v1A1BsVD7nAfjY3tP
 YCD+fh9W0ZdcWUuxogZmv1BNEBHl5oa+UnIn2hNpz8eGv3MzBWJWUQh5iDQHhmDGWjw9lVkV+
 Sl9PRUu3xp3IRjs6Fha7QUxx/RlaVEAL1oqJc3Gino8N5cQoOPBZSJp+ZyLG9SFjFBAYwdznr
 rHu4EF9GKsoUEWGXhGdrUvS3czIJB/p06dVFQdO+l9kFjETC1uhR5h/nMKBGgjKXla1xLooyF
 7WcPx+9ggkksHKYo/z0XK/Wck50k5vqoJAuMwoGi1mdGocL4Xk+b2WMrAEIlUwa8z7EfBM9W6
 ArUL+WWGSU2LZOLqlNQJNaoMOB7rHaL1rax/DOBrMOptpaPkYiSCl6uTw9sVBRxLAqov65FEj
 GbmaQ0kSnfHpa7dWVRVQkEjCR0D14ZDEH68/0X9isMghumYVF4C8V3RxzrfLkancbX9Hu45MJ
 2kTeR2vd0DRMaMh9XgBBTIwbHxAB9ihW4PCBtEF7H44ccze6yfUSW6UgTehKm6bp96Jgd9Wcg
 wAL4JLup8NJ1EA/ZyeSejx2Sjh0roumKzaFbZu9ckKNibP3xuOdr9QBpS9eOqIiKu0VpBzmup
 gAUNULWJ0uc6Dw5BH4PCoCmiN+UMqdbiDLhUM/aB6kV+Y2evppw4y6tWaAaNK+wwPru29oSR6
 kSBeLeyui6rzDG3tyDUMSdjnFDw3HWgfTvpuR4NQs3klY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718217125; x=1718821925; i=fiona.klute@gmx.de;
 bh=wYPSIBTlHhwRKcv0Z76xbOBa34+qqgvrODqXA2Wf3xA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OfrqApgpztJ5MsHWXbr71at5QYDAzfwCyAyAwKzBGu/WtCCpx9U/P1sP2HkBN5+8
 JtmY/8WJk6ZGea8oL+ZMAoFskP66W8nvkeikEi+W9cdAiifK7ioEOwAqeJTEKMUi8
 LIGT0Kvz0N1HBByjsPCr/+SIlA9fu6jC47BffpE/l1i88pwmPYqB9satHwyDfsnMa
 3g7p5wH2qTA0kbBYaCVscdNKslxnYMxTbetoLBCPSZgqY+6qh/Ai6FouzI5OXGFYw
 qozd7WP8BUJgcdfPrDcqrPYi0eF0UiY27fFPZaxVJM7dfyMv5Y3pRXG1OxGHcXLbK
 k0Kw0VNa6MseGhoqLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=OfrqApgp
Subject: [Buildroot] [PATCH 3/4] package/openssh: implement "reload" using
 SIGHUP
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

This is the documented "reload configuration" method for OpenSSH.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 package/openssh/S50sshd | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 6ee0fc6b86..87430bbec8 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -40,6 +40,17 @@ restart() {
 	start
 }

+reload() {
+	printf "Reloading sshd config: "
+	pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+	if [ -z "${pid}" ]; then
+		echo "ERROR: not running"
+		return 1
+	fi
+	kill -HUP "${pid}"
+	echo "OK"
+}
+
 case "$1" in
 	start)
 		start
@@ -47,11 +58,14 @@ case "$1" in
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
