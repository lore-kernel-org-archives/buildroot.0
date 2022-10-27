Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B565FFA3742
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 10:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A3381395;
	Thu, 27 Oct 2022 10:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A3381395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4PTOZiL3BP2; Thu, 27 Oct 2022 10:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B70B81373;
	Thu, 27 Oct 2022 10:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B70B81373
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF1001BF869
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 10:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 981EB8137B
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 10:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 981EB8137B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDJlLVqO7kKx for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 10:49:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5F0D8136D
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 10:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F0D8136D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A02EB8734D; Thu, 27 Oct 2022 10:49:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 12:49:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f51600d04ccb20ed5c47b9e0e894fe560f16539e
X-Git-Newrev: e75c1d888bca57076807c74b48cd01f940832e85
X-Patchwork-Hint: ignore
Message-Id: <20221027104941.A02EB8734D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpfm4: bump to version 4.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e75c1d888bca57076807c74b48cd01f940832e85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Major updates:
 - Add IBM Power10 core PMU support
 - Add Intel IcelakeX core PMU support
 - Add Intel SapphireRapid core PMU support
 - Add Intel SapphireRapid RAPL PMU support
 - Update Intel Icelake RAPL PMU support
 - Add support HiSilicon Kunpeng uncore PMUs
 - Add support HiSilicon Kunpeng core PMU
 - Remove arm_fujitsu_a64fx_support for ARM(32 bit)
 - Update Intel Skylake event table
 - Add Intel PERF_METRICS event support for Icelake
 - Add support for ARM Neoverse N2 core PMU
 - Add ARM SPE events for Neoverse N1 core PMU
 - Add cgroup-switches software event
 - Add Intel Tigerlake and Rocketlake core PMU support
 - Add AMD64 Fam19h Zen3 L3 PMU support
 - Add AMD64 Fam17h Zen2 RAPL support
 - Add AMD64 Fam19h Zen3 core PMU support
 - Add RAPL for AMD64 Fam19h Zen3 processor
 - Update ARM N1 event table
 - Update AMD Fam17h Zen2 event table
 - s390: Update counter definition for IBM z16

https://perfmon2.sourceforge.net/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpfm4/libpfm4.hash | 6 +++---
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index bdc7806a7c..42740adb1e 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
-sha1  112bced9a67d565ff0ce6c2bb90452516d1183e5  libpfm-4.11.0.tar.gz
-md5  4811c1d99b95752b4ba53b89a9389ec3  libpfm-4.11.0.tar.gz
+sha1  4c61cfb489426d9fff15428cb8536ba0e391c8ac  libpfm-4.12.0.tar.gz
+md5  9e4f9b89d23171eb9314a948a51b4284  libpfm-4.12.0.tar.gz
 # Locally calculated
-sha256  5da5f8872bde14b3634c9688d980f68bda28b510268723cc12973eedbab9fecc  libpfm-4.11.0.tar.gz
+sha256  4b0c1f53f39a61525b69bebf532c68040c1b984d7544a8ae0844b13cd91e1ee4  libpfm-4.12.0.tar.gz
 sha256  beef323d68fc5db9c67b20e8e9de7ccde371d20cdbcdd686804055b18b926d90  COPYING
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 2144766d96..7165d78cd9 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.11.0
+LIBPFM4_VERSION = 4.12.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
