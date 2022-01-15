Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E82C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18214035A;
	Sat, 15 Jan 2022 11:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQbgDw0KHRvy; Sat, 15 Jan 2022 11:18:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4961C40342;
	Sat, 15 Jan 2022 11:18:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5921BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CDEB81AF4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id akVaaB2_tLED for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:17:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73D0681AF3
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:17:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so9686508wmb.1
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 03:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XwRVS1IuUG412nTQcjYEXgSJGcj8uKclR2AafOBIwrA=;
 b=Y/LjcJdCJI749UBAURA4j+x87qsiIg0gecUQWOgHvPfLmtb/cFBo10eByxGyxm6P6x
 c7e5+nuZlqdq9HBImiOg31p/aU/wpp0yNRoZgn1GCpOETV/tPvp5gwO8YX7d0f2MeiIz
 Nd7qDx5fOCgIPHNCnLp51bi8p17aDFQcskoBodB2NvaFoxNC7R+fcjpUeEeZrC5SpQD5
 ziKqnveeY7VGUf4/2v+IyN4vYQmL8VEUjAjqV0k4WRuTkxmQ7GLcbW9bE7Yzr8BByLqL
 UJUubL8o5KVnqbNN08JDyIkxevhHhYdZ1qCWT9u2MH7dwJDGr5fkh/KovG8s8cCEjb9j
 YWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XwRVS1IuUG412nTQcjYEXgSJGcj8uKclR2AafOBIwrA=;
 b=TmM0mcNdCvjHjenbiwY4fdQR8p5ajLojZwbHi3RdLlRsl8a27E9DAXWVcnJm0acMq4
 ahVf2kj9K4AyzjH5ovk+lWyxITX991zjxpf+iCtt1tt45BqbM8tQWFw0S4s3q6N7SpBW
 idcUkPagsJ4urCZyl+dXYiiOrtNZk70Lc03GhmOBSlhAfFvcRs+bvmeoarS4MXvpfmlA
 /5ZEIcJeNhwuVSzN+Zp1OPSxctKmjDT1Wpz29Ukce8vuuFE6/x3/78wRHYrbVjrCvoEf
 rzG2BJCY7kF4vJn70dBn7l1q5rxWnF54Ue/hJMlCHi1oE+jRXvO4flTG3ttCH39CX/Yd
 IVTg==
X-Gm-Message-State: AOAM530uEaquhyzxk11p1JBauiVvVhXsS4uV1RlWp8ODztWEz1bOtHxz
 8Up59oh5pkUlOB2E6BvkiRsuNrf0iXk=
X-Google-Smtp-Source: ABdhPJzM4FJh5p3eYvaxv9tzmtMssEThEfmmvBmpPRdO1GsBKpo/kCtce3Qcf0phsQhbuEkuqOpktw==
X-Received: by 2002:adf:e992:: with SMTP id h18mr11622387wrm.612.1642245474819; 
 Sat, 15 Jan 2022 03:17:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id f9sm9478723wry.115.2022.01.15.03.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 03:17:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:16:22 +0100
Message-Id: <20220115111622.1910388-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/php-apcu: fix build without
 __sync_*_4 intrinsics
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 8ddeeffa186d8bce875ac713c1e71483c618842a:

configure: error: Compiler does not support atomics

--enable-apcu-rwlocks can't be used until
https://github.com/krakjoe/apcu/pull/430 is merged (and autoreconf does
not work either)

Fixes:
 - http://autobuild.buildroot.org/results/efa/efa3b4406f87a1e9521b66f392a6fa19ac01f0cd/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-apcu/php-apcu.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php-apcu/php-apcu.mk b/package/php-apcu/php-apcu.mk
index ce59611d8f..3ac062e772 100644
--- a/package/php-apcu/php-apcu.mk
+++ b/package/php-apcu/php-apcu.mk
@@ -22,4 +22,8 @@ define PHP_APCU_PHPIZE
 endef
 PHP_APCU_PRE_CONFIGURE_HOOKS += PHP_APCU_PHPIZE
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),)
+PHP_APCU_CONF_OPTS += --disable-apcu-rwlocks
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
