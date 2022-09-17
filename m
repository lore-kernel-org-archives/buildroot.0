Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3A4C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E0844194D;
	Sat, 17 Sep 2022 09:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0844194D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNSEgWCkRiLG; Sat, 17 Sep 2022 09:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E58418FF;
	Sat, 17 Sep 2022 09:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E58418FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A2691BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 464518431B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 464518431B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oocoh6oVnJ40 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D5BB84316
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D5BB84316
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 69BEE8416B; Sat, 17 Sep 2022 09:56:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:55:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ee1bd7bb2e8d01f4ddca3fb1127ec729be1c9bf
X-Git-Newrev: a99f1ee0f68035530247b3dfc1c054eb23549403
X-Patchwork-Hint: ignore
Message-Id: <20220917095638.69BEE8416B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: remove obsolete config option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a99f1ee0f68035530247b3dfc1c054eb23549403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The oldstyle option has been removed a while ago now:
    2015-02-22 a5a123b4f3b0 Feature removal - delete last remnants of
                            old pre-JSON protocol from libgps.

Drop it from Buildroot now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       | 6 ++++++
 package/gpsd/Config.in | 3 ---
 package/gpsd/gpsd.mk   | 3 ---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3a7c49e339..631b31689b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_GPSD_OLDSTYLE
+	bool "gpsd oldstyle removed"
+	select BR2_LEGACY
+	help
+	  gpsd oldstyle option has been removed by upstream in 2015.
+
 config BR2_GDB_VERSION_9_2
 	bool "gdb 9.2 removed"
 	help
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index b66d0952dd..126a907aa2 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -31,9 +31,6 @@ comment "Features"
 config BR2_PACKAGE_GPSD_CLIENT_DEBUG
 	bool "client debugging support"
 
-config BR2_PACKAGE_GPSD_OLDSTYLE
-	bool "oldstyle (pre-JSON) protocol support"
-
 config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 4388b7e24d..dec2371f68 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -168,9 +168,6 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
 GPSD_SCONS_OPTS += squelch=yes
 endif
-ifneq ($(BR2_PACKAGE_GPSD_OLDSTYLE),y)
-GPSD_SCONS_OPTS += oldstyle=no
-endif
 ifeq ($(BR2_PACKAGE_GPSD_PROFILING),y)
 GPSD_SCONS_OPTS += profiling=yes
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
