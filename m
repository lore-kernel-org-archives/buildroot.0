Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8D6C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 601564023B;
	Fri, 31 May 2024 09:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-lZRSEQuR4I; Fri, 31 May 2024 09:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9CE40433
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E9CE40433;
	Fri, 31 May 2024 09:55:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63C271D507C
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CBB041A69
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rDM3IpJVo1U for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB1A941A67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB1A941A67
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB1A941A67
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:54:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.89]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fnj-1s9w2S1Vdn-007BZn; Fri, 31
 May 2024 11:54:55 +0200
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 11:54:41 +0200
Message-ID: <20240531095441.2506287-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:cuVIhnmGJVEFyEdfJixpZEYKMreVAwAaydgDKsPyhu5QzItabSq
 eq8kFTPw9DdHQ7GnSIWOo9TjRoKSGvBs4eAMzP6B2GZbhWVl94NFMFE4r9+syBeqOzP/6NV
 CdDqE2uAf8UPvX0a1Zxx5C6y/wImlXmXRCWcZk9Z/s+NPIJtkqK+Gs+tg+UUhlo1eF1PkYn
 JSrLAX395hNbUvip5yHuA==
UI-OutboundReport: notjunk:1;M01:P0:XPG39N5TxKw=;zmiaG9fBaGjrTU8JYYRbA+UzXyn
 l5/CZph8x5yZ4OTJ8WdDdk3XEZS+76+a+MhAqUJ2Jph/Mx9MiFltoB/tRtyjwRcDwE2QGngUs
 XhCkNvC4n1Di3zi9NJliZtRvmRG+E/PrWugRuiHTKczavHAWfiiGoo5dD0FlYS7MxyHSfoITx
 JtxalPp2cgFXqqf/+mxJ8p699HWXSMGFFC21lmtfWMdPdyE9kUA/yIrqRWUo+K64+8THy19L7
 pmwmDi9l5GfjE71If5c9+PdXO+jbAS65grlixlZF0Uwm3dwgC1uYc6BP3Dwg8Fsqtujb/tV8W
 dLrDNge0O6G8ijwr1Qu2o/ma8bN/6HVqt051UgvYItA6i9sQdVAMiSYEYjBu4qpfH864EBpEX
 J41hHLeH0ljPh75vjAjw5Q7DbxeRql7FqD2pmuBv2URNGC6LzBMqw2KCG91+Nv28NBV62MxhQ
 ERcVv6wTohKWy1BE7p308L2pLCfcF655WKB3Bv0V1tJ8NO7572c5OD64q9maXUVyzF6Y50KOj
 CwLZ8NPruXBB1IVxIylQzIZqeppTta6FL44vmB+N+CkYVPkjYJARIQYRUHDprDb3+JOauEA3A
 FTOa+qVP/InBrETyEqev7x20o0HEkS+L/XNZkQ0pNmlEOvqr+XVHZvQa/fVM6aaXIp1zB9bR/
 zoPdFRy84ix2/ZK+bnGxQtuGpFTS3gZ2N11R68t7dFcshNcO6aHhsivcj55/4JS5NFBk1X63F
 m7af0abF4mMM45NV5OhhIC1b/ejU9LUujkVcuZHRX47t0x36WMZJGLSe+QOm92fq5zdlVruuf
 4AdH2Vp8VXEKZ1M481oNuY57UAsl81597C8piD0NFwNxM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717149295; x=1717754095; i=fiona.klute@gmx.de;
 bh=7Wqd506eLh+Fq0tlJ/umiw25GXjHuNmp0PRwO+5OAqY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Obv8DLMslgDTWhpMQB/FbXNcCCVNrXfgPKue+vWzzD+11QKYp5jw3WD8xIZ5XORB
 vmFSHhsrK3yXSYngLlm9EWLcczip8GRPVzyMqDqE7SewYD/i8mgUjBcvohj62zIqT
 GdEscA82iMcVhc7eoLNPwJSNDr/EER2flGIzdjhmNV9FjhH3AMucVFJcn+qwb8wX3
 zTtQq/oKMJPaJYlnWq6oY0FvuxvaeJ40uBLCdWLktQK1EPLmd6zX7ArxE7YsZjuO1
 dlfBoqIASep2axUIhtx1JRlotOrCdHpe/33uSlQy4IvnIkZbl20gCeHRHp+LM02Bo
 zLA0k1AbHuUkHNnrng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Obv8DLMs
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: Fix init script restart
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>
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
 package/dnsmasq/S80dnsmasq | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
index 175daf9d26..f957af3594 100644
--- a/package/dnsmasq/S80dnsmasq
+++ b/package/dnsmasq/S80dnsmasq
@@ -16,6 +16,11 @@ case "$1" in
 		printf "Stopping dnsmasq: "
 		start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"
 		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		# wait for dnsmasq process to be gone
+		while [ -f "$PIDFILE" ] && [ -d "/proc/$(cat "$PIDFILE")" ]; do
+			sleep .1
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
