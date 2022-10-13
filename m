Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD0C4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 17:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693BD41D8E;
	Thu, 13 Oct 2022 17:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 693BD41D8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiS6akQGzvBe; Thu, 13 Oct 2022 17:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A86041D8A;
	Thu, 13 Oct 2022 17:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A86041D8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 480531BF3EC
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 17:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C45383F4E
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 17:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C45383F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NeTJy3OZskuK for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 17:31:41 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE8B583F4D
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE8B583F4D
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 17:31:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j1whoRbpalrBMj1wioVB2T; Thu, 13 Oct 2022 19:24:36 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 13 Oct 2022 19:24:33 +0200
Message-Id: <20221013172433.100738-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHqDN6LbGYEs2SUmQFHbpMJR7tHu++XKUIX3ozYczsF7lqmKv1Uudin10GbnLQ0GDvmSbZ3BFBRGpDPZZtJg3nCiU+1AYei9qSP4B3VOsnuw/+06hfCK
 gor7GXjrGCx5FovxXLZQeganCYUJAHwn+m08zce2RK6wBqgUkuuIrquadWokP6YTagWlaAY3eEh8qakz60afiJTo+DRgjAvcjKIkhD8zpdxmxCTuX2+7hZJ2
 uuw+Xn1t9jy4QXcEeLn0rMffmwgzXnT3edAFxwIrbhRrIFMK4MtYpM88xfhljoI3v1FysVKKSnLAx5Pg+KHngQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665681876; bh=GWA2WatBD/WPWHwe2INazu7YsmKohe0h8ohD/PCtc4Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=M91gEToDH1g3d8frzFY+sFUEhKjJnsAH582bdR9nzpLefYH1CFpaOqvzLD7AMaVfa
 Gi6ZgVAWDzTQ3BY9nrO0XAAYuTV1TrdrloUupl5CwUzrk3CkT5G5k9QyHOipTGoWkC
 vOWxmoyWJ6NOIyBDlr9P8GAo5cPWw6s2VPst2LoOEfw6gAmkXHA6eEakNp2zkESNwP
 MopSaC1rHxBYXCPagC19UMVmUO3b7/b4G2IA4KEo4+mb9b4OLmXW/kdIlEkBprw3jM
 fa6mcjrQZycsEGnjdWb09ASoxG94VgwHmlJcURMYh1/tOL+EZbvtPt8trHieWWYoL0
 aXJm39ZvKlCnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=M91gEToD
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.84
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 026344668f..2b34cc1a77 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_83_RTM/src/SHA256SUMS
-sha256  ab23ea67f964090b8b73c80a674082571c36e5f4eba92057ac648c9c1def0128  nss-3.83.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_84_RTM/src/SHA256SUMS
+sha256  9a387ffe350ff14f001d943f96cc0c064891551d71e1a97a5ddbffe7f1207a25  nss-3.84.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1099ae199c..041b2cfc56 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.83
+LIBNSS_VERSION = 3.84
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
