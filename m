Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F7EC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C67140860;
	Tue,  7 Feb 2023 10:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C67140860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pW_KrVsjzSaU; Tue,  7 Feb 2023 10:03:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723134086F;
	Tue,  7 Feb 2023 10:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 723134086F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB5301BF2C2
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE65B40A21
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE65B40A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFTi00Ep9KQk for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:03:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7635D40A07
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com
 [162.0.218.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7635D40A07
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:03:41 +0000 (UTC)
Received: from MTA-05-3.privateemail.com (unknown [198.54.122.141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h7.fbrelay.privateemail.com (Postfix) with ESMTPS id 5052A6049B
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 05:03:38 -0500 (EST)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
 by mta-05.privateemail.com (Postfix) with ESMTP id 87ECB18000BE;
 Tue,  7 Feb 2023 05:03:35 -0500 (EST)
Received: from system76-pc.. (cpe1150018.bra.be.verixi.net [85.119.216.19])
 by mta-05.privateemail.com (Postfix) with ESMTPA id 9EA8518000BF;
 Tue,  7 Feb 2023 05:03:32 -0500 (EST)
From: Jordan Speicher <jordan@jspeicher.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 11:02:15 +0100
Message-Id: <20230207100216.889464-1-jordan@jspeicher.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [Buildroot] [PATCH] package/mcelog: bump to version 191
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
Cc: Jordan Speicher <jordan@jspeicher.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Create .os_version to specify the version since there is no git
checkout available.

https://github.com/andikleen/mcelog/releases/tag/v191
https://github.com/andikleen/mcelog/releases/tag/v190

Signed-off-by: Jordan Speicher <jordan@jspeicher.com>
---
 package/mcelog/mcelog.hash | 2 +-
 package/mcelog/mcelog.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index e0350b085d..23fd4e50f3 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30364d134ff416f3f9469720add84bdccea226268d334f06022110f484550cd9  mcelog-189.tar.gz
+sha256  b3b2616acde7afba4752d4dc447a2c2ad5a75da65e7496e0da30f8f8d2015cfa  mcelog-191.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 8b5876d32e..9f7194e376 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 189
+MCELOG_VERSION = 191
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
 MCELOG_SELINUX_MODULES = mcelog
 
 define MCELOG_BUILD_CMDS
+	echo "$(MCELOG_VERSION)" > $(@D)/.os_version
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
