Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B58C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B326A859C3;
	Sun, 12 Dec 2021 12:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qvxoakMyvBl; Sun, 12 Dec 2021 12:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D609859CD;
	Sun, 12 Dec 2021 12:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2BB1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 657C540538
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yie8dmQiF1ly for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B5DA40264
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 94B1082B70; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc754df6b1d857d2fd9643ec8eef0f45f327a393
X-Git-Newrev: ca39eb212e32ca209cb3d6011847f9c94641fa73
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.94B1082B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: bump version to 2.1.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca39eb212e32ca209cb3d6011847f9c94641fa73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog ([1]):

  - fix some HAVE_IPV6 conditional changes
  - fix SO_TIMEOUT regressiony
  - ren sockets.c to socket_io.c
  - fix compile breakage per abs() returning an int instead of float
  - support for gettcpinfo on Mac OS X (tested on both M1 and x86 silicon)
  - move setsock_blocking from sockets into PerfSocket.cpp
  - don't require -V for v6, instead try v6 when v4 hostname lookup fails,
    client only
  - add assert in writen
  - add tcp RTT variance to client output
  - use setsockopt to get the nagle status
  - show Nagle and TOS settings on client
  - more on connect-only testing
  - sample and output the initial rtt and cwnd in the connect report
  - fix multiple fullduplex regressions
  - fix for HAVE_TCP_STATS in configure, then linux compile
  - writen can have more than one write, fix accounting when this occurs
  - fix tos with --reverse and --full-duplex
  - add support for --tos-override <value> on server
  - add support for  --tcp-drain, add mmm stats, histograms - experimental
    feature
  - multiple man page updates
  - fix partial histogram print to not show (f)
  - some new scripts in python flows
  - fixes to incr-srcport
  - fixes for --incr-dstport
  - fix regression on very first UDP packet having transit latency of zero
  - fix --reverse and --isochronous when --trip-times not set
  - fix client_init regression, pull out tcp_shutdown
  - fix reporter startup race and one second delay by setting the threads
    ready predicate and issuing the signal under a lock
  - fix first send accounting for small -n
  - fix configure.ac to use '=' instead of '=='

[1] https://sourceforge.net/projects/iperf2/files/readme.txt/download

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/iperf/iperf.hash | 2 +-
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 35ed2a10c1..bd5643af95 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  f1b7835eb74094b1a1849faeafe35b7c362f4ab5  iperf-2.1.4.tar.gz
+sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
 
 # Locally computed:
 sha256  062b392e87b8e227aca74fef0a99b04fe0382d4518957041b508a56885b4d4f9  iperf-2.1.4.tar.gz
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 34cbe532fd..a3d95535b3 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.4
+IPERF_VERSION = 2.1.5
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
