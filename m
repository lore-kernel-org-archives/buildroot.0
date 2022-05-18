Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F97BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 01:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391DC83E2F;
	Wed, 18 May 2022 01:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heNUSIi1ij3J; Wed, 18 May 2022 01:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B8083E2B;
	Wed, 18 May 2022 01:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DE271BF429
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 365F983E2B
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mSbx4yu6daF6 for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 01:45:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B00B83E1C
 for <buildroot@buildroot.org>; Wed, 18 May 2022 01:45:57 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id s23so720675iog.13
 for <buildroot@buildroot.org>; Tue, 17 May 2022 18:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=619IY/Oj5Saf3uuBDXDwRi74k/54Sf0u2PGYz9p6ulY=;
 b=iveb7XN1A3VeJOLQBnOiB5knZy+//zHPGDfCsFWV/B0xzRYVxRXzf7SW2RJtWP2EI5
 nI8RVnW/E0kKhq//Y+AtjFJMUGD+kubsVimZ17C9pA4ywSCfnFlzTV7hi0XyoMGEPpM7
 icy35HU+SCU/5cEkYdTFb1Equx4L8kfPVpO7ke4uNfQyNmK2gzFprh/IK+Vf/fAq+KYt
 2HjTzov2Uj2WSjxvZodpeUZPFYOnrqY0yG5CM0PdqOPAfEDAvLSzQN14Q+NcquetyZ4U
 4mutCvUNyVWnxI1OPkjM7AnH9LP821KuqZCwcJLYCLhFRgC/HtjmZx93uqPcaA8Kjvpb
 U/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=619IY/Oj5Saf3uuBDXDwRi74k/54Sf0u2PGYz9p6ulY=;
 b=EOw6llbbIVcXa7p1YfLEnoIqdpFYnk5KwZqRZRg0xRTi7PA7dFDJC23ietr3bmsT/z
 g2ETKgAd+WWvpxzeqHrtQtyjUPs667UysX3XVQuitrUPI4DxoYk+YwbwZBH1ozUoegyi
 PQe8RlJuKmVckGSuzxAPl8ToA92bgGxxHfGvTSqk8xCNZ0OhMA+JjQ35IGzlFh5we5dE
 PVxbIinG4MSOFy2AVPf7rqie4+R8A9M9nhJclwVS/Z5qO5ZwaXW2ZQ8d9H51UwQq8bwj
 IxLO7hR8br7Ao8d8oBxtphKHmCTT3HsDeS8GKJ9bPTpTqZLzs4eQl5V2e+HKlQUE97nL
 YjoA==
X-Gm-Message-State: AOAM533zXkXrgTEDa46PGKwDsjqdeis5QMDwhB0vbRsAK4DUSWnG+2FM
 4q0Ns0h6C2UlgfoXegn7VJKLAvLsK3k=
X-Google-Smtp-Source: ABdhPJyocsWaNb3KulkgWUAR0KTnn8x/UbYSG4Ul5KbDTvp+OPI087SgvnHpkFkHKuInmjOz7mLQzQ==
X-Received: by 2002:a5d:9448:0:b0:657:24e0:c0b2 with SMTP id
 x8-20020a5d9448000000b0065724e0c0b2mr11444511ior.167.1652838356529; 
 Tue, 17 May 2022 18:45:56 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 o7-20020a056e02092700b002cde6e352cesm243917ilt.24.2022.05.17.18.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 18:45:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 19:45:53 -0600
Message-Id: <20220518014553.2558706-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireshark: drop !BR2_arc dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is no longer a qt dependency as of:
16ffc6549465cb5d68b751f10603e8b0363bf9b0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wireshark/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index fdeb9da259..cd92beb1d1 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -25,7 +25,6 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	depends on BR2_HOST_GCC_AT_LEAST_5 # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # qt5
-	depends on !BR2_arc # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
@@ -39,7 +38,6 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	  Enable Qt5 GUI
 
 comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, host gcc >= 5.0, gcc >= 5.0"
-	depends on !BR2_arc
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
