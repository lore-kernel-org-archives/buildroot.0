Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1FDEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6964041E75;
	Tue, 11 Jul 2023 21:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6964041E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9dEOVvpvYsc; Tue, 11 Jul 2023 21:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654C941E69;
	Tue, 11 Jul 2023 21:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654C941E69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2353F1BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F07E983843
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F07E983843
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2fEzgH1zOvZ for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:31:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53DA38361C
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53DA38361C
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:31:28 +0000 (UTC)
Received: from localhost.localdomain ([146.241.40.132])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JKxCq5TafLSVYJKxCqiIYf; Tue, 11 Jul 2023 23:31:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:31:25 +0200
Message-Id: <20230711213125.3587872-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711213125.3587872-1-giulio.benetti@benettiengineering.com>
References: <20230711213125.3587872-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOVAQ0Op+cVtKlYsAOGXN5pLVzXpdee/RuXLmwvfnlGTte8GUYUcFBEczBdL9BD9nJh9IvQRT58DNtgpER57lnM1xpTVg9RDYwx25hjc4YQlUOoV3Lp8
 qw/I8YL0Jb5Q0YEcFw58nMwZiwoCfjqvKPmne9t/1DHELPGIX5L+xQKJphWkkQBpCPxSA7PMzPiB3TqfVG6U7EbtjAld/++B9DLFnB8ygGyQEotPRu0tHOli
 gvQGfFaoYWS7uL4cj5VyfYPgon8V3wmoiPvoYsxwBSZoOdVYO2ow1q2huRAqcWkL/agbVbI8D/xkybNAqAPzDm+SlHWg7DErwPhicTeR7YjuSUewHiNPHadZ
 B5cpGmtb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689111087; bh=wpPdk3oTUdKKhRZBjVbIvxldV8bkeVJRuh1za/IQMmI=;
 h=From:To:Subject:Date:MIME-Version;
 b=UZHOAtPPnN0uSj27NWMLhgl755MYnrSYtM3X4XNtE/QXV2KxxUJY9BrQYqsE3thyY
 ddtdfnoY5969dAEaVmp2BVb0Dd/+HwGmaCJUCRPp1Ao+EhUM1IHSWPBhfTnX7Ih4cH
 SKuaFn/IAiUb5VVsVc/by0rOPoj9pwcB7QjtHJaS/h6Fx34mMcuMVH77XcHKYGZMcY
 bZaQvYzyK6MX5Fg9X3WLeG15Vrs1Vj9ODfBw6ibZxAPbYl+mfUyC3jKxvxYYRcSAML
 4ssC5K9WKkJQ/8YPlXZAdSfHoYeR9nXZs2b3a+X72PdoM94TLtQ7FS43kY7RLQ40BV
 4Cu6PAe1eKj5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UZHOAtPP
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump version to 2023-07-08
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version fixes a wrong patching for Linux 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 95a031b6f2..377812fba8 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d8aad48b8d124a313e5b8182c5dba2b94ecdbac2a9f1861a50c081b9034a543  rtl8189fs-c223a25b1000d64432eca4201a8f012414dfc7ce.tar.gz
+sha256  9ff7aa9ee8cd7a8f386531d3b009e7bcbce1ff71bb676c187c40e538755eb8b5  rtl8189fs-75a566a830037c7d1309c5a9fe411562772a1cf2.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 6b0585073b..c3eef6e071 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = c223a25b1000d64432eca4201a8f012414dfc7ce
+RTL8189FS_VERSION = 75a566a830037c7d1309c5a9fe411562772a1cf2
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
