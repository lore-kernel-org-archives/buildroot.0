Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D2CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:32:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87ED86103D
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 15:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87ED86103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6003284033;
	Wed,  6 Oct 2021 15:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pyf2Kq3urnpO; Wed,  6 Oct 2021 15:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE5A8403C;
	Wed,  6 Oct 2021 15:32:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D17591BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0A4B4042A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 15:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xd6VDFxVRttl for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 15:31:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE69E402C2
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 15:31:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C42D492421; Wed,  6 Oct 2021 15:28:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 17:26:35 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 3fc7a0c529b8f84864f2e6f6226a069d178a8115
X-Git-Newrev: 64047c616921ff336aa96a00f9fb8b76ec6457ae
X-Patchwork-Hint: ignore
Message-Id: <20211006152853.C42D492421@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/udisks: bump
 version to 2.9.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=64047c616921ff336aa96a00f9fb8b76ec6457ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Release Notes:
```
This release was focused on stability and hardening, notably fixing some
long-standing race conditions and memory leaks. Default mount options got
tweaked towards data safety.

All users are strongly advised to upgrade.
```

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d0298f405255a99d0988ad042e08ba4eef080932)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index c2d69ae799..ade4982a0b 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6c398f5fc453e687d8633aeda4477d6a82f3d4bf54cd00c8b09b1e9a6fe56c11  udisks-2.9.3.tar.bz2
+sha256  b6b60ebab0d5e09624120c5d158882e87d8c2473db60783b63deeba74cb18d1c  udisks-2.9.4.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index e73cfcf1d3..2bf519a2cc 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.9.3
+UDISKS_VERSION = 2.9.4
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
