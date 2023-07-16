Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A0EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BCD740461;
	Sun, 16 Jul 2023 09:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BCD740461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4jYisad4pInB; Sun, 16 Jul 2023 09:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C8554042D;
	Sun, 16 Jul 2023 09:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8554042D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C07131BF33E
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5A294098D
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A294098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6wRE0vIHRpK for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:41:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6132E40988
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6132E40988
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:41:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D8F1A4C0354;
 Sun, 16 Jul 2023 11:41:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52154)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKyGG-0001tw-0X;
 Sun, 16 Jul 2023 11:41:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 11:41:51 +0200
Message-Id: <20230716094152.3773711-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230716094152.3773711-1-bernd@kuhls.net>
References: <20230716094152.3773711-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689500512;
 bh=Bzn14g895EWWW2NJF6tdsXOPe9YVtaBtApz1nF1VjNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kHIcyZqAAWh5rKJYDyKr67cCGnIT3Dv/tRfYXnG8TwuWbSWwCI7QZVBQbdx4lH/Pf
 yPHgp6uIDkumwCXhmBMNld3fv9JetoCVWHrYzFtdGnWXOlLRRlqhZ7x1BlUpyGhe+h
 Xt7DKfms9oaB9+zV/p43ZAKNT6OS3PoLQVWQeU8TO7Br/EWFVM1Z7EA7GIpQsY2b/h
 f/MmUkVHgNUtZsikNkIa33457Evw8aobVI0eb+0DCxv/Hp46hO/6BjpQlDR5PaJAAe
 CI97gJFHODujh6snirQcoj9DqgGVT3tjoep2su0Ik9yrZUvdPXp5yyopSKrplNU+WL
 SFDAfMgLZXy0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=kHIcyZqA
Subject: [Buildroot] [PATCH 2/3] package/wpebackend-fdo: bump version to
 1.14.2
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
https://lists.webkit.org/pipermail/webkit-wpe/2023-March/000590.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 7 +++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index d1a344a664..26ba121727 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,6 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.1.tar.xz.sums
-md5  2b49218cdd16075b028bbaf5a4f57890  wpebackend-fdo-1.14.1.tar.xz
-sha1  a68db2480d29d53d7fa24c69888bacbab6efea11  wpebackend-fdo-1.14.1.tar.xz
-sha256  01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50  wpebackend-fdo-1.14.1.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.2.tar.xz.sums
+sha1  f453f8d77e93f4ac6ac81c1874d4d6bdcb45c253  wpebackend-fdo-1.14.2.tar.xz
+sha256  93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38  wpebackend-fdo-1.14.2.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index c1e4e05796..7ef347b622 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.1
+WPEBACKEND_FDO_VERSION = 1.14.2
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
