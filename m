Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4D2C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 11:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E37F4150E;
	Mon, 20 Mar 2023 11:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E37F4150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3Hzl66sL8sI; Mon, 20 Mar 2023 11:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E276414C5;
	Mon, 20 Mar 2023 11:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E276414C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14B231BF3FC
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB528140E
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 11:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB528140E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uj49k5eRi4II for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 11:10:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A332813AE
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A332813AE
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 11:10:58 +0000 (UTC)
Received: from localhost.localdomain ([151.82.43.118])
 by Aruba Outgoing Smtp  with ESMTPSA
 id eDPjpb0rzXAcFeDPkpkcio; Mon, 20 Mar 2023 12:10:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 12:10:54 +0100
Message-Id: <20230320111054.6660-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFcECyT5hycPIkIYmFFzHVbFwT51gBKn8Kk2JlYIO6Dyv7AHDCgjUdzWyy7YblBcYQSlTt/dp0kLvynLyW8DHq/QfdrZKJNHP7gy/Wd0GxJrGmZBicga
 ZWTY/q7sf38GuDD/oZZXGOJuakjQ0NOG4oiLiaD0LsHd7M1SkQKxjY8+nY3FDNfN0MbjTXQIK3PWrNcZT/ZkHxeuuUA1kOnKRuU0o/hTQjxyFunlDDNhazQb
 dbojoDZkAKoSBpyaCfSBzvd6s6E7+EUep2GBSlIgly6lxmOViE/RcnTP/j7JG80Ok9Yp6yjoVhQ3aByQPopg5rPOmtN5m6ZcGhLRmfm7pRmyVmVpQ6BwIH5B
 JYYDJk8BF6qi8HjrklesO055GN3TAzdRDq5VL/vz4nOYp+DJp1s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679310656; bh=yc5TYbZRp/ehJrsHY8HArVe3XfNZsFv7mKqKAidnge4=;
 h=From:To:Subject:Date:MIME-Version;
 b=k6OGVqDt8sl4R1RkXCWG2PTv/8NtNVGAA23Po55Z02Q2sti09/IaW7WEUMhVz+jtE
 kKVOGYv6Z6w+5JYjpU86ivI/5SUS/Xpy8eMEZSub52YgwrA9nLpMnnL5CdebeEEcd1
 lSjKXttldY78qjj5FGSzCdg6ZdXPpATvdWLs1eWgPnqUI9DCOJbgDIb92AKcPMUx0q
 7yPRT5JIVNhqmHNoFzruphcNcAuNR+MF2bNi3CsCgqn5IEAyBAYem4heKuUFIdSXqQ
 7BQ2pThbC6cIvd5M7ShZz6hj7nGv/Fu94xve/doY6boH5mvPE36l2iwSDQ1HAymnIV
 q8yXrWW7ya3zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=k6OGVqDt
Subject: [Buildroot] [PATCH v3] package/mmc-utils: bump to version
 d4c2910981ff99b983734426dfa99632fb81ac6b
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>, Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's also switch to a _SITE that can be accessed from a web browser and
results to be the official one for mmc-utils.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* switch _SITE to a browsable one suggested by Peter Seiderer
V2->V3:
* update URL in Config.in as suggested by Peter Seiderer
---
 package/mmc-utils/Config.in      | 2 +-
 package/mmc-utils/mmc-utils.hash | 4 ++--
 package/mmc-utils/mmc-utils.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index d65988c749..d938b5dea3 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_MMC_UTILS
 	help
 	  MMC utils
 
-	  https://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
+	  https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 
 if BR2_PACKAGE_MMC_UTILS
 
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 1256f63487..22d34c3d40 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
-sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
+sha256  e5a8dacf26a178010202c8fa7cb28b01f50fe967da98cdbdf320b2f110920106  mmc-utils-d4c2910981ff99b983734426dfa99632fb81ac6b-br1.tar.gz
+sha256  f0b53b9d58ee24e8bd9bb69bf4b31f8d1d031cf4f5d5078842198bbc6a779ca5  mmc.h
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 435e6ae7f1..44abf00dbc 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
-MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_VERSION = d4c2910981ff99b983734426dfa99632fb81ac6b
+MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = mmc.h
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
