Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5BFCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 05:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9302B61190;
	Mon, 18 Sep 2023 05:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9302B61190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YRM9fko6efU; Mon, 18 Sep 2023 05:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B9861192;
	Mon, 18 Sep 2023 05:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B9861192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49C911BF40E
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 05:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22C3981772
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 05:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C3981772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XH0KxlEA6EFk for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 05:25:04 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78C0781759
 for <buildroot@busybox.net>; Mon, 18 Sep 2023 05:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C0781759
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 56AB44403F6;
 Mon, 18 Sep 2023 08:24:51 +0300 (IDT)
To: buildroot@busybox.net
Date: Mon, 18 Sep 2023 08:24:55 +0300
Message-Id: <def97b614d83760ccdff6da585222e9c3be3d476.1695014695.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1695014691;
 bh=TY4jAyt415xVzUjrFiSIlsOdv5BKYwvLOW524PHtDjs=;
 h=From:To:Cc:Subject:Date:From;
 b=AatY9s40SdlyEo/mKmOWRu8+YGJgb1+pRDUX6W+NavHCcDMI/PQmWZGTPxohNuodX
 04E8dVMPnJDxCAYk+OiD4FYpYDMR0uGUK6H68nnyycF05BnSDDOXFBN+/lOMaa/dGy
 4bY1G1TtaZdC2880iB5UC8fy2KJLYxrLNfGsfHS0ptPRW8pJfWWn+mfhWE6fw9L+Lz
 0NXgWCfySTys2Fd2f3vGnKnYUWAjrdMOCKuDElunco0jxIcjIhjLJtts4mvcIDwEsu
 FO84Dw8Do2NWpyW398seenKBjHZ5JfvMmDKdu60rY7s0EQrAvQ9FUQtClPY4SThykf
 YWDInvUTufG9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=AatY9s40
Subject: [Buildroot] [PATCH] package/libraw: fix IGNORE_CVES assignment
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit bc4110b0739 ("package/libraw: fix CVE-2023-1729") mistakenly
added the patch name to IGNORE_CVES instead of the CVE reference. Fix
that.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libraw/libraw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index cbd509cfea8c..63b50e340da9 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -19,7 +19,7 @@ LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
 # 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
-LIBRAW_IGNORE_CVES += 0001-do-not-set-shrink-flag-for-3-4-component-images.patch
+LIBRAW_IGNORE_CVES += CVE-2023-1729
 
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
