Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C00C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5072740354;
	Mon, 27 Dec 2021 10:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id estW26ivhbNX; Mon, 27 Dec 2021 10:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F755409A2;
	Mon, 27 Dec 2021 10:32:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C36D51BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B028A40354
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXEfAA8cWAgZ for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:32:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDDA2409A3
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:32:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DC673820E7; Mon, 27 Dec 2021 10:26:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:32:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9b43105b580ba7ef1cf8ff74af18e7cd2ca5833
X-Git-Newrev: 6dbb40955f6ba7adc6da425a365aff0b361310e6
X-Patchwork-Hint: ignore
Message-Id: <20211227102626.DC673820E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bento4: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dbb40955f6ba7adc6da425a365aff0b361310e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for the upcoming Nexus version of kodi-inputstream-adaptive,
the bundled version of bento4 was removed upstream:
https://github.com/xbmc/inputstream.adaptive/commit/70625e76702186c73ddb43440f44262c48e14755

Backported upstream commit to fix cmake install as patch 0001.

Added feature- and bugfix-patches from kodi, they were sent upstream:
https://github.com/axiomatic-systems/Bento4/issues/648

Build-tested using this defconfig:

BR2_PACKAGE_BENTO4=y

                             andes-nds32 [ 1/45]: SKIPPED
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: OK
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: OK
               bootlin-m68k-68040-uclibc [10/45]: OK
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   1 +
 package/Config.in                                  |   1 +
 .../0001-Add-support-for-cmake-install.patch       | 130 +++++
 ...ional-methods-funtions-and-passing-poolid.patch | 634 +++++++++++++++++++++
 .../0003-Backport-Smmothstream-changes.patch       |  99 ++++
 package/bento4/0004-more-SPS-parameters.patch      | 219 +++++++
 .../0005-AVC-extract-VUI-values-from-SPS.patch     |  96 ++++
 .../bento4/0006-Implement-SPS-Frame-parser.patch   |  67 +++
 .../0007-Fix-segfault-when-AP4_Sample-s-seek.patch |  25 +
 package/bento4/0008-Hack-HBO.patch                 | 214 +++++++
 package/bento4/0009-Android-32-ftello-fix.patch    |  31 +
 .../0010-Dazn-sample-duration-workaround.patch     |  30 +
 ...argument-to-reuse-single-sample-decrypter.patch | 179 ++++++
 .../0012-Static-ReadGolomb-SignedGolomb.patch      |  54 ++
 package/bento4/0013-Add-GetChannels-method.patch   |  40 ++
 ...-GetSampleIndexForTimeStamp-GetNearestSyn.patch |  59 ++
 .../0015-Avoid-set-next-fragment-position.patch    |  43 ++
 package/bento4/Config.in                           |  11 +
 package/bento4/bento4.hash                         |   3 +
 package/bento4/bento4.mk                           |  24 +
 20 files changed, 1960 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
