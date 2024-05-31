Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB4DC25B7C
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 18:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27FE884584;
	Fri, 31 May 2024 18:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTTLZJXXjHaw; Fri, 31 May 2024 18:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB7484585
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB7484585;
	Fri, 31 May 2024 18:53:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0E51D4808
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 18:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D1541782
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 18:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCntxIpujQLw for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 18:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFFB240445
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFFB240445
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFFB240445
 for <buildroot@buildroot.org>; Fri, 31 May 2024 18:53:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.89]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKDe-1sPORD1y3w-00vKjq; Fri, 31
 May 2024 20:53:39 +0200
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 20:53:28 +0200
Message-ID: <20240531185328.2586537-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:GRXhkQ1dXoh7rN5WG+jEscbtZVYCr2rqqLskUoxucG+lMp5QWSj
 451IBFXMKjWYgu5I2qItfhnkndyMnM3WpE+pWeHJ+IGr5CulTQpq9dS65MiwTRK32p/PEs/
 kdSULn9LOgNnMa2jL4pR2nL3otjq8xYSpJ0Eq/irQed+ADJzZ2QbxEnaVAYO4/duTO1ltTi
 pLXuCv/6ILEbo5mWHH1FA==
UI-OutboundReport: notjunk:1;M01:P0:Ju3yea+gd7M=;6YIQaQrYQqDTDDaH7wJ6dhLnaR5
 uWi9gqbAKyRxHoMFkbd4va4MJV4x2b2AJAv8B3sqLlQj+E8MDTleTllaogwtKtLtGvWqIRkc1
 rLev43wr/wcFxbmYDSaZno1eF/1ju7D9i9ZQg8QGs0o247ExWjuHjyGNMdtBOv6ChRlZSF8Ls
 /uShbiwOkZTcUxqelXLbVkYcuLNlmGREBgh5+gFFQOGDmF9DwO9ROYoPooCuhnUCWDRe9FPT4
 MKMIxnQLT1Lz+RyHeYamVqjd6GC5+t43b/UzHrYYIDCmgHAx1fL+q75SI5OyGQW9Ty1EbJL6Z
 T7RuRv8bfjE9egfMjQmbBWlheSsQP2jPus1/jpiDY6dYm+OM8+phHz9pcgzeJsYVgnW7sCRpM
 bksmdwUE9y45AaloX9fXWoEn7jfRtzerbhcapnpttoaISDkZNpNU/Qw44eW2dRHcmRabUNHFM
 AKi7Lsp1vhGcmQKj8C3iAlBhgLpNr52kNBOEyBv7F8Y0tQuuGIa47DEjw4tVt8lYwY64Z09kN
 D4tJ+fZdT9Ae7G/XlQk2XnPJ6dCIzWDOwarQGiB5nbtaJfFjzqsMlRLMNTraJPQe3T/yvLivg
 QTjlI/werd3yt1wmV0V9ezp8uT2sH5rpXMZQrm29NvuTU4Fplv/iJdjhAR08O62L413kvAJ/3
 I7qrZEOrgbpgL3+yaoY1pGYo2ZcRtYnO3fZ0NVGAkgOZItCUYF+I/w7nLa/jF1Nzjdoo82yK8
 CNe1dodjFXNtr3bvJz9GS6EAZj0DuxgUp0udN1G7VpUFsJz/abS0f09fgRVZmgU1xvnhaKOTL
 Jfs09aF/x7L1/MRzbO3NhMqZ/BGSEfdDgTYlpHxchMSMA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717181619; x=1717786419; i=fiona.klute@gmx.de;
 bh=s5tTLVEXTtGyTH0YCBJtXlPiY2N3ihZrM4xnuxWIhhE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:cc:content-transfer-encoding:content-type:date:from:
 message-id:mime-version:reply-to:subject:to;
 b=TkTOXOB+AAi0i+W5HDjdnwDC2HGDUhxweyByvhCFmdNSCp7qKaJAIznJP4J7KgsO
 JfAXi9mIIN4+fXoq6qS7mHY50ZBXqYOisoU4XVF2qYXj4jHFyRzGgpXZ4qKu42SID
 1AYLbpEWtt3egsNB4ra8JyXWANeh2+2fNjE3sBjOPgf18iLjZEyCZ0mRjQTD84Y9J
 yI74rihwvZc+KLX7bDWKZSC9pyDa3JJxcL1AQLf3fWKRXXOqbYZG6Xa9XZbO62RKQ
 valBb+u6PLIDDY7zv7+7gxAR7v34eB/PCtHLAbtSZQ8pXmMPeNxNJHF/9kg1LDnZc
 NMjl5FVyNu6vUkgSbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=TkTOXOB+
Subject: [Buildroot] [PATCH v2 1/1] package/dnsmasq: Fix init script restart
 command
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I have had constant issues restarting dnsmasq. Stop works, start fails
because the new instance can't bind the socket. Another restart
immediately after works just fine:

# /etc/init.d/S80dnsmasq restart
Stopping dnsmasq: OK
Starting dnsmasq:
dnsmasq: failed to create listening socket for 192.168.128.1: Address in use
FAIL
# /etc/init.d/S80dnsmasq restart
Stopping dnsmasq: FAIL
Starting dnsmasq: OK

Solve this by waiting for process to actually stop before returning
from the stop command. Clean up the PID file after to avoid potential
issues with the PID being reused after stop. The wait could also be
placed inside the restart block, but putting it into the stop block
has the advantage that it also avoids similar issues for any other
callers.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
Changes v1 -> v2:
Read $PIDFILE only once per iteration, to avoid errors if it
disappears between checks. Suggested by Yann E. MORIN.

 package/dnsmasq/S80dnsmasq | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index 175daf9d26..27163f5205 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -16,6 +16,13 @@ case "$1" in
 		printf "Stopping dnsmasq: "
 		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		# wait for dnsmasq process to be gone
+		while true; do
+			pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
+			( [ -n "${pid}" ] && [ -d "/proc/${pid}" ] ) || break
+			sleep 0.1
+		done
+		rm -f "$PIDFILE"
 		;;
 	restart|reload)
 		$0 stop
--
2.45.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
