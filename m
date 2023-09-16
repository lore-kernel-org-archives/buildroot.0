Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8A8CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 09:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81E78409D7;
	Sat, 16 Sep 2023 09:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E78409D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wnm1oWNlrFGH; Sat, 16 Sep 2023 09:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD45540459;
	Sat, 16 Sep 2023 09:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD45540459
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70E911BF574
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 09:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 558ED42077
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 09:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 558ED42077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AlkC-Qk4erhR for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 09:25:47 +0000 (UTC)
X-Greylist: delayed 432 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 16 Sep 2023 09:25:46 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3E2542075
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3E2542075
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 09:25:46 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 0F8A2240027
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 11:18:32 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Rnlpv51MQz9rxP;
 Sat, 16 Sep 2023 11:18:31 +0200 (CEST)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 09:18:31 +0000
Message-ID: <20230916091831.13118-2-egorenar-dev@posteo.net>
In-Reply-To: <20230916091831.13118-1-egorenar-dev@posteo.net>
References: <20230916091831.13118-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.net; s=2017; 
 t=1694855912; bh=8Q6WjBUjEWhN6cisXmYpeGekq7k9Tog5bxmMuiD+YhE=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:From;
 b=aX1d8t/CSrL31Cdf6ZAW0cgH39jJ2VFKRXAVwfgWj09Z8LeoQasvJty0c46FFy0aQ
 0RD/6ltQjteTjD5ghI4M5B4v8KKubTgi/+2i5MlCCfJl1EKWrqK74BQjaKkCOwUb27
 IFV0k0MhyzHB6W8Jcrr560SDxFFgWz1QlSEwl+On22tAtzbJi6xefRCi1YnLAIC+ZC
 uusvW6koZeQHjWkQxt+zsQ1GgM+lPI/ByBO2Qzi75jgRum9TGybcFcxisFkozYJ7TW
 JW4Lo0uJgeSnFeIa75PnUSEoSMCnaL8YsDMvxzUw3qmVkn9PrIop222yYTfz4TCisi
 0g1IUApiPtrQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net
 header.a=rsa-sha256 header.s=2017 header.b=aX1d8t/C
Subject: [Buildroot] [PATCH 2/2] package/makedumpfile: bump version to 1.7.3
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

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/makedumpfile/makedumpfile.hash | 2 +-
 package/makedumpfile/makedumpfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
index f38d93c04aa4..665023d87be5 100644
--- a/package/makedumpfile/makedumpfile.hash
+++ b/package/makedumpfile/makedumpfile.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  748583ea4c0b32346008aa53b313e9708f60a8481959c25c76e5c94740032d9b  makedumpfile-1.7.2.tar.gz
+sha256  f059dbebf5156a9ab97cd3c1f41ad5df3436c7ab4dd6dbffa234fc4e93cfa2ce  makedumpfile-1.7.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 8dc60b043e21..6102c92bd8bb 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKEDUMPFILE_VERSION = 1.7.2
+MAKEDUMPFILE_VERSION = 1.7.3
 MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
 MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
