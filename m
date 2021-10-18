Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0808C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD5F6128B
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BD5F6128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A93B607C4;
	Mon, 18 Oct 2021 19:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdbJBuC6oD6E; Mon, 18 Oct 2021 19:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF9A606C9;
	Mon, 18 Oct 2021 19:29:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B166C1BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE73940652
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUM0uzJwT6x9 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:22:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0B940630
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:22:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8174A8755D; Mon, 18 Oct 2021 19:19:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:22:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d203fedfbd4a9763539dd8e93ec198df6f7a132
X-Git-Newrev: 59004abc1beb024e8a9643a0bddf2c261f2d3142
X-Patchwork-Hint: ignore
Message-Id: <20211018191948.8174A8755D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firmware-utils: bump to
 86739f2b3ae9502368b89ef37fa6f31c42aad6f4
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

commit: https://git.buildroot.net/buildroot/commit/?id=59004abc1beb024e8a9643a0bddf2c261f2d3142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure raised since the addition
of package in commit 21d2a0c2ecfdddb250007ce75d1839ba81278e5b thanks to
https://git.openwrt.org/?p=project/firmware-utils.git;a=commit;h=f9ad6b335e0fd699398370d4c6e2e45e1c459dea
and
https://git.openwrt.org/?p=project/firmware-utils.git;a=commit;h=86739f2b3ae9502368b89ef37fa6f31c42aad6f4:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: CMakeFiles/ptgen.dir/src/ptgen.c.o: in function `gen_gptable':
ptgen.c:(.text+0x234): undefined reference to `bswap_64'

Fixes:
 - http://autobuild.buildroot.org/results/1e8/1e80722954fc7bd090780200b1a58b6078b601ed/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/firmware-utils/firmware-utils.hash | 2 +-
 package/firmware-utils/firmware-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
index 152b0753c1..16197cabd0 100644
--- a/package/firmware-utils/firmware-utils.hash
+++ b/package/firmware-utils/firmware-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  57b95dac6b011f4c773d6e661f7eb5b2c992079901f87610d1ed16aaacb22542  firmware-utils-2f70fedc92bd08f9e182fcc388688f36310a597d-br1.tar.gz
+sha256  0df1b7912d68822025f9bb6a7ddfdf9675e2116d34c3c74bbdc83defcefe203c  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-br1.tar.gz
diff --git a/package/firmware-utils/firmware-utils.mk b/package/firmware-utils/firmware-utils.mk
index 93f56dbb36..151a01882d 100644
--- a/package/firmware-utils/firmware-utils.mk
+++ b/package/firmware-utils/firmware-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_UTILS_VERSION = 2f70fedc92bd08f9e182fcc388688f36310a597d
+FIRMWARE_UTILS_VERSION = 86739f2b3ae9502368b89ef37fa6f31c42aad6f4
 FIRMWARE_UTILS_SITE = git://git.openwrt.org/project/firmware-utils.git
 FIRMWARE_UTILS_LICENSE = \
 	BSD-2-Clause (tplink-safeloader), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
