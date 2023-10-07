Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7523E95A61
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 10:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3400440AA4;
	Sat,  7 Oct 2023 10:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3400440AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovts6gHiPEdr; Sat,  7 Oct 2023 10:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ABF040A2E;
	Sat,  7 Oct 2023 10:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ABF040A2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAFC21BF419
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDC6A60F67
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 10:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC6A60F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAUakg0mC0xK for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 10:25:04 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 327A360F2F
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 10:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 327A360F2F
Received: from fli4l.lan.fli4l (p54a1bb33.dip0.t-ipconnect.de [84.161.187.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5A2CA4C0A40;
 Sat,  7 Oct 2023 12:25:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32876)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qp4UW-0000iY-1r;
 Sat, 07 Oct 2023 12:25:00 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 12:25:00 +0200
Message-Id: <20231007102500.1293134-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696674300;
 bh=aBpjpIaCU1GWrt+je28/e2H7rGwHndXzZYJlf7nyof4=;
 h=From:To:Cc:Subject:Date:From;
 b=fXtTWn2+nq1fOrMYntyeGBTQJgsgBwLvWqa5Zi3nIoM9sB08dGtOZO7q2sEhbIdkW
 gTtdQEZBM2vjp+vEw/r9kG8QJOxjXf7keZXac2Ty0SAPqlGirY3T3GNi43NFEHKVDw
 hEtBtK9iuRta7q7/OQvw0MGrG+tVsDGI3IAdCsBFq3k2oe5ONT0Rshgyjnro+F6uOn
 4A/jPd8OIw8olABJz60cbSyFNZiimSR9+qqWXHVW+hqZQWBDsU77iVYae6npRY1bBV
 TSVPZjjo8OKOQ7u022a1+Sku9HUjTQt9XrpXqLBHX80D8Vgvxp5NcUKo8WAYLNBgUV
 IJ9SgpcOYYzWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fXtTWn2+
Subject: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.11.5
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.5.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index f3650c5ec5..cad19f930f 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.4.sha256sum
-sha256  737e1d7f8ab3f139729ca13a2494fd17bf30ddb4b7a427cf336252cab57f57f7  libxml2-2.11.4.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.5.sha256sum
+sha256  3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6  libxml2-2.11.5.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 672a2cb0f0..fb7767297b 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.11
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).5
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
