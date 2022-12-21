Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D8DC10F1B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 13:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42DE381EE3;
	Wed, 21 Dec 2022 13:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42DE381EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIEw2sp0kZIy; Wed, 21 Dec 2022 13:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B921F81FFD;
	Wed, 21 Dec 2022 13:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B921F81FFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC6091BF284
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 13:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B29834186D
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 13:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B29834186D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kKD4Mj6KOrn for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 13:11:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 749A1417BC
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 13:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 749A1417BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6379A86B9A; Wed, 21 Dec 2022 13:11:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 14:09:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fcf082ef0d0398f8e509e9876fdc29dc6f7cd934
X-Git-Newrev: 9b0eb58758ac284669d9f55c15a18a2168bf5b79
X-Patchwork-Hint: ignore
Message-Id: <20221221131111.6379A86B9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lttng-tools: bump
 to version 2.13.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b0eb58758ac284669d9f55c15a18a2168bf5b79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This bump will fix the following build failure without NPTL thanks to
https://github.com/lttng/lttng-tools/commit/27f2b8400c9db484cd195c4240c379e845b1413d
which is raised since bump to version 2.13.2 in commit
8e5f2d0f8e8c04e98f8761f3cba683c56bbefc8c and
https://github.com/lttng/lttng-tools/commit/014d7d3b5e9d69989bf776cffb6c21ff7e1d36ff:

In file included from thread.c:10:
../../src/common/compat/pthread.h: In function 'lttng_pthread_setname_np':
../../src/common/compat/pthread.h:63:27: error: 'LTTNG_UST_ABI_PROCNAME_LEN' undeclared (first use in this function)
   63 |         if (strnlen(name, LTTNG_UST_ABI_PROCNAME_LEN) >= LTTNG_UST_ABI_PROCNAME_LEN) {
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/lttng/lttng-tools/blob/v2.13.8/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/bbc8d6621822bb5da7513331e69799ca25a03f66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d94e7a6214c3bbf9add65e7ab29b530d2d57b70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-tools/lttng-tools.hash | 4 ++--
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 5b5f55da30..b48904d0b9 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.2.tar.bz2.sha256
-sha256  ced2ba00020da77fd17ac92b5a53825502409a07e3aeca28f9515d4a844fd7bd  lttng-tools-2.13.2.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.8.tar.bz2.sha256
+sha256  b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1  lttng-tools-2.13.8.tar.bz2
 
 # Locally computed
 sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index efa22a52e3..add1f12a8c 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.13.2
+LTTNG_TOOLS_VERSION = 2.13.8
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
