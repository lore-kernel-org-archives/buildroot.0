Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438EAC001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 11:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3DD140AA1;
	Sun, 23 Jul 2023 11:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3DD140AA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rG3dhvOydaHj; Sun, 23 Jul 2023 11:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB41B40A96;
	Sun, 23 Jul 2023 11:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB41B40A96
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEEE11BF3B9
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 11:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C63B7409AC
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 11:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63B7409AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3SDqE74Kh0T for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 11:30:47 +0000 (UTC)
X-Greylist: delayed 601 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 23 Jul 2023 11:30:46 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9EED40988
Received: from cvsmtppost07.nm.naver.com (cvsmtppost07.nm.naver.com
 [114.111.35.154])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9EED40988
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 11:30:46 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo025.nm ([10.112.18.59])
 by cvsmtppost07.nm.naver.com with ESMTP id JDy39asNT+WKxYkAnIeucQ
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 11:20:43 -0000
X-Session-ID: 4iKb2ElNSRO3oMAQmbPaew
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: XdnXKAglFoJZ+HmZFA2/+6E=
Received: from linux.. ([125.132.232.68])
 by cvnsmtp010.nm.naver.com with ESMTP id 4iKb2ElNSRO3oMAQmbPaew
 for <multiple recipients>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 23 Jul 2023 11:20:42 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 20:20:22 +0900
Message-Id: <20230723112022.15074-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1690111243; bh=unA8eHArkCu5VX9zBgu+b77nJl/6q5guxPx2sZ3iTds=;
 h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
 X-Works-Security;
 b=AUUaDnDqkr9L2C+5jaeIullbiUav2tq7r6aG/mlV+M98HJFxEpvvUBVRL+rPR4ZvA
 iMKBjxPNYm5e7PbZxz4YXWKFEwTL8nn8eIAdac8iUIgs4NOqwDdqtoMZEOJNOj5xVK
 DTV1bbyIwx9PL14hGzOhJ/UHuPleVC5fnYpEsQDnu49b37jhTGuyQ3QHpgOdWV0mKh
 WO/HR/Inbe9nKYsaaT1y4k/+smfaTOtzSTR6Y7xTHrlCsSynnGtqCRTmuhBiytTo17
 jue2NL8fKMp0YAaZp1kSijgKcoFYPUAA61voRMGmiroH3sHtWEIfqPygzTSZUuCBPy
 HQia4Rcvrk4tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com
 header.a=rsa-sha256 header.s=s20171208 header.b=AUUaDnDq
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.x86: add MMX instruction set
 capability for Geode CPU
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
Cc: Cherniaev Andrei <dungeonlords789@naver.com>, bagasdotme@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, there is no MMX support for modern GEODE processors in Buildroot.
Yet, some packages like ffmpeg can leverage it when the package is built.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 arch/Config.in.x86 | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index c770ae3ffe..288d274b0e 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -521,11 +521,24 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_geode
-	bool "geode"
-	# Don't include MMX support because there several variant of geode
-	# processor, some with MMX support, some without.
-	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
+	bool "geode (no mmx)"
+	help
+	  For several variant of geode which have not MMX support.
+	  See
+	  https://en.wikipedia.org/wiki/Geode_%28processor%29 to
+	  determine if your particular Geode processor supports MMX or
+	  not.
+	depends on !BR2_x86_64
+config BR2_x86_geode_mmx
+	bool "geode (with mmx)"
+	help
+	  For several variant of geode which have MMX support.
+	  See
+	  https://en.wikipedia.org/wiki/Geode_%28processor%29 to
+	  determine if your particular Geode processor supports MMX or
+	  not.
 	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
