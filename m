Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA261C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:31:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A7A16102A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A7A16102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D693240463;
	Tue, 17 Aug 2021 21:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAb_Oin9Btwa; Tue, 17 Aug 2021 21:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207B14049A;
	Tue, 17 Aug 2021 21:31:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15A2E1BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04BCC80D13
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJI_TNtJjzeU for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:31:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F61880CBA
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:31:15 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.10.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G6fxm5yQlxC2nG6fym1JHg; Tue, 17 Aug 2021 23:31:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629235875; bh=BhHg8hL95bpYkohzLdXq1o2sSJ13Q16npU0dKyPIXM0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Xytva0zGphbbVVORQILbWzyc0sSNeqkILB9EB77sDg81e8nl3DoCkjJym6Mb/uNOq
 sDGVOOveuPCZk+gK/HY6QwsT1Cytsolrq5/qKwP+I5h4M2xmwefM2c73Ja+gwYE0Yq
 +I8G/MJz5IzLlzmDKdWtCRZepatlM00P6uB92020Qo8vK9B6vOCH0DpEjgSEnKaJw9
 GHVQWeb5QbmhP61Ew5BMQZs2g14iOZf6Z6e+Iy+P+GSJh3LP+rpDJ1MmhezkJR1GBC
 LpwT1N075eYyChLNSS0JPm2LZHiSenkjvjs2Mej5f/UdaHqlR2rD4adAW0ak0vr0kn
 KrrA7yuWCBBUw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 23:31:12 +0200
Message-Id: <20210817213112.302830-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817213112.302830-1-giulio.benetti@benettiengineering.com>
References: <20210817213112.302830-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJXamEIzsUEIua4yIaoUqH6Z8p+6RM85X/ID+E9Bmh2fs5oXF987rCcuv9iiUmn/W6IQm0CWoCzIAp1ICgdO3M5l6WcU8okKSs9rsYO5zil7ixoMUHC2
 6P1CB84RiSek0DxUH1MiaDuiKH1sve17N/3NlL6X3pkJWkAOt9V6SZTLcH0TJDlPR2fx1bVpkWfIpgYRqnSBZtRJR53qL1XplCZa3Mt61CkXkeDCvJiwvIr2
 4uzTmsizJraTT2+m0PWvTpsnHGzvJPferSd2FlUEFlaNQ8VfS+lPBPEwM7B2vUf0xlbjvE9KIaSQ1SxZxEHy26kS2wNpV5ml7l5zr+BQLUQ5irXo42WNDs5v
 Ok0rFCCcEAUKZSdhgm4GrGAv0IK4pQ==
Subject: [Buildroot] [PATCH 2/2] package/bullet: fix build failure due to
 gcc bug 101952
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The bullet package exhibits gcc bug 101952 when built for the SH4
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101952=y like we
already do for BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y.

Fixes:
http://autobuild.buildroot.net/results/32b/32bfaf0aae57ed18c18e82a72a958af9b3e1b241/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bullet/bullet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 01931b58a8..cc72be7c60 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -24,7 +24,7 @@ endif
 
 BULLET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_101952),)
 BULLET_CXXFLAGS += -O0
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
