Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57985C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 16:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC6E08278F;
	Wed, 12 Oct 2022 16:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC6E08278F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozKXl_VfcpEq; Wed, 12 Oct 2022 16:07:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8D382572;
	Wed, 12 Oct 2022 16:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F8D382572
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7CC41BF5A9
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 16:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 934BF40574
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 16:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 934BF40574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAvdoiifEfGc for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 16:07:31 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E76B94057F
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id E76B94057F
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 16:07:30 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ie9iogmLcaWj1ie9ioxFC2; Wed, 12 Oct 2022 18:00:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 18:00:25 +0200
Message-Id: <20221012160025.45566-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLZzLYG+0CdWIcJHztLz38hrWYpdH9gsqohittPHk3zUiPs8eplYG29vAK8ECQWUSDYlQw0EumidJ0s8UYKy28VAnEYC3TbkEPfRMBSt83BUubLcyBai
 I+HtOyDE6mnaWbWwcQX3Pa3vrTV/jS5n6do0absQ9MRC4WiM37JgnoJ+w5kD7MW6kIAd1PDuITnizo/xwxvZcxqwDXFVlYSnwnXtf2GgBRkHYbGDzO2kiRne
 X9eWj7hGzmiSjA7V8C8l/2YfAWeXJ+gGZ0gVr7zMisTcLPGrEFZWMhM/IioyRznf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665590426; bh=tL7k+f0EeWt60t5/GOdh1S36WQuWSf2oQwGH6SxTEJ0=;
 h=From:To:Subject:Date:MIME-Version;
 b=F/nghnaqhG+9l5M81mDEMW2YJkCNfxAyGwvZ+I57j3XNUC3UuHSLojwgKn+9g0eyg
 Od8l89nq3GvxCCKg71lVzKNy1gCGe3t62VLcj11E9hCILY3EqDYkFAIBYX619B9Vl+
 6sWz3ocHFEo9r9+HelQ54+cfQsrYvXDFdqG99ZIgXFjPOd3RZ12z9wXytuCk0abcIw
 BrqJlEKlNvoJjLV6krcUE5HQmc1ZdhhpPLJPsJhZF27GWzXNXwq9gprEdfKs2yVCKu
 D0OuOHBDA6AkBtZpUWgEE+1Zf7RcfPuFy+wxOkelvppE75cFUrlSbnXDTY/SRvnstD
 qWBmh2TSgSgng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F/nghnaq
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump version
 to fix building with Linux 6.0.0
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index ac6587b27a..fd874f1f0a 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  64f15a8c7d383ac92230ef82711507a7f3a309462999f6694863fbbb4f12e0be  sunxi-mali-utgard-driver-c4cf7aabed25e0fd27159564caf588a37016870d.tar.gz
+sha256  4b66f20272c63ce8ea769bf1c95f9923ed6facabe0c14a8c7644b302b9f23b58  sunxi-mali-utgard-driver-73a80d550f2f181b5fc7fc2d859e15d077d845e4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 594a770e61..15d660e49d 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = c4cf7aabed25e0fd27159564caf588a37016870d
+SUNXI_MALI_UTGARD_DRIVER_VERSION = 73a80d550f2f181b5fc7fc2d859e15d077d845e4
 SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
