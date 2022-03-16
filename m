Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F85DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 20:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E2E5403C8;
	Wed, 16 Mar 2022 20:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_oFdmpFg5LU; Wed, 16 Mar 2022 20:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C2D840126;
	Wed, 16 Mar 2022 20:40:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED1041BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86E5841DE
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4o6Vt0Z0Fcx for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 20:40:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE0BC841BF
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 20:40:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u10so4599641wra.9
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7L8APOyhadhxQZlwaNKXH5c3I7AgsiWL9jUHQhD15A=;
 b=N0s4V7tDgsLa4GHdQSKiP+HuiV7NpYdtHr8fTL35KENe4vnbK92vlOqGYDzaZqIsSc
 HGF8f817uLF8egstNhKEg98hvgW1d0LT/m/JreU1UqXHMJHZs+7c1ISXhLgtuziOzCVt
 0j3tCx+yjnsU6NZHKDRFAJI29oRe1spGvpxUivu5UL1QDKUrZgAtUT8CwcyAUiRLVdUh
 C9Oy8rbvotrLC5XvmaW4+BnoVZjdbU3/6ycGGLkn5DUcDLtp0K9K2XVXIlWVq+SYCQOM
 wWNyErKCcFj64X6Ug0oehTBKLJhfvaF5pcHR+Y0KdRsCzjUHYCC8yA2QKJq4utjz05iS
 A4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7L8APOyhadhxQZlwaNKXH5c3I7AgsiWL9jUHQhD15A=;
 b=ak2g/okufOjcRSM5/Sx30zmKPqGF4su9H1AJPwWcI0lJkrfod70vV0gKZCZpDmPlLM
 Iwq1CzPNRdHJHntmm3eDrrjPMZM5WTb5Mxlmtgbjk65U1cNdJWTrjNDEx+yy4wH3w76c
 TAOUaG/ZpfCgIjt3GKXh08txk3aISb1GTZyGZboiUrzO3lvi8UqAIO2AdLlnnU8Lf+Ip
 kA6d67jtneMw1jF+31ILvWQpWt6SETlkhilI3nbtqPRBDgxdQe+oJTlJXzURE6fkh738
 mkew+5978HZ/jFTiuRf/+CmAIsnz2fAtNZRu/7UEAUmmdH7pem0RCGyCYVBvEhBfXqyT
 PqkA==
X-Gm-Message-State: AOAM5314X2f8IbfdZQADGNVj66yoGQqWeNe84vK7/ufPPrz3eik95JPt
 hoD1sRGfyyxquGOw+5Lk1IuMetZ7q/I=
X-Google-Smtp-Source: ABdhPJwacqANKL6UCkgdA9kvquyrhMP6WKO1mnf5BqigWGAtWqXA9A2+RofJ/9hMsNiPNqsVqcSh8g==
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id
 b9-20020adfd1c9000000b00203c4f8dd17mr1230833wrd.633.1647463223047; 
 Wed, 16 Mar 2022 13:40:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 ay9-20020a5d6f09000000b001f1f3330fc5sm2635303wrb.28.2022.03.16.13.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 13:40:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 21:39:21 +0100
Message-Id: <20220316203922.3081843-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libminiupnpc: disable sample and
 tests
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable sample and tests (which are built by default since version 2.1:
https://github.com/miniupnp/miniupnp/commit/530b2723500c4a708546815f5593b5c819ab5f76)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libminiupnpc/libminiupnpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 551a6767cf..0633ccd234 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -16,5 +16,6 @@ LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
 LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
 LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
 LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
+LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
 
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
