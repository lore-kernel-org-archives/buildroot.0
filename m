Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E07C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 358A5825FE;
	Sat, 20 Nov 2021 11:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQFRXh6ZPijI; Sat, 20 Nov 2021 11:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C85982433;
	Sat, 20 Nov 2021 11:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FEEF1BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 702A182433
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfmC-es7_NBA for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:47:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31F33823C6
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:47:40 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 2D07B240028
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 12:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1637408857; bh=x6LRXrA9ayb4mSs/yUGTCI7tsFWRqFRYN/mZrBzJvfE=;
 h=From:To:Cc:Subject:Date:From;
 b=m2fLeC4A5d+3QRYjghEI/HLk44mwTKqHcaB9Wnh/Xxypoz2tN4CYYPh49m7ZV7U39
 o+tF8StQ+ECfmxoe6EPA/TCtZsgrdVb62ZHwSqONeQozEsqUakcyV8zwzx+7f0gepF
 9fPn+M78yP5fnXnEJ9aYv+YZpzGs9dGBwGdUl5Req8A5kZmoX3cYbzUW957MhavzHb
 HDhhw6RtmfSvybW7X/XYdr7dn4TGiLk2u8hv1mwPr61/TqHfOzv55/FjbpARXPWvMm
 BZnJ/9BRyUxweuKvR+hCdHk+Htc7zeGjSB4OnTcaFyQ9dhxYCHHLvbMoZWyhyHe/EX
 i34biXtET3GpA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4HxBbq6dPWz6tm6;
 Sat, 20 Nov 2021 12:47:35 +0100 (CET)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 11:47:29 +0000
Message-Id: <20211120114729.10837-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: bump to version 1.7.0
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
- https://release-monitoring.org/project/131396/

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index f85f334cbf6c..5eeb6387faed 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  393ea8f22393c059ad21de9b1c3f45d9d0d8dbeb0ccb1417815b835d03f7c350  makedumpfile-1.6.9.tar.gz
+sha256  8985f8df249087ea68c6051dec6dac3ef0703fe2aa87d0266f3951f93aa8da5e  makedumpfile-1.7.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 16271e224686..8399e4d0636b 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.6.9
+MAKEDUMPFILE_VERSION = 1.7.0
 MAKEDUMPFILE_SITE = $(call github,makedumpfile,makedumpfile,$(MAKEDUMPFILE_VERSION))
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
-- 
2.34.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
