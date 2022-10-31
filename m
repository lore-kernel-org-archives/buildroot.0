Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAC4FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E592280B25;
	Mon, 31 Oct 2022 14:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E592280B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10KWuGlVeQzW; Mon, 31 Oct 2022 14:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E94581427;
	Mon, 31 Oct 2022 14:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E94581427
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69C081BF95D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66A2E415A9
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A2E415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QqNRLGn-NoiI for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53382401FA
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53382401FA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F2A487947; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:41:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d264b6e81e1a03c36df55c66771ed26dd767a522
X-Git-Newrev: 4022f5fe44a928c5e987f40fd4f58dd0ae5cf1fb
X-Patchwork-Hint: ignore
Message-Id: <20221031144227.3F2A487947@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress: bump to version 1.0.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4022f5fe44a928c5e987f40fd4f58dd0ae5cf1fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to an active fork:

"The original stress went unmaintained; the source of the last version,
1.0.4, was imported from Debian. After, patches from Debian and other
changes were applied to create the 1.0.5 release. The details of each
release are registered in the ChangeLog file. Now, stress is maintained
by volunteers under Resurrecting Open Source Projects."

https://github.com/resurrecting-open-source-projects/stress/blob/1.0.5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stress/Config.in   | 2 +-
 package/stress/stress.hash | 3 +--
 package/stress/stress.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/stress/Config.in b/package/stress/Config.in
index b22c3f19bb..32a3e264bc 100644
--- a/package/stress/Config.in
+++ b/package/stress/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_STRESS
 	  It imposes a configurable amount of CPU, memory, I/O, and
 	  disk stress on the system.
 
-	  http://people.seas.harvard.edu/~apw/stress/
+	  https://github.com/resurrecting-open-source-projects/stress/
diff --git a/package/stress/stress.hash b/package/stress/stress.hash
index 8d14d053fb..dc1785b6c7 100644
--- a/package/stress/stress.hash
+++ b/package/stress/stress.hash
@@ -1,4 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256  057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b  stress-1.0.4.tar.gz
 # Locally computed
+sha256  1798e49ca365d928fb194ba1b8e8d1e09963b49e9edb0a78bcbba15750bb5027  stress-1.0.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 4d2d4cb838..99a50f349e 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-STRESS_VERSION = 1.0.4
-STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
+STRESS_VERSION = 1.0.5
+STRESS_SITE = $(call github,resurrecting-open-source-projects,stress,$(STRESS_VERSION))
 STRESS_LICENSE = GPL-2.0+
 STRESS_LICENSE_FILES = COPYING
+# From git
+STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
 # However, this option is always specified in the global
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
