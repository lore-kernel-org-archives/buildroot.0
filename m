Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5025C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 15:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D78941AE3;
	Thu, 26 Oct 2023 15:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D78941AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPClBpNYQM4u; Thu, 26 Oct 2023 15:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60AB241AD8;
	Thu, 26 Oct 2023 15:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60AB241AD8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E08481BF3BC
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 15:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB12383E78
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 15:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB12383E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfdvP7dZn1qL for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 15:57:59 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9456E83E77
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 15:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9456E83E77
Received: from localhost.localdomain ([146.241.115.208])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w2k7q6wtqpgXYw2k7qPxcS; Thu, 26 Oct 2023 17:57:55 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 17:57:54 +0200
Message-Id: <20231026155754.1637976-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJjwmWl0x4feSK4CotCw7T6Y/NuD9wzMwzsaokqHMBgv2FkRXfo0CDRRDPUXzJVXuuuvUXwgCEkS/Qzp7IT1EH+YLFFIRD2RqRDogmsDIqNG4M9uFPHI
 LqjK8pTe9n2hwvkG7dcZqZmZ2rbTPXI9xrR2h16olSTf4bRm7gfCu1uUlBgkPxL8SU/7cZOms4qmHJ2rA43R3LU2ihpVGPL47xwtpQsuZK3d3aw0I218C11/
 dIt3xQCkD9ccBRot6JYSMyiaykd9D4806EcsBDt9svh6OZmC+wh4wxDwC8Rm3mam
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698335875; bh=hdjASL3I8wWLRy/8JlDBw5XrXsa9/psk78xLQkdG4NU=;
 h=From:To:Subject:Date:MIME-Version;
 b=J4z12+jPj7vFgGdWl5qM7ib0WObVJrFssSiSFDFcZYktE3j96Sm2GM/aILGusnU8p
 0gCfUemlJoL2DRRl5P0vOBi1VWt/GHVbkE2wcUJHLdwpn6yKC21v2MX4qRSByOszqA
 7QCbc/ygSZL5q99r8Iq5CrW5qvANcGdwslcOyPHop9XKcjQUQlYzCMOs5yLAS/HG+y
 hqimR7tvehpLJpjCGslFjdRwpQ4wy0IarS5lxOm6bTNWbEpFl+WfsnUjviXi2beCLB
 w0u7aATPeQGRvklGwCxvTy8WSrTxkLN2RBMOQewnU1U5IJFliVd4k+WHIwqB0L+2Yz
 F/s7VNAOjKqYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=J4z12+jP
Subject: [Buildroot] [PATCH] package/libnvme: needs host-swig
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

Fixes:
http://autobuild.buildroot.net/results/a63d18fd318783d7e3d1cede062c9c7cacb10282/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index 38394b9931..3b622839fa 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -10,6 +10,8 @@ LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
 LIBNVME_INSTALL_STAGING = YES
 
+LIBNVME_DEPENDENCIES += host-swig
+
 LIBNVME_CONF_OPTS += \
 	-Dtests=false
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
