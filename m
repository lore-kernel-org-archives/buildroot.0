Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4F2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 22:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5560A6F972;
	Thu,  9 Dec 2021 22:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vqUqKGxz_q5; Thu,  9 Dec 2021 22:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54FD6F977;
	Thu,  9 Dec 2021 22:21:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8071BF350
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6997586123
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4MQ0YrF6ZRKk for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 22:21:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E259686122
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 22:21:06 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id p18so4931933plf.13
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 14:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ejsUJAKmSLtBwew7Pd8GpjvcGYAbPuz4bXrpD60yag=;
 b=lwqPLKkIyzCUGDzw8WeDDTKKmVDsZONPuCHS7YVRYMgL3Uyww2SH2FQ9YjFC2BNqjI
 /hU3aFC23/IcPNx+qm4JY7MBV5LktwXQ401uimm5tCWNCTSGg28aLfMLge7IXpT2ohlt
 xVzFmgJO5BUJP4iE66zWFc0HPAlziZ+xbAf9St3hF8hd1TqE1stCrCenjJHP2IVuwZPw
 y15NrfexcEDOtr/83akdGJBTdyjHmq2wyP+nDLnkRQmWDBGKSfa6a1VhlZNQyov6c9AG
 GgZM9SRk47fMDyUyKaQbFB1y8ZbDcJg89aYKq0Dy+jxcGMRJy+EyFHAAR29jYOmFmUdr
 qnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ejsUJAKmSLtBwew7Pd8GpjvcGYAbPuz4bXrpD60yag=;
 b=YonUjBA8dqEHEwfGgfkn3IOJVMR7g7wTJbqyW2k1xbCcT/Xuszrc+tIdJKIJlop6zt
 JK8jFH/4L3CoDuKnh0y4im4ls9Nj6/AwtAwg/Vp0hYisD4EV0gUWwqBywNcfAFH3Z4Y9
 0VEg1X9ACEUf8JS+xskQhMO3xqwbS9AvhKKT0jQuHrtH0eE40yP9T1Zu7KddJkesrweR
 CIN+M37Ftdsf1VcFPMsYZjN6Ds0332tZSo8T84Yf0aWgypr+Oim8p6dwOIzQa5TYP9ni
 BL/0bZQ6U246uei7hlFb0NfTff3txFnIqfjNXPj9/3P0CuYmReEuwbNTuvm/6S5TMZW9
 O3SA==
X-Gm-Message-State: AOAM533qgtyi+2o1oAIKyQMo72khyjRI2D7pR+ZLITjRnOKy5G4sRsoq
 IkaHm5oVt8rVKEnjI4Gi/4u4i7It/Dhm2A==
X-Google-Smtp-Source: ABdhPJxl1NKtHWZ8Rpoo4UhpSelF2B4IzW/HWcXV631248oHl4Y4CFTCR7xtbfUpIvirDZmvr0HSEQ==
X-Received: by 2002:a17:90b:4c51:: with SMTP id
 np17mr19026887pjb.213.1639088466141; 
 Thu, 09 Dec 2021 14:21:06 -0800 (PST)
Received: from adam-workstation.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id u22sm676995pfi.187.2021.12.09.14.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:21:05 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 14:21:04 -0800
Message-Id: <20211209222104.222786-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/findutils: enable selinux support
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/findutils/findutils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 918591c53f..3237e5502a 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -15,4 +15,11 @@ FINDUTILS_CONF_ENV = \
 	ac_cv_func_working_mktime=yes \
 	gl_cv_func_wcwidth_works=yes
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+FINDUTILS_DEPENDENCIES += libselinux
+FINDUTILS_CONF_OPTS += --with-selinux
+else
+FINDUTILS_CONF_OPTS += --without-selinux
+endif
+
 $(eval $(autotools-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
