Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F559C05027
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 13:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71C36178F;
	Fri, 17 Feb 2023 13:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D71C36178F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44ogYIKeXV1N; Fri, 17 Feb 2023 13:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4C761787;
	Fri, 17 Feb 2023 13:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4C761787
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1601BF34D
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 13:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80C3941B46
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 13:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80C3941B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHCFH3ZXDHss for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 13:32:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63B0041B43
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63B0041B43
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 13:32:46 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id T0qypMa5Fvf7xT0qypBzy9; Fri, 17 Feb 2023 14:32:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 14:32:41 +0100
Message-Id: <20230217133241.533189-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMHMGhfyZti36gEY0+nk1Mr7gxDNpLr9m1DLEE79n6ePRL9KwcOWvRmIHGUw7DN/GvdNJckTlfkIrmY6P0nc4r6Z/dElNT1hcN1zw2m+6+gmwKLcT/Yo
 yhI3Z/yPPYwnsoltSWbJDkvS5QQ8glIzWl54SNi+D4Mf5kxBmZe3701wkxWsCRPQanO9upW/ObVlng4J7SCAs0oxeQOtrU4H4wX0vivyzFly2Rvu/ELv4CNs
 SQ2Wn1x7IJXCe/W6BH1ayPhlH/ltHIPpwPPVSHhJ6w6TfndCZU3S4X33ZYPZ8omxrRwTp5uyEoYGXwpEiCP1sw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676640765; bh=yGm6SXd7aQDAe0o0BbKb8skx68ZohQnYKEYrUjMXs0g=;
 h=From:To:Subject:Date:MIME-Version;
 b=Q5Q5RsaEWP2WcLItUBdaWOnjUxyIrskTXdxnlZr10tYpnahIR7cCqLcPmf3OVMqbL
 3WCu3jawtItpI5H9/Hi0/JxwFoR0WEfPGw2//NJHM+ZVp7hrMmGbbGNxr5apAe9nzb
 4/1lFpbzvPQo4/qtecKuE9Xnw6xPRtASX2ZTVWKwSbA+gn6PuD74bD20ZY3oyw1wEK
 b2uUiR0jiOrmmIXJg+KzZl4oHOFGEOr2YRWjgmTWv6N9aFD8m9Mmka+aQovuSMpvvp
 sfYdz8pECqxVsifmWnKNZElqsE/zvUJNTrFByM82Nfpuvr36iSaHE0Io9miuRuHM3U
 9gH1oN7+Luntg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q5Q5RsaE
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.14.0
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index f697f4ad3f..2d78153c81 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  96399b09b91bc717a9e96ffea660d611e6a342547c1abd4d0e858b3dca9d5a13  libfuse3-3.13.1.tar.gz
+sha256  b14f7d97abc11a5a70a37955021a7a1d8eb1d3dd5b6abec66af093eae3168c62  libfuse3-3.14.0.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index a2e9775868..8c306ba187 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.13.1
+LIBFUSE3_VERSION = 3.14.0
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
