Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16694CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6FF0400CB;
	Sun,  7 Apr 2024 08:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkTLkjZo1-3d; Sun,  7 Apr 2024 08:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A93A2400D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A93A2400D6;
	Sun,  7 Apr 2024 08:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86C591BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81BB9400D6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hllP5Sl_7fKJ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF01B400CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF01B400CB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:49:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A97EF8465E; Sun,  7 Apr 2024 08:49:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 10:00:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59b48b5cff057f2429b1143d6f50c39d93ca8ef3
X-Git-Newrev: 25ff4015b97b4bb0516a9d8d030dcf0e7cde2a50
X-Patchwork-Hint: ignore
Message-Id: <20240407084944.A97EF8465E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/arm-gnu-toolchain: bump version to
 13.2-rel1
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

commit: https://git.buildroot.net/buildroot/commit/?id=25ff4015b97b4bb0516a9d8d030dcf0e7cde2a50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The arm-gnu-toolchain is used by TI's K3 generation of devices to
compile the first stage bootloader (tiboot3.bin) which will run on the
32bit R5 MCU.

The 10.3-2021.10 version of this toolchain is no longer publicized as
being downloadable (and it's fairly old) on ARM's website. Let's upgrade
to the latest version of the toolchain ARM (13.2-rel1)

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 4 ++--
 package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
index dec23f7ba5..0800fa2168 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3  gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
+# taken from https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz.sha256asc
+sha256  6cd1bbc1d9ae57312bcd169ae283153a9572bd6a8e4eeae2fedfbc33b115fdbb  arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
index 87e12874ea..03bb4dc5da 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ARM_GNU_TOOLCHAIN_VERSION = 10.3-2021.10
-ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_TOOLCHAIN_VERSION)
-ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2
+ARM_GNU_TOOLCHAIN_VERSION = 13.2.rel1
+ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel
+ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
 ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
 
 HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
