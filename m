Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD028ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 10:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86E39418E7;
	Mon, 12 Sep 2022 10:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E39418E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HknyOcJc2Nhy; Mon, 12 Sep 2022 10:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DE6E418EE;
	Mon, 12 Sep 2022 10:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE6E418EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7A021BF9AF
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C74E4256D
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C74E4256D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wn0O2FOQlv3t for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 10:16:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6099542577
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6099542577
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 10:16:45 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id DB65920000F;
 Mon, 12 Sep 2022 10:16:42 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Mon, 12 Sep 2022 12:16:22 +0200
Message-Id: <20220912101623.960482-5-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912101623.960482-1-foss+buildroot@0leil.net>
References: <20220912101623.960482-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/5] package/nftables: bump to version 1.0.5
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This bumps nftables to its 1.0.5 version. This will allow us to enable
the libedit cli implementation in a later commit thanks to a fix in
version 1.0.2, commit 3847fccf0045 ("cli: remove #include
<editline/history.h>").

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 53878abba9..5e5134b61d 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423  nftables-1.0.1.tar.bz2
+sha256  8d1b4b18393af43698d10baa25d2b9b6397969beecac7816c35dd0714e4de50a  nftables-1.0.5.tar.bz2
 sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index e42108e159..56cef56524 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.1
+NFTABLES_VERSION = 1.0.5
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
