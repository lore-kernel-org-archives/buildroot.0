Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15876EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 18:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B421D4015E;
	Tue, 18 Jul 2023 18:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B421D4015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VI0ncKldq_T; Tue, 18 Jul 2023 18:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 586304010C;
	Tue, 18 Jul 2023 18:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 586304010C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1004D1BF333
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC5E405A0
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC5E405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9hcxRcOYwM1 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 18:33:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4381414B7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4381414B7
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 18:33:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0DC3A4C0FE1;
 Tue, 18 Jul 2023 20:32:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42438)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLpV0-0004TJ-1l;
 Tue, 18 Jul 2023 20:32:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 20:32:35 +0200
Message-Id: <20230718183238.688311-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689705158;
 bh=yb5Peyg+qTBrmVJDEPBUTKqbLGSLgwscz5vWvISJvjY=;
 h=From:To:Cc:Subject:Date:From;
 b=gqrfVR4WbxzCF4RwPEbhwtO2eCdYcU7UkCm6cpoUUyvAFYOOt55UXwfos0w2bMyb0
 21vJA6IJaSbt3f33PpkdrKIQKUoAtuF9kQ2lrql7GCZgZTbYRVXURM8HwWu88MFR+a
 xje3BUU70kTyweKEf2/tPqpVMEFyaDgiclzjpVL7fKMTGDyMl3ApeG+Csbl5Fn4g5L
 sQCcqjkrwLKzuhS3hh7fh+bhQrUM95Jgr1AJ26rJSebyqi/9DyjwaPlwkIVuUcuIww
 fECm9S1eDGJ818chGagYfllWtZiNpv7BGeChThiW8rZ6QrZf1tlHl/9k5SZQMyevyR
 /dqyALemDFcNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gqrfVR4W
Subject: [Buildroot] [PATCH v2 1/4] package/libwpe: bump version to 1.15.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed md5 hash.

Release notes:
1.14.1
- https://lists.webkit.org/pipermail/webkit-wpe/2023-February/000574.html
1.15.1
- https://lists.webkit.org/pipermail/webkit-wpe/2023-May/000595.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/libwpe/libwpe.hash | 7 +++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 28b7685b93..226b4f3295 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,6 @@
-# From https://wpewebkit.org/releases/libwpe-1.14.0.tar.xz.sums
-md5  f9737912975f979f9e4e01eec174a271  libwpe-1.14.0.tar.xz
-sha1  7a5d51c99254fc14ffcbcca9e8550cc7940fe871  libwpe-1.14.0.tar.xz
-sha256  c073305bbac5f4402cc1c8a4753bfa3d63a408901f86182051eaa5a75dd89c00  libwpe-1.14.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.15.1.tar.xz.sums
+sha1  0082ceb475175bfecd1172f2c0b292824d31561b  libwpe-1.15.1.tar.xz
+sha256  14d36a93a05ab7ada9bec581720b8057336fe681bbbe59bda7d50cb8f3eba3a6  libwpe-1.15.1.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index e7b3ce9eaf..f8c6b0fc76 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.14.0
+LIBWPE_VERSION = 1.15.1
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
