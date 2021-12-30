Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0CFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2680410B7;
	Thu, 30 Dec 2021 14:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqWVRRRw03Mp; Thu, 30 Dec 2021 14:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350ED4025A;
	Thu, 30 Dec 2021 14:49:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6531F1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61EF54025A
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpxT-IfsZ7te for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:49:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A976840255
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:49:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s1so50980067wrg.1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nkale2VYCPz1QVlwtLkdtxY0xOENYgAOoHphvnVezXM=;
 b=Oqg7n2DmtebFcqohUw87qe+gi8J7ElOyzpuobU7erxe95Sz9Xi6mkAosDNOS8oPo1q
 6jcJtZo+GGlJdSr2en2D2yHt7p0PExy1Ex5ydNOLhLTE40N8uOZ6VKL7w53rQisJtdWG
 xVNLo5zgSDu9t1QEpZkEyyxQWArj5lEj1491aZWmPu8ATAadBOth2IHcTRA+7+asrkBm
 lFe1XAxMK1hkprOH5/DEXCl4WBotOdVh1gzRNA72bxJB7Nxvd7mvsjPOiX8FTvxZK0yB
 cq4+MxRUt1+Z7XRZDQcLL8nj4EbpF4+nOk35brjSaEBO1HIX81k4wqPTWfnYy4NuDsOA
 YaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nkale2VYCPz1QVlwtLkdtxY0xOENYgAOoHphvnVezXM=;
 b=i4K/koK3v9jsjgHFOcDmJdwvS4zV+/ZgaUx9ePyigNhsd3ydop0foOPNSE9JkTXZgx
 D8aOFRjTCykpBXp+y0whTfRcY4yzmRs98CDCtu1MB9hStbLDmqBZZLklcZiY4Ijup5lc
 6hkXoOrmxciSJsZR7VRNFhgDn/V3XMH19oVXRdFOTkkDBRn/N1zPB8qVZ79F7C3GcSah
 Jmy1ejf3GrrHLbUkfXV3+FagDzkFPaxVeYLHGrfAn8/KPu8TheC9C5DJ7Xoue5bHoFxM
 E0cxmBkECskUatx8RJBLWm+ffBCexhuoXXEt6FoWlpI7gG3bagNVCo+i2uQmYYa2rWmH
 L4nw==
X-Gm-Message-State: AOAM532KXOQ/nRZYxgtWeG8c3tsQAslob9dhYnc+L11+XhkPOLWXQAG+
 3wNpHIs9GyrasgohI1wglHHNtATeWGY=
X-Google-Smtp-Source: ABdhPJyB8VucG5Kmzu1EwaoDV/1ksog1qLVJSYlkjjVscDvKkOlkzLlvkYtFMUQOh+e9VhQi+3phTA==
X-Received: by 2002:adf:f904:: with SMTP id b4mr6622637wrr.457.1640875755036; 
 Thu, 30 Dec 2021 06:49:15 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id f13sm24041585wri.51.2021.12.30.06.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 06:49:14 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 15:49:11 +0100
Message-Id: <20211230144911.2258576-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/supertuxkart: fix kconfig dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4ac4d6879b30bc267af1f1b382d9ac93f5aa1c28 (package/supertuxkart: bump to version 1.3)
introduced a circular dependency chain in Kconfig:

package/openssl/Config.in:4:error: recursive dependency detected!
package/openssl/Config.in:4:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_MBEDTLS
package/mbedtls/Config.in:1:	symbol BR2_PACKAGE_MBEDTLS is selected by BR2_PACKAGE_OPENSSL

Fix by selecting openssl if mbedtls is not enabled.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/supertuxkart/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index de6333dae3..bfd4f4cbc9 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSQUISH
 	select BR2_PACKAGE_LIBVORBIS
-	select BR2_PACKAGE_MBEDTLS if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_XLIB_LIBXRANDR
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
