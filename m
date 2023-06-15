Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931DFEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2844E418E4;
	Thu, 15 Jun 2023 06:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2844E418E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNsNezOt0J9l; Thu, 15 Jun 2023 06:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52BB2418FD;
	Thu, 15 Jun 2023 06:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52BB2418FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C16341BF97E
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99D97405E3
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99D97405E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6T_aK6ViD2NY for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5E3B40139
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5E3B40139
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5D93837C6; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 08:53:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59df3875b5e965872007ac22245aa6e048576644
X-Git-Newrev: 0adcc6d693d97b57586d04955bd68613d78578c3
X-Patchwork-Hint: ignore
Message-Id: <20230615065520.A5D93837C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: security bump to version
 8.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0adcc6d693d97b57586d04955bd68613d78578c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2023-0330:
A vulnerability in the lsi53c895a device affects the latest version of
qemu. A DMA-MMIO reentrancy problem may lead to memory corruption bugs
like stack overflow or use-after-free.

See:
https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg00221.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index e76aef0b3a..b6fcad83e2 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0  qemu-8.0.0.tar.xz
+sha256  f060abd435fbe6794125e2c398568ffc3cfa540042596907a8b18edca34cf6a5  qemu-8.0.2.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6a6905d75f..c530896fa8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.0.0
+QEMU_VERSION = 8.0.2
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
