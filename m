Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD9FC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF93C42B1C;
	Mon, 20 Feb 2023 21:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF93C42B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jb0ub17PIuq4; Mon, 20 Feb 2023 21:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C07A42AAB;
	Mon, 20 Feb 2023 21:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C07A42AAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 156DF1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F27661089
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F27661089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0vNuCCCqfQs for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FF31610A1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF31610A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B45D8648F; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:13:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e71ef565e720e56c51eed6933f6d87331193837f
X-Git-Newrev: 2d3c06435b24bac849bb31fcd24f56d45b191f47
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.5B45D8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/s6-linux-init: bump to
 version 1.0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d3c06435b24bac849bb31fcd24f56d45b191f47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This bump will fix the following build failure raised since bump of
skalibs to version 2.12.0.1 in commit
0f7bfc80814e90918b9527cab4cbf6afedd22195 thanks to
https://github.com/skarnet/s6-linux-init/commit/6696cee3bd309f61fc6c945ef747262a845e9267

In file included from src/shutdown/hpr_shutdown.c:8:
src/shutdown/hpr.h:20:40: error: unknown type name 'tain_t'; did you mean 'tain'?
   20 | extern int hpr_shutdown (unsigned int, tain_t const *, unsigned int) ;
      |                                        ^~~~~~
      |                                        tain

Update hash of COPYING (update in year with
https://github.com/skarnet/s6-linux-init/commit/42a91a98b780759257862642c764c2102237fea6)

https://github.com/skarnet/s6-linux-init/blob/v1.0.8.0/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/4382beeb0f94d583ba605c70a47f34b45c76e311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-linux-init/s6-linux-init.hash | 4 ++--
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index 23f02d5359..f70a4f87b5 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  29e368516b1a3c61a6d1f8680645cc122a2e02127debec91738f170a3b93b8c5  s6-linux-init-1.0.6.3.tar.gz
-sha256  4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
+sha256  92055a7964cf66604066ad964a2c2392ee7c5e64821be03146c1341e0d8c3dc6  s6-linux-init-1.0.8.0.tar.gz
+sha256  1898df1e8703bd9c1350d2ec3397880b9b4c1451038a9ce5e1c4b2e58622da39  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 95595368de..6aec220de4 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.0.6.3
+S6_LINUX_INIT_VERSION = 1.0.8.0
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
