Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC0EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 07:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B82F0405D2;
	Fri, 13 May 2022 07:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfGsoqqhDECN; Fri, 13 May 2022 07:11:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C678540141;
	Fri, 13 May 2022 07:11:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 919761BF357
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FF7040141
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 07:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXmv_fzX_NXw for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 07:11:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B50D540120
 for <buildroot@buildroot.org>; Fri, 13 May 2022 07:11:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id i19so14406695eja.11
 for <buildroot@buildroot.org>; Fri, 13 May 2022 00:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xm07lA+gS2SX4U1ocL0k7fgV/Q4eLyQ3RnSyPmrw9w=;
 b=kYWFRUP5PGyrcs7/u+3PiOb+G3MgFIycu3j7l90H5YxqNkX6xtVABbgzzVe1oeNLve
 /5xJbDmsMk3BJYbxxryNGXjmuskMCaTcQ8J70jYZQvDhTfVi8mvHvxD8e5738Frad55l
 rRriaVl/E2+cAVtdxyRzMLPJ7sEwOYNPMfaBWfsjTn6W1J4KRThzMfYI2AJQvcDLDkcC
 DDMUatF+qWC+ovvg3IG6OzJKP/QmKnDQ3xtxgrS8T3zm7q0LpCLXSeYvx4ibhc/7pJuF
 ADUvaOYStZQn7Daq4hs29spTNKUAoItevr9Bze+7Dcl4JGCmxrQeqti4eCYUUI59CKA7
 gxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xm07lA+gS2SX4U1ocL0k7fgV/Q4eLyQ3RnSyPmrw9w=;
 b=OlgC6lTwRUVokjQaRknroc+ND6So0e3ZpnjQ8+htawlGu0Ypoz0sdUy3mwXJmbvFQu
 XitghjUKSFsmZeoQYP9WuwbWWtZ9/cHxiWkROjt6+YX7rKgFlYA13oRsByhbuOh5s/4R
 mdwz7CqmFDrqKQkirHIlEgOrdMO7aGrjxZpTIjgDuGfbGWOp4AKgkK36Me0aKPxUnGes
 vHt3w5W7jXaz0s3Yk4JVsHnf5RamVvAGn9I6/LtOo7hn8GCV5sm6vq9riALraRCXpODo
 XwFt8CNXAASO+g0DXTYclqeq8J5oUv/eugNep4c2iZ8TijAcbhEh9Tp+CG1EQGM8dNYl
 LLYA==
X-Gm-Message-State: AOAM531bHzIXqWewX0Wzmi+nj7srLgfjd8U2x4xyd8MTTDLF2NMyDrvw
 ic4V7uLIEfP0uhwt3fyyzm0JJR0E7xMdVQ==
X-Google-Smtp-Source: ABdhPJwZt6Etakcm/7d8EJrtcDc1L1yMwN6zcJLQ/F7720NPekBf8OloKky6ojsy682NkQzsdfaVZw==
X-Received: by 2002:a17:906:c10c:b0:6fa:24e1:2fd3 with SMTP id
 do12-20020a170906c10c00b006fa24e12fd3mr3021709ejc.231.1652425862516; 
 Fri, 13 May 2022 00:11:02 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 ml13-20020a170906cc0d00b006f3ef214e63sm443183ejb.201.2022.05.13.00.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:11:01 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 09:10:45 +0200
Message-Id: <20220513071046.18618-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220513071046.18618-1-heiko.thiery@gmail.com>
References: <20220513071046.18618-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/libyang: bump verstion to 2.0.164
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index c129896a63..df794cc9f1 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  184dd67c66c1ad968a2ee4d0950fb6b103834917b04b17af9c7bca80967636ee  libyang-2.0.112.tar.gz
+sha256  7ed65c3e180eb14183d72676468b2b81682baef0957d88d0114341d886c19093  libyang-2.0.164.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index a097b3ee95..e2dc810fe0 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.0.112
+LIBYANG_VERSION = 2.0.164
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
