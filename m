Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF54C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913CF41515;
	Tue,  2 Jul 2024 16:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPn2Be4Yd-7q; Tue,  2 Jul 2024 16:57:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612BF41506
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 612BF41506;
	Tue,  2 Jul 2024 16:57:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C80C91BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E3A4049C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6ARcNf8LVwb for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C170403AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C170403AC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C170403AC
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:57:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1sGKtj3tCr-012Npq; Tue, 02
 Jul 2024 18:57:19 +0200
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 18:57:07 +0200
Message-ID: <20240702165708.3796162-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702165708.3796162-1-fiona.klute@gmx.de>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1PSaiGeDXXVwW42VIjazVof4h+P1vbqjc5brJ3A36ccs+wUmduS
 KQhYKFFCWqz0yZHYS0M/0y0D/Rag/pVOuD+C9Zcu63/YBLKPeexWpj5wc2LOain9pmHw8IH
 9DYAUFkUBE7lnFPAZ7hiKmHFAExKWNw0MGbziOnbO3jnHs8utvDaGPzXx32rTGbQB0GsTNt
 9YaVObrEa1lQjRlahtNqA==
UI-OutboundReport: notjunk:1;M01:P0:6ZXBKvM3YVg=;a+UvZo9qolaBPm0A8AHu3ADm61g
 NHYpeyzmyeqfDG4aKrhsMkGqo2hJtgA08aFq8Dj0PHjY118qxk6Gmkvin/VzzIs9XTmaptr2Y
 CndluFlo/vy1CtihzEQhMJLbX9nUiGXWSvTL44ZW+O79YUcpniEt+XyAxefeqNak+TvC1j/IU
 ylaa4/XZWtwPygd/M9z0ToGNzo7owRch0R+nW3L0CLdJB783CsrydbDhJW2kGlxYzpehIl+p3
 eQ1iM1uYvSvfPtEOCo3fXqblr5uOiNifZ1qGZzSyqqiesu8gUX3y0t/r7rzER3z4kE2Ju1W2B
 7/yyPzftfMZGOAXbIF8w9QghJgjWIX1+1FCilZS94nSi/Nm9RurBZvr61RtpLdnoDfG06eznC
 Lvd+upfSuw8G6mVDVOlHjcqwD2t03a5VWiDnR1q1U3vMzWotQcumauIRCX1bYA/mgiMBstQLF
 mFzwGySvYBdKJyWM2yRUD3XCQsfTQxKNcW6twU4EDzCwf1kAThJYlxwkBs/5tX69rXfvtvs53
 xHh26TFZKii5z69NAmBk48Aatwt0LaXWffLWZpsD2y1uPnEG7PaAO/uVrG9iWsv/OFOkNWDBu
 0l5XN4/LF3DG7q0+dIEdBc0OKTd9b5elAcsSERcYhZfCm42DlEegbwh2DXcaJXsyR2rT44Lz/
 4z1frFyIyZd2hnCU9jFMz6r+K4xfb+4qhqE9h17ZhW1qCFcNvHnK9VAh50w6wKjKfGxbD++cK
 Yu0HYUYmDYZKLfAFULu0PvvyNHCvIy82w3O7sIVfeMVOvbQ4ocv3b1yllH9mfy6hkkADLwi9d
 v7LNZajXQhC11NPZ80Rd+3h32aNhgRcl/3b2ADaEgt7ac=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719939439; x=1720544239; i=fiona.klute@gmx.de;
 bh=Y45q/23ikrv/1ZMgifBsn+nhpuKQNorwDi0wCHwJx7U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b1m+pH4KXz84mBn2udcnn9CWmsvl9v/V5EbNfQ4ERons6vl1okAnn8O99VA+fGiY
 hJM8lYKBf32d4AjA0uqH6ico7Myp6Gs1Duz6N7NijnrdbHzOKSH/s6nO1l7TC15j2
 lbfIKjMt713pt0VOccvhh3Bf1Vr49hEPBcAUuZ+RjXppyyzDHDhvAPnZ2aRpox0+K
 R0qA/CoeR64iK5WhIB66o3apGiBbUj+kVQymrhTatjcAbvsXEIh2Shmgs7B9ZUtiH
 NVHcH35rjwrVfQilZNYhh3qPog7A+HQsZNnvmLEGgPJ6Qk0gHtIDmfYrYDOjFSJHi
 ig9lYcBBhREp3l0LRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=b1m+pH4K
Subject: [Buildroot] [PATCH v2 3/4] package/openssh: implement "reload"
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This is the documented "reload configuration" method for OpenSSH.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
