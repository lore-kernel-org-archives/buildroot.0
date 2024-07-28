Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A70AC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 20:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E02BC80CEA;
	Sun, 28 Jul 2024 20:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDjKWNN2NDh2; Sun, 28 Jul 2024 20:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01EC80CEB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01EC80CEB;
	Sun, 28 Jul 2024 20:10:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 745F31BF47D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EEA480CCE
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 20:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hVjiI8nnng5 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 20:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A52780C91
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A52780C91
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 20:10:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FE0E825B1; Sun, 28 Jul 2024 20:10:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 22:09:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 948b1830423421e087f6aa4923a37ce077ed5904
X-Git-Newrev: 6eef18e6b06ab9daf79e09da5f12cd9070cabbc4
X-Patchwork-Hint: ignore
Message-Id: <20240728201049.7FE0E825B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-microcode: security bump
 version to 20240531
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

commit: https://git.buildroot.net/buildroot/commit/?id=6eef18e6b06ab9daf79e09da5f12cd9070cabbc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240312
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240514
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240531

20240312 fixes
CVE-2023-39368: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00972.html
CVE-2023-38575: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00982.html
CVE-2023-28746: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00898.html
CVE-2023-22655: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00960.html
CVE-2023-43490: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01045.html

20240514 fixes
CVE-2023-45733: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01051.html
CVE-2023-46103: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01052.html
CVE-2023-45745: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01036.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 742332d552..742be5ae79 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cee26f311f7e2c039dd48cd30f995183bde9b98fb4c3039800e2ddaf5c090e55  intel-microcode-20231114.tar.gz
+sha256  c29eb35fdbd39e3ed8587e6f0b1275cc03265f230c2fcaf88e2a1556451e773f  intel-microcode-20240531.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index a159baa93d..6862565bc8 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20231114
+INTEL_MICROCODE_VERSION = 20240531
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
