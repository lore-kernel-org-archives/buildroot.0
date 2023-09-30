Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED60BE748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E8341B23;
	Sat, 30 Sep 2023 19:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83E8341B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqcoKhsXeSkt; Sat, 30 Sep 2023 19:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4464A41B95;
	Sat, 30 Sep 2023 19:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4464A41B95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 163351BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E69C418CD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E69C418CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMp3mUirrIEf for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F29418F3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F29418F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FE3183D1E; Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:56:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18420d9b6b424492741cba495cc2e7a28a409e8b
X-Git-Newrev: 20d3bedb59e1c1862df2ffe31db1b7df4f27d23e
X-Patchwork-Hint: ignore
Message-Id: <20230930195629.5FE3183D1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: bump to version 2.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=20d3bedb59e1c1862df2ffe31db1b7df4f27d23e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udisks now requires that libblockdev has support for NVME via
libnvme, while udisks itself is not linked against libnvme,
just against libblockdev-nvme.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr: fix+extend commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/udisks/Config.in   | 1 +
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index b1d02a31b2..23eec1d79e 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_UDISKS
 	select BR2_PACKAGE_LIBBLOCKDEV_FS
 	select BR2_PACKAGE_LIBBLOCKDEV_LOOP
 	select BR2_PACKAGE_LIBBLOCKDEV_MDRAID
+	select BR2_PACKAGE_LIBBLOCKDEV_NVME
 	select BR2_PACKAGE_LIBBLOCKDEV_PART
 	select BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	select BR2_PACKAGE_LIBGUDEV
diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index ade4982a0b..66f4be5e1f 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6b60ebab0d5e09624120c5d158882e87d8c2473db60783b63deeba74cb18d1c  udisks-2.9.4.tar.bz2
+sha256  b75734ccf602540dedb4068bec206adcb508a4c003725e117ae8f994d92d8ece  udisks-2.10.1.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 840f552b04..0d63532d8a 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.9.4
+UDISKS_VERSION = 2.10.1
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
