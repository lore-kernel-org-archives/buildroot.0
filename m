Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA0BE7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 20:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA7941586;
	Thu, 12 Dec 2024 20:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXVKF_EPTBsK; Thu, 12 Dec 2024 20:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0BB415BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0BB415BA;
	Thu, 12 Dec 2024 20:11:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF4B1146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DE5F606BB
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cacRq2mILJcd for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 20:11:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53E006062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53E006062E
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53E006062E
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:11:53 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LpXLtteFZ0w3ULpXLtHIXW; Thu, 12 Dec 2024 21:11:51 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 11 Dec 2024 22:09:34 +0100
Message-Id: <20241211210934.179268-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH0gPQfIHRQIHUnSs9utvtzpCeJv0IS9FD/rvbMFlWlLA/DNJu6e7+LfP79ia6ohLkeZJz8/YapKr2JtowYpcjXd8zeDZ/abx6q21/0+xy0k03k+voPg
 aYrWpOsVT5vEnCAK7i9U5cwBvp7LJQvwqmsMEmeC2S24WsUcPMnfUKYiLy8O/MhLG+uhqZl2NB/ZeJT+H0x1iQEQ1ZYuxrzvy/+UwwABWELguA9dNTpqlDKC
 eJLiKBxoifWhDL1pJPV1XbPajVm4/fPJ9RQfvToekXrXV8fRN6OsQ10IDdW+OekuvPvdgy9B8aIbJFv2bop9GQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1734034311; bh=8Tf6kC4sakC4odUP4TC+HOjiECBCaRMtce0uSMkLTj4=;
 h=From:To:Subject:Date:MIME-Version;
 b=bAeFV6E6LF9sQ3QbQBYma+uLAvhqpgXK4jK70ofkr8aN43f2AfUxh6WCnhKRUkgMF
 MEsysi1mGcGarhK+mLkPFjRXG4c1oYeqMVkAqwHACTd6c1guFtmusHvaddKjgijqsE
 TtfiPpd9e2twFCYxGx3PokH3p7oqcIBapOMFqRYQtqCiA307koTZBHNkb6SW3uw+gH
 M//p98iCRVRVbwkmgGRmxg2NW2ll6yhSja7fr1U+UAvBB2EEqOBDGoMBccr7vCMggM
 3RG0lh3BGAV8BC9zut88S9zBl/zzwjqjNdKb08o2WAtLeTt74B1dLad26FtyCGVDay
 RQvknMkuH0bVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bAeFV6E6
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index b4ecbd0aec..ff3f03799d 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.1/sha256sums.asc
-sha256  a0be95b08396908048583fcf6b34a7c1ab49d53e8a12eb28673ccfd2eff0c505  nfs-utils-2.8.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.2/sha256sums.asc
+sha256  a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15  nfs-utils-2.8.2.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 4b008042ce..60e9c26695 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.1
+NFS_UTILS_VERSION = 2.8.2
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
