Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1E0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6152B8415E;
	Mon, 21 Mar 2022 16:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id md-uuaxwY_3m; Mon, 21 Mar 2022 16:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 768B384145;
	Mon, 21 Mar 2022 16:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7FC61BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEBC560634
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INmmaGZjwPYe for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:54:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 045A860EF1
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:54:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1160884AE9; Mon, 21 Mar 2022 16:46:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:45:51 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: affff7566faaf78ebee8ee7352a4ca301fb8d79d
X-Git-Newrev: 23694bac90106340d4669e0ffb2516847c1491bc
X-Patchwork-Hint: ignore
Message-Id: <20220321164604.1160884AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/timescaledb: bump
 version to 2.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=23694bac90106340d4669e0ffb2516847c1491bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This version adds support for PostgreSQL 14.

Release notes:
https://github.com/timescale/timescaledb/releases/tag/2.5.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f250847551b4f1314ea69e026125c225605fd840)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 4e3e91e152..88390bc674 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b206a376251259eb745eee819e7a853b3fbab9dc8443303714484a0fef89a2a4  timescaledb-2.4.2.tar.gz
+sha256  9d67fe70aa01cea5feceb084adc01eca8a082d847f917e68e073ab67e497af76  timescaledb-2.5.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 4adf2bdbb3..39ba9e6ef4 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.4.2
+TIMESCALEDB_VERSION = 2.5.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
