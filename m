Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1481DE92705
	for <buildroot@archiver.kernel.org>; Thu,  5 Oct 2023 14:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4943D4047B;
	Thu,  5 Oct 2023 14:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4943D4047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFuwzmQYTnL6; Thu,  5 Oct 2023 14:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89E5D40C27;
	Thu,  5 Oct 2023 14:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E5D40C27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8531BF3C9
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 14:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 578B640C27
 for <buildroot@lists.busybox.net>; Thu,  5 Oct 2023 14:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 578B640C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkmiUr0E5b3Q for <buildroot@lists.busybox.net>;
 Thu,  5 Oct 2023 14:43:03 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6600E4047B
 for <buildroot@buildroot.org>; Thu,  5 Oct 2023 14:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6600E4047B
Received: from desky.lan (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26D309C4;
 Thu,  5 Oct 2023 16:41:11 +0200 (CEST)
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: buildroot@buildroot.org
Date: Thu,  5 Oct 2023 17:42:50 +0300
Message-Id: <20231005144250.43169-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1696516871;
 bh=BgoKUnbX5CvY3LBYSKseVZHPaRC4mnGHOY8+QdAC9e4=;
 h=From:To:Cc:Subject:Date:From;
 b=dqyC8CD4welmPHbIu+hjQDB4jG5CKpJeWEUR1O1HPzA3VvYKLdbNWkTHuHwmjkDCV
 JW/GbuM2kanLzWwhUlIqDaiOES8E+xfoEQVxCnMv/+L4mPK+mIBIojjGw1ztfdv6A3
 /tlCIyOHoz713OT5+KJXaAJ/l0fCOmGph9GbGOj4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=dqyC8CD4
Subject: [Buildroot] [PATCH 1/1] package/rwmem: bumb to latest version
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumb rwmem to the latest version. The main reason to bumb is to get a
fix for a compilation issue present when compiling with gcc-13 (need to
include <cstdint>).

As the project has moved to C++20, we need to adjust the Config.in
accordingly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 package/rwmem/Config.in  | 6 +++---
 package/rwmem/rwmem.hash | 2 +-
 package/rwmem/rwmem.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
index cd9a7f78f1..690b034070 100644
--- a/package/rwmem/Config.in
+++ b/package/rwmem/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RWMEM
 	bool "rwmem"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
@@ -10,6 +10,6 @@ config BR2_PACKAGE_RWMEM
 
 	  https://github.com/tomba/rwmem
 
-comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 5"
+comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
index 9becbc5b21..da74002cb4 100644
--- a/package/rwmem/rwmem.hash
+++ b/package/rwmem/rwmem.hash
@@ -1,2 +1,2 @@
-sha256  55d28f029c0cd5c21d3e1c89371e2905d5217f571ef5389ed0fce163804d1c4a  rwmem-c8291705c82bb0686be9adf6a427a2b72114719a.tar.gz
+sha256  e6cb76b77869aef9ec4a2c31d0d80af0182a5f9c9c3ae06225c8fb2f8266379f  rwmem-c89bc9ad9a8f2359f358c510db57b7678eb156d1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
index 24c4e92efc..d6ef05193b 100644
--- a/package/rwmem/rwmem.mk
+++ b/package/rwmem/rwmem.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RWMEM_VERSION = c8291705c82bb0686be9adf6a427a2b72114719a
+RWMEM_VERSION = c89bc9ad9a8f2359f358c510db57b7678eb156d1
 RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
 RWMEM_LICENSE = GPL-2.0
 RWMEM_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
