Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A918DC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B79240BD8;
	Fri, 10 Jul 2026 13:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv8_QpsdznF8; Fri, 10 Jul 2026 13:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC10340B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691124;
	bh=RfbiN+DpxQkIiRykTsmqdtR1ydhKgTY1w8sle9GOGyk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OLhrz6dFZdPqtTJkfL2D3/cSDnjLEDdp1BXz1F6dBh9lqxwLhsPrGDiNskRjfFypV
	 dti3Q11oQCKJ1scr6T1OrkvtEK2KzlxLmqvDSKRY3BTtfISds19Kp5xs230jDork/M
	 qPqLawmrwbUPZEUOG2CbK96DzYtoL+XUAetNP56Gm8IzwAkeEFVzhPIOfRr3X4SFs1
	 I96WbWzpDKAcNA2eniFKMzjkAKRaDZv+OHXyJxdqLkucf+oneV5GUGOaR9q8+7v7zK
	 X1pKyaJ0OLG7wyibt5p/utiJLh0MuBnAVhgPMILB5jm4GB8rHxUf1ibJ/j3Owf2yYF
	 7Id1QLryGOhkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC10340B2D;
	Fri, 10 Jul 2026 13:45:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E94892FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D81D1810DD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77Z9-TLULJNR for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E62D810D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E62D810D5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36AC38867A; Fri, 10 Jul 2026 13:44:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:59:36 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d31b2b495d0101a8d3a56dc886d8e5e664a4ffc3
X-Git-Newrev: af91dcfe1c97aca19bb1c33f3d27caf8343002ad
X-Patchwork-Hint: ignore
Message-Id: <20260710134421.36AC38867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/hwdata: bump
 version to 0.409
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af91dcfe1c97aca19bb1c33f3d27caf8343002ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/vcrhonek/hwdata/releases/tag/v0.409
https://github.com/vcrhonek/hwdata/releases/tag/v0.408
https://github.com/vcrhonek/hwdata/releases/tag/v0.407

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a34e6a1938040d95372f81da0a8a1d699754d066)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index b7323fe117..74a7f5e7e7 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1ccfd1ca723595b1fe8794f4157ec5635be1ebedb5d13769b4be75d0b75bc199  hwdata-0.406.tar.gz
+sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index e12ce7efb6..7300b908b1 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.406
+HWDATA_VERSION = 0.409
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
