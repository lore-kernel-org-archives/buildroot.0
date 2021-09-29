Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBDFC433FE
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:01:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA5E615A4
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BA5E615A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D2B883F35;
	Wed, 29 Sep 2021 20:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41Pqa56MHa1a; Wed, 29 Sep 2021 20:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B08483F22;
	Wed, 29 Sep 2021 20:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22C371BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1368C60736
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spj3ehqqUrSZ for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 20:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 861CD606F6
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 20:00:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2090A8D682; Wed, 29 Sep 2021 19:58:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 21:51:16 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 6f3f93adb7529bdf31e6cc9963ca8ac8996e852c
X-Git-Newrev: 26cfe50873978b8a6f8a664801b7b6c9da83acbe
X-Patchwork-Hint: ignore
Message-Id: <20210929195839.2090A8D682@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/fio: bump to
 version 3.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=26cfe50873978b8a6f8a664801b7b6c9da83acbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

This will fix the following build failure with kernel >= 5.14 thanks to
https://github.com/axboe/fio/commit/382975557e632efb506836bc1709789e615c9094:

In file included from crc/../os/os.h:39,
                 from crc/crc32c-arm64.c:2:
crc/../os/os-linux.h:17:10: fatal error: linux/raw.h: No such file or directory
   17 | #include <linux/raw.h>
      |          ^~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d85c044263c76ff7ef0fe47921d893a472954da9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1fe8806dbb0be96ec24c2cd30499949dd6cc0dd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/fio.hash | 2 +-
 package/fio/fio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 88319e4cc0..891ca4e40e 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  da9826f07a003656ea070d359c90f752db8c3216ced9ff865242eed1a1db93bc  fio-3.27.tar.gz
+sha256  859dca5241e5494d86c4aa1531a984cc556789c78e56b30d6070acfbdd193a8c  fio-3.28.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 12e2b2ab7c..13818b60fd 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.27
+FIO_VERSION = 3.28
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
