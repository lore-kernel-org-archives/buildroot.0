Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62801C5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE16A4188E;
	Wed,  6 Mar 2024 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhWL_JsbAQKU; Wed,  6 Mar 2024 21:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05510418F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05510418F5;
	Wed,  6 Mar 2024 21:36:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E02D1BF95F
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38BF08125D
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJaQAnf-VBWy for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDF8380FB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF8380FB3
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDF8380FB3
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvor90Rm; Wed, 06 Mar 2024 22:36:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:36:00 +0100
Message-Id: <20240306213606.2149683-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI8iPsfuUPb8XObtzfkFMbAGHNhaEKUfjsn+iPFST2kCxJvuJyf7Pd+7aZCuzuI6RWszdZX94cO5Qi8DjftE8D3UNGy620ZoIZ8e2j2cVfRXAyI3I5i3
 bG0c07xYQtgoS+s014i9XmorybQKEDj33yByhKhtPcHY5xZXejKvT5FDRBBSzxN2jU3+9ILsc5bjbzvB4qNV4rw/ZDbheydjE95cyxyvSqrOjBr6cPGL/KJU
 XKHDOYVbN8/88dCYEFNPOaV3WMFsVqQjkMstsCW94Gx23WjTdnD+QQzZl5y/F1bozNZO/VhDqNNbsWBaXV1CkEkhQyBTqK59Spkonj6DE5dV2t+tslhyYWGG
 Kc3uglese84Kf8zSHzN7iWz+Y2/hb7KSltdeVNs9yLTDV0misq0DTp0a1gVNsZv+B5csg9qE/s/qcjRjC0J0FJcHLeukVAJecFsrzLmP+vRPUvp/W9DL30F+
 6KGWZx3m5uMbJpkMF9FppY3fzgwjia9XhgKlEihrxLm+5bzTF4NVJ7Jwx2b3rr32Ulw3COVMQTdXfLRIuQSPuVrR4nUH0JC0BUUewxCp4DX0Nq6jdQuDagqw
 sC0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709760968; bh=SZUxqA2xSinwZnCJEWlfSbpEOySiSFZ9SdDw6BURxRE=;
 h=From:To:Subject:Date:MIME-Version;
 b=oFkU29Ohe24j9xqgfXVkQW70aXhwLZnKDRdUreG3ENfIfN5xQQ8HhNEe1jHA7+SiC
 iNC1MJ4OVBw7HB44kxCukL5/pdyQfl6cTYGEkIpj+9tK1ENUMFgMSvB2HGBYpIxtCr
 T8KKVF+gXH3ujxaR3BKWifIcTIjhfCBuLZfMk6ir6Vp55/wXfDN9uAhAxwN8yx0KM1
 +eXuDlgZddj9s/L52zpKKkWU78zEMYfXpsYo00xVznwPm+lxsVLxP1pwaAy9oiA6Az
 k2yaQOfqnJFwizN1mEUVFQJegpCyz13NU2co/yuEL/Iqjp7O9l/SVbjfN5EyvvnKjP
 t0X9bMNPAv/Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=oFkU29Oh
Subject: [Buildroot] [PATCH v3 3/9] package/gdal: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gdal/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 24a1f06af2..839a1bd7ea 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GDAL
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_GIFLIB
@@ -26,9 +25,8 @@ config BR2_PACKAGE_GDAL
 
 	  https://gdal.org/
 
-comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
