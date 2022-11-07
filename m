Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D3C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BDF681422;
	Mon,  7 Nov 2022 22:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BDF681422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZsE44_qRJV1; Mon,  7 Nov 2022 22:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32AEC813C4;
	Mon,  7 Nov 2022 22:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32AEC813C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A958B1BF954
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8557760BE7
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8557760BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljWtbu9WFqPc for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:16:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADEA460BBE
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADEA460BBE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9944688129; Mon,  7 Nov 2022 22:16:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:13:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e71ef565e720e56c51eed6933f6d87331193837f
X-Git-Newrev: 2d3c06435b24bac849bb31fcd24f56d45b191f47
X-Patchwork-Hint: ignore
Message-Id: <20221107221611.9944688129@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6-linux-init: bump to version
 1.0.8.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
