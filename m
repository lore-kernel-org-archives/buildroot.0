Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8751CC77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 08:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2590360B57;
	Sun, 21 May 2023 08:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2590360B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qiw7J_wlXIyh; Sun, 21 May 2023 08:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31BA060681;
	Sun, 21 May 2023 08:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31BA060681
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 217C71BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF21B81AF4
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF21B81AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwHqQP61swr3 for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 08:33:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDABC81AC4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDABC81AC4
 for <buildroot@busybox.net>; Sun, 21 May 2023 08:33:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f603e0edddso448565e9.1
 for <buildroot@busybox.net>; Sun, 21 May 2023 01:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684658029; x=1687250029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5TN++37aaTLpD7ZJnujjCzk5xbWbBtGdxl0qvR7LGQY=;
 b=KkYkEHcihnsJKOAG+LEs4zfNQGsysgFIqnzYrXxM+jnHYjEbBqUO9IIeOBU5y6mFGE
 VhtWNRA/OUjEMrOMBGWIcBUpbC8xYslA+RDYnoe3I5Dsx9Y/Gbyto02Cq6de65uGBFc2
 tFqc0RABeupBKmcCw3aH0RrOOhivbKYIUp3DPcCIxm1M9oh4AFZ9HU7e3+/T8kxeaj55
 CnTSA2d2j3B5DNczOEMsLAvynT+TMgE/OaDeF1OxMdQodJ3Jt8y0CPTINWECgmRcA8nG
 A6YaJAMuqpT/7A4q83JMvSQm3YoBRC7liNJkRwiH3q3+3wpLX0TSy5mBzUOW9t3oVMwO
 PzbA==
X-Gm-Message-State: AC+VfDzBMX6mDLiE4GDrikECXHeDd1PZAPOH8Bo/ic0pU4Adwp/mvcus
 VVoKdbhlC/wGEP8X9MNiCrOpDOVq0AQ=
X-Google-Smtp-Source: ACHHUZ4qp2Q3Q63/Dx4Rv5m6zlhwbHi5K7U6xJhteQRvw7Q/OPXRun93b0Qq4b6zEgQR9qAGQST6CQ==
X-Received: by 2002:a05:600c:24a:b0:3f5:ffe7:bf11 with SMTP id
 10-20020a05600c024a00b003f5ffe7bf11mr1689023wmj.36.1684658028352; 
 Sun, 21 May 2023 01:33:48 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:e03:bd00:5ffe:deec:ec3f:c958])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c00d400b003f42894ebe2sm7714520wmm.23.2023.05.21.01.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 01:33:48 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun, 21 May 2023 10:33:42 +0200
Message-Id: <20230521083342.12228-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684658029; x=1687250029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5TN++37aaTLpD7ZJnujjCzk5xbWbBtGdxl0qvR7LGQY=;
 b=qjzgKpSE9EhAkka33j6pbd8qsyC3h120LvkEuXxkc1JCoq9HiiBoWFuylVAXJdKXme
 0lGFwOIlu5R9sY5B7n12vRG1dmqzgMIpKbWdydlXGZI/ABSVh9sTcLI1faLskqa4bY2F
 xiXvNIxGvybo9gz6EzvnR/ydV3bG/m4AXZfbKMY2MVhju8YHIBCV2Hqm6XbGPwoEXYbx
 X/FDPh0ldf0OSj3r3IXmoSH4PR1cWJHpBCWZvlVJ1kFrZ2cn8KOxhZwgxXZKPpDIr6X2
 ts1HxKsWn4Ryv0iShThMPlJwol7APIecZJkERpZMxX7ZO57ZYJPdVk+Np6gyP0+Tq2bK
 VcHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qjzgKpSE
Subject: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.13.1
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index 08348a5ccf..2dfc445b2f 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  d2961ece35b4b9f44a84ef31df1b21ff  pythran-0.12.0.tar.gz
-sha256  eff3dd0d3eebe57372f0d14f82985525e9bcdfb5b1d1010e1932cf9207060f9f  pythran-0.12.0.tar.gz
+md5  3090288af50566af75cb058d1878aaad  pythran-0.13.1.tar.gz
+sha256  8aad08162f010e5425a7b254dd68d83311b430bb29f9252dce2eff3ba39497dd  pythran-0.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 0d946be28a..25735ad95a 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.12.0
+PYTHON_PYTHRAN_VERSION = 0.13.1
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/99/e0/ed0e81de05cfa4ecbcbceec6603d175387d8bc7a6332cbfd155d09958ccf
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/8d/d8/b27e8dc3f3a03dcd317d40d9df0ae07ebbd85444585973ceba07716934d0
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
