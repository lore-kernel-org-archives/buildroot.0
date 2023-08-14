Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC786C04A6A
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 11:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F8341722;
	Mon, 14 Aug 2023 11:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F8341722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EX8JS4XXarr; Mon, 14 Aug 2023 11:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC4641735;
	Mon, 14 Aug 2023 11:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDC4641735
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0D51BF951
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 235464096E
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 235464096E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmhnnmIB0v1h for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 11:44:19 +0000 (UTC)
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4102408C9
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 11:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4102408C9
Received: from localhost (80.red-83-50-209.dynamicip.rima-tde.net
 [83.50.209.80]) by iodev.co.uk (Postfix) with ESMTPSA id 83E3D208882;
 Mon, 14 Aug 2023 13:34:26 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 13:34:16 +0200
Message-ID: <20230814113416.27631-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spam: Yes
Subject: [Buildroot] [PATCH] mawk 1.3.4-20230808
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
Cc: Ismael Luceno <ismael@iodev.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/mawk/mawk.hash | 2 +-
 package/mawk/mawk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
index 69761f77df57..0a31675ac8e9 100644
--- a/package/mawk/mawk.hash
+++ b/package/mawk/mawk.hash
@@ -1,2 +1,2 @@
-sha256  7fd4cd1e1fae9290fe089171181bbc6291dfd9bca939ca804f0ddb851c8b8237  mawk-1.3.4-20200120.tgz
+sha256  88f55a632e2736ff5c5f69944abc151734d89d8298d5005921180f39ab7ba6d0  mawk-1.3.4-20230808.tgz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index c4a486215d5d..d747f887ce39 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAWK_VERSION = 1.3.4-20200120
+MAWK_VERSION = 1.3.4-20230808
 MAWK_SITE = https://invisible-mirror.net/archives/mawk
 MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
