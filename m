Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1EDC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 18:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98C88410CD;
	Thu, 11 Jul 2024 18:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Lweqxd3iCn4; Thu, 11 Jul 2024 18:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B2E6410F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B2E6410F3;
	Thu, 11 Jul 2024 18:01:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF3951BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99C56066D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jgt9tkHuX7xf for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 18:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8BA8605F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8BA8605F4
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 18:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C384D84A7C; Thu, 11 Jul 2024 18:01:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 20:01:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77c62cfc75f0fe2779ecb108bbc2b3e41639b042
X-Git-Newrev: bb1987940edffc068cccf01c4dddbf7f01a1e535
X-Patchwork-Hint: ignore
Message-Id: <20240711180136.C384D84A7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltris: bump version to 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb1987940edffc068cccf01c4dddbf7f01a1e535
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As requested by Buildroot's autobuilder tracking outdated packages.

Build tested with:

$ ./utils/test-pkg -c ltris.config -p ltris -a
                             arm-aarch64 [ 1/41]: OK
                   bootlin-aarch64-glibc [ 2/41]: OK
               bootlin-arcle-hs38-uclibc [ 3/41]: OK
                    bootlin-armv5-uclibc [ 4/41]: OK
                     bootlin-armv7-glibc [ 5/41]: OK
                   bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                      bootlin-armv7-musl [ 7/41]: OK
                bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/41]: OK
             bootlin-microblazeel-uclibc [10/41]: OK
                bootlin-mipsel32r6-glibc [11/41]: OK
                   bootlin-mipsel-uclibc [12/41]: OK
                     bootlin-nios2-glibc [13/41]: OK
                 bootlin-openrisc-uclibc [14/41]: OK
        bootlin-powerpc64le-power8-glibc [15/41]: OK
           bootlin-powerpc-e500mc-uclibc [16/41]: OK
                   bootlin-riscv32-glibc [17/41]: OK
                   bootlin-riscv64-glibc [18/41]: OK
                    bootlin-riscv64-musl [19/41]: OK
                 bootlin-s390x-z13-glibc [20/41]: OK
                      bootlin-sh4-uclibc [21/41]: OK
                   bootlin-sparc64-glibc [22/41]: OK
                    bootlin-sparc-uclibc [23/41]: OK
                    bootlin-x86-64-glibc [24/41]: OK
                     bootlin-x86-64-musl [25/41]: OK
                   bootlin-x86-64-uclibc [26/41]: OK
                   bootlin-x86-i686-musl [27/41]: OK
                   bootlin-xtensa-uclibc [28/41]: OK
                            br-arm-basic [29/41]: OK
                    br-arm-full-nothread [30/41]: OK
                      br-arm-full-static [31/41]: OK
                   br-i386-pentium4-full [32/41]: OK
                      br-mips64-n64-full [33/41]: OK
                 br-mips64r6-el-hf-glibc [34/41]: OK
               br-powerpc-603e-basic-cpp [35/41]: OK
               br-powerpc64-power7-glibc [36/41]: OK
                       linaro-aarch64-be [37/41]: OK
                          linaro-aarch64 [38/41]: OK
                              linaro-arm [39/41]: OK
                         sourcery-mips64 [40/41]: OK
                           sourcery-mips [41/41]: OK
41 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

$ cat ltris.config
BR2_PACKAGE_LTRIS=y
BR2_PACKAGE_LTRIS_AUDIO=y

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltris/ltris.hash | 2 +-
 package/ltris/ltris.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ltris/ltris.hash b/package/ltris/ltris.hash
index abe6853d9b..3b2043a2c8 100644
--- a/package/ltris/ltris.hash
+++ b/package/ltris/ltris.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1291c6a642d06b9ee153ac0a2e7855a2c983e839c618f1a294df04d829525cb0  ltris-1.2.7.tar.gz
+sha256  ff28c55a18c61f28a86ba7f30f13222dfed0f7fbeb492acd95c97de9c659cec9  ltris-1.3.2.tar.gz
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
index b34ac142ce..6ebaa74294 100644
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris
-LTRIS_VERSION = 1.2.7
+LTRIS_VERSION = 1.3.2
 LTRIS_LICENSE = GPL-2.0+
 LTRIS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
