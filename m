Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36002C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD4368141E;
	Wed, 30 Aug 2023 11:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD4368141E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g56CuQSXh7Ka; Wed, 30 Aug 2023 11:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5F0E8227C;
	Wed, 30 Aug 2023 11:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F0E8227C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC171BF2B1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE8BE8141E
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE8BE8141E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtiuL5eKjU5V for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:59:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11361813CF
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11361813CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F36D4865A9; Wed, 30 Aug 2023 11:59:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 13:58:31 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dc0a90c96cb6267c6cb84452720076d600d20091
X-Git-Newrev: 34dde405262f7570422f9e8a84d0b103ffd2032c
X-Patchwork-Hint: ignore
Message-Id: <20230830115905.F36D4865A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/iperf3: security
 bump to version 3.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=34dde405262f7570422f9e8a84d0b103ffd2032c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

For change log, see:
https://github.com/esnet/iperf/blob/3.14/RELNOTES.md#iperf-314-2023-07-07

Fixes CVE-2023-38403:
https://www.cve.org/CVERecord?id=CVE-2023-38403

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c4f02e76ea6df25456e4cccedd04d47c44add18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index b2c89df98a..02ada0dcc6 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.13.tar.gz.sha256
-sha256  bee427aeb13d6a2ee22073f23261f63712d82befaa83ac8cb4db5da4c2bdc865  iperf-3.13.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.14.tar.gz.sha256
+sha256  723fcc430a027bc6952628fa2a3ac77584a1d0bd328275e573fc9b206c155004  iperf-3.14.tar.gz
 # Locally computed
 sha256  35aa7c4618b9884d6faa9b43a4e70291b35ea9f89329d5d33becd852e85221b0  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 129319d78a..c00b16ce61 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.13
+IPERF3_VERSION = 3.14
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
