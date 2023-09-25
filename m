Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99E3CD54BE
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63CD941729;
	Mon, 25 Sep 2023 20:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63CD941729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxpbgKGR8TQk; Mon, 25 Sep 2023 20:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80F0641730;
	Mon, 25 Sep 2023 20:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F0641730
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E05B1BF334
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B23D141719
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B23D141719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqIfOO8YyVRa for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 20:03:06 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DBA440352
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 20:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DBA440352
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id krnKqX8r6DAHrkrnLqB70v; Mon, 25 Sep 2023 22:03:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 22:03:00 +0200
Message-Id: <20230925200301.2790925-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
References: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA303DfX2JDQZ0zYCxukpV7+clXJR8W7A3u5oI4ctPflQ2JF+beMvc0eTgvRGEmYlp/vZ4h5kpAz9eXqY0LHgroBvnYK9acWnIniQRV7rSmOLL+4EPim
 myGgCXpWUqTr4tpbTrd2vJEC4bzUPLMHTk+3V0zCH2vNYMiZIKpvt2xtOTZnKFO0xXCrhltJ/jzBpeXROmZ796obHh0APvMjb1GYzxxPSYEfae2clC1FfwqE
 yI6qOpPCStAdzxHqFky7W5r5y6cV3jTdODTZbwE98ZmqKYjc8vIxULKaN1k6ogvDUIbksddVvRaQd0cL6YgxFKHC2ZmBKWnfchoHB6RD4m6pHWjPT2KKXMfw
 va9ogFQxrLAduZPR6ak43UicX3IiiA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695672183; bh=7v+J98teFmcM8Ra4M1DpozlqVLwY9Gpv3J9Vt+OoeG8=;
 h=From:To:Subject:Date:MIME-Version;
 b=UHidsXlh0S8GBXge9H/DKWb312JSpnkZ5SeK6oAhoKYbwIgNXmx4QclEgbr9uIK58
 J4JC59OSgxeKqlNFBYPE7K83PJrcEZ0DX4S9AghX+IsTvxfrnkP1g4u+8WCerqye9M
 vfoy2yNo+JjyRPbh06xB5dkdH0WfcUYvvT4F81SUZF3EdHa64UgKkXT1CVXse4/sRB
 m+hyQ/C6WpuMxzNhqCdXC6B5fV5QtgCkW50Emoz1Zw/6cHfSY6QXvOg90IFiWke9Ra
 pf+uyfXuHWZvctHUByuMxO0XJ0Jia/yNdhqBKb186PexznM2N/SVnIMe0szkvtXskp
 8bRHgzoT0T9Cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UHidsXlh
Subject: [Buildroot] [PATCH 3/4] package/udisks: bump to version 2.10.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From now on udisks requires libnvme.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
