Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40567C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F4F60A94;
	Sun, 24 Apr 2022 20:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPbQklCM5doP; Sun, 24 Apr 2022 20:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1100160A9C;
	Sun, 24 Apr 2022 20:57:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C683D1BF404
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C36E560A78
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHXxE7okGESI for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 20:56:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A029A60A87
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 20:56:49 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id r17so8218282iln.9
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0NKFLYCvuCd7IUDOBOi5UYPQyOMwrgrQwUGVCeFIRs=;
 b=DLO0ljIUyTFnU0jaweyl6OvytrJESuKcUCh61LF0gSbv70xacxjln/K4zCwkUhy/8h
 xC5t37eiktlgvK/xG9vE0y5SSDJUA02zk86+q6fVM8mLUTosF6jBSOKGECi9TjIcVOVy
 H3T9AA4SFQRuJn1QMdsi29cjOGggNz+6ERiXM2hl6DTxYEz2AkgwV/4y8MQV5xfF9Q5t
 Dgbzw7SqkU7nto+39I1KEl2yEh3VDq33K/EL6SGt9xYMIiL81BNYQOoMNO2dToEkzomH
 nd846zgVph6EsB4SzoM3MHzF8qnBdpehVG90k/edF5L3YR1tKc9lb2MvK4+c2jOx+vlk
 bTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0NKFLYCvuCd7IUDOBOi5UYPQyOMwrgrQwUGVCeFIRs=;
 b=rY1xAIherki4X2Qn0krAgPHmvzeiH+ZmRrM6SVNKW3AYDygz2ItzsCqdnk8zGD7SFc
 Y89pftmsBy5bIhJNmH+BddHZdS0LIhYKXGNGRKfi/ejVCR/uK1dSIeDy07mllUefp72G
 uLqZ0aO05r9Cb7PLeajEGj/vBcT44EqM4ThwLV3RAbpybuNsZ/DMclgx7jfIE4pVhPH1
 ti0AUzCiOVMellKfCebOGnXaNXwdkO/8kK3xq6YI5NlOMBfOk4+1/yDz8ai1GH6+XoTT
 NfodLAXavChRhzn+yM3BrpzN0vyQPtcX4/QK0rnXNYNFjUnLvefQLU2TsQKfvs62I0au
 DDFw==
X-Gm-Message-State: AOAM530sRqR1srlFvOZeDJZRiGMPEPPmGLOZjHONFEMiD1u/S+4La43F
 IWOO+7dhH5243+ySCrDpbWMdcYznUxOwCw==
X-Google-Smtp-Source: ABdhPJx+J4SbsnVgmVS6pQbeLfTpZcLEIPzGTGv889FAZoWEZJneMCuAQxQfDtNAc7vfM0fIymoLaQ==
X-Received: by 2002:a92:b305:0:b0:2c8:267b:7e25 with SMTP id
 p5-20020a92b305000000b002c8267b7e25mr5898853ilh.312.1650833808526; 
 Sun, 24 Apr 2022 13:56:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm5152350ilc.35.2022.04.24.13.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 13:56:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 14:56:37 -0600
Message-Id: <20220424205639.1618386-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424205639.1618386-1-james.hilliard1@gmail.com>
References: <20220424205639.1618386-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 3/5] package/python-flit-core: migrate setup
 type to flit bootstrap
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package needs to use flit-bootstrap since it is a dependency
of host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flit-core/python-flit-core.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 0e058a1f17..aaf4c77c6a 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -8,6 +8,6 @@ PYTHON_FLIT_CORE_VERSION = 3.7.1
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
 PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
-PYTHON_FLIT_CORE_SETUP_TYPE = pep517
+PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
