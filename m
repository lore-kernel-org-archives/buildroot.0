Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4525C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 551D882F20;
	Wed, 21 Sep 2022 20:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 551D882F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVNoZaBvaG3a; Wed, 21 Sep 2022 20:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6D6819D2;
	Wed, 21 Sep 2022 20:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E6D6819D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D67D11BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2C7140483
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C7140483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19jLcnuCXnBc for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:45:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1DB6400D2
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DB6400D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1E4A85DF2; Wed, 21 Sep 2022 20:45:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:39:56 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 83de49e54629663c345944e4499d47220bb195ee
X-Git-Newrev: 52ea32ad8fde297a344dc5962d3121cc3fb03120
X-Patchwork-Hint: ignore
Message-Id: <20220921204529.E1E4A85DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/runc: bump to
 version 1.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=52ea32ad8fde297a344dc5962d3121cc3fb03120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is the third release of the 1.1.z series of runc, and contains various
minor improvements and bugfixes.

https://github.com/opencontainers/runc/releases/tag/v1.1.3

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 72b613e3540751ade71431536c3d02a76e25d667)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index f8133d13c1..d94a0c20ca 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0ccce82b1d9c058d8fd7443d261c96fd7a803f2775bcb1fec2bdb725bc7640f6  runc-1.1.2.tar.gz
+sha256  fc1c70e095d662e38a5889bc6de41857762ce022caaf8be2852663198c533a63  runc-1.1.3.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 5faa8b683d..219d6159e9 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.2
+RUNC_VERSION = 1.1.3
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
