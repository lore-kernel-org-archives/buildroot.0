Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA038C761A6
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 18:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57F4D40B08;
	Tue,  4 Apr 2023 18:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57F4D40B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K69Aumfqr83F; Tue,  4 Apr 2023 18:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FFD040374;
	Tue,  4 Apr 2023 18:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FFD040374
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D19B1BF360
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 18:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23A3E815CD
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 18:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23A3E815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwYZX5dQCbyT for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 18:57:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5132815CA
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5132815CA
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 18:57:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.123.87])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jlqLpmUXlfI4sjlqLpGzYV; Tue, 04 Apr 2023 20:57:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  4 Apr 2023 20:57:20 +0200
Message-Id: <20230404185720.123801-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEsToqmS84/FVK7xG29yE+xXUqWECs9AdkPsGmQwuAfTjltahbJMCQtJsu9BiRDj/WhJrCcXSoqTAvLg0M3iF+8k8MgzwnorVDwqHV2nsxt2YJcCmZZP
 aS21YHDsNsZ/M5+R1o9GqsSggfbkNZbEf49xdJrHI9S/MG0xAwB/AoN/kAk2OR7l/VmYpb/sxu13d3p62Sbhd1kJ/1gYI6AFzVhnEycd6Kb28rii3s6Qo4Pi
 6CV/ej/geA854c65JXVAOpCysQP+6q1z2chUUlr0TUGGLlbwxgtA9cG04a2SuXds
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1680634641; bh=QVUXIg0xhhYb3pR2VJv9Bwzbtoe4G0C+XhCj95GFS8c=;
 h=From:To:Subject:Date:MIME-Version;
 b=Xxv6MW6Wc4ovafPb8dWdvGSZDAfWoPeIYDAXi5a++WYiO5erGQS2QDql14aQzP2y2
 1DkXEhQ1nfAB8wfoE3WBpm6Jk1bP8SkJEOgUIcOvGOzo4mGNCW9V3tepRcGv9ft9ju
 PP8ZJTIZjNa7GzVAeYQnSxqAc8KJEHlTXSQo/d20K9/23uAcndukEGDkmr4zeP5Dx5
 x/2oFFhkjJpJmt7zU9Z9zlFouAm4T2QVZ8ewnRKOUdiz0MOPOP2pldBv63hbrHlBxm
 yLTJQfRV4thsEZUF0+8efW5jtWNQ9+Uk09naRYhYrApQ8zLI4BPNstLXLHxPqwp88D
 huJQhU3e2ODFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Xxv6MW6W
Subject: [Buildroot] [PATCH] package/mali-driver: bump to version 2023-04-04
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This versions fixed build failure on Linux 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 5d32c1af8a..de3b6e69f0 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  761e3f000b4c546cbd35baf34f5a0d1090f048dd44ee543773674192fd95f6b3  mali-driver-87c13e6994b20b5068e3a5e4f4c1b64db666a4c8.tar.gz
+sha256  763d3cf76eb03584df6a13986a2877dc0ae5f310fc3d91e8a498fc5f89271dcc  mali-driver-c90627f78d58567a2acb7cbf77d565e03a131294.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index bdc9fedeb4..8e059fe8bd 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 87c13e6994b20b5068e3a5e4f4c1b64db666a4c8
+MALI_DRIVER_VERSION = c90627f78d58567a2acb7cbf77d565e03a131294
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
