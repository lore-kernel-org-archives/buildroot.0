Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F978CE7B1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 08:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A06813D8;
	Fri, 29 Sep 2023 08:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A06813D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRRLep6tuHBd; Fri, 29 Sep 2023 08:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1332F813EA;
	Fri, 29 Sep 2023 08:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1332F813EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2A771BF28E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 08:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC48D827F3
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 08:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC48D827F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v09dSc-der36 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 08:59:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC45783B69
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 08:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC45783B69
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C848D8345F; Fri, 29 Sep 2023 08:59:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 10:54:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e97bc1f05d6925b71e7871c74f1ccf9b5a2d58b
X-Git-Newrev: c3becbedb06bccbc2f67e04a183862904198292f
X-Patchwork-Hint: ignore
Message-Id: <20230929085930.C848D8345F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmon: bump to version 16p
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3becbedb06bccbc2f67e04a183862904198292f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Small improvements to on-screen use only. CLI -B and GUI 'B' to toggle
boxes around stats. CLI -^ and '^' to change units for Disk I/O KB/s ->
MB/s -> GB/s. This happen temporarily too if the size of the statistic
will not fit on-scree. Code changed to ensure clean compile for GCC 12
which does extra checks but got confused by some perfectly good C code!
Note: updated makefile makefile

https://nmon.sourceforge.io/pmwiki.php?n=Site.CompilingNmon

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmon/nmon.hash | 6 +++---
 package/nmon/nmon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
index 1d7226a4fe..fdee8824a1 100644
--- a/package/nmon/nmon.hash
+++ b/package/nmon/nmon.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nmon/files/
-md5  a8172601fdc05f3bc58455cbd3f4475e  lmon16n.c
-sha1  024a3b56179838f0e04bf1706cc9ba56595301a8  lmon16n.c
+md5  a294567253cd49ccad66d5f56435ba9d  lmon16p.c
+sha1  90ec7cd38515323bc0a22ce1a34504e70e8f468f  lmon16p.c
 # Locally computed
-sha256  c0012cc2d925dee940c37ceae297abac64ba5a5c30e575e7418b04028613f5f2  lmon16n.c
+sha256  5dc6045f6725e3249a969918fae69663a1d669162087720babcdb90fce9e6b2a  lmon16p.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index 01371a8c74..4be19b1dcf 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMON_VERSION = 16n
+NMON_VERSION = 16p
 NMON_SITE = https://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
 NMON_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
