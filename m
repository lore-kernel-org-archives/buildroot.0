Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C599EC021BA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D750817F5;
	Sat, 14 Sep 2024 20:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbSkopuCzdxM; Sat, 14 Sep 2024 20:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D20B81948
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D20B81948;
	Sat, 14 Sep 2024 20:37:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5D511BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3975406CC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xylUNprpcIC6 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 848B3406CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848B3406CA
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 848B3406CA
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:37:52 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b3dbso138362439f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726346271; x=1726951071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkn5ygI1Ov5zFYzQqOfK7FkWyBZXEAwi6MngbW53bQA=;
 b=JLP3rozcfZAsDi8xDKG7+z5VfPwbiqGFzRaR5hAwTU0riOcRbtax6NTkg3viplaaZX
 l3Z6IajchYHI3Xborn39+/bfr6USQerWIMmR+ViQ3pkBBr2+to/BdlSEf7oSYVTdtHyX
 Xg9/YFwjmFhe2s+h1dtasYeOx6gF13jP96jZcd3dyrNxwcHsSJV8PLuSPTKZf/CCrsc7
 ftFTWp3rCRP2ZCqCQpfmvG9O2eS6dckY5HVtjUas0zbQFRc6pba0+EOS64jKKYTT5NuJ
 QGcUOcobcj8QixeNCsf9AWquiP30/BlRmoYmnWEyHXo2auKW2iKaug2UbFLrX3u1pfe+
 JcdA==
X-Gm-Message-State: AOJu0YyCHwfgj4Njf3aKHrmJhH1eILbvPjL0yD3SMTBY8aV2auP9RSTz
 kFLrfXKIWV2b7IxWXT2a8qpcHjEM+iRpn8S2dcDYbDqwuCr+WEsBmvDyfisZ
X-Google-Smtp-Source: AGHT+IFQg1BtOOzLukXeuoLOzhR4YfYKvPdIiSJbwEBge2FLeqRs1XhHmXk4bIX34vzKpdRMMzeEzg==
X-Received: by 2002:a05:6602:b90:b0:82d:835:e66d with SMTP id
 ca18e2360f4ac-82d1f920a2cmr1078667439f.9.1726346270709; 
 Sat, 14 Sep 2024 13:37:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d093sm564035173.74.2024.09.14.13.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 13:37:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:37:40 -0600
Message-Id: <20240914203740.1089249-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240914203740.1089249-1-james.hilliard1@gmail.com>
References: <20240914203740.1089249-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726346271; x=1726951071; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wkn5ygI1Ov5zFYzQqOfK7FkWyBZXEAwi6MngbW53bQA=;
 b=HRbrTSgjLxX3cfpx6wr9Ty8nc4ZfECwszLqLLfSc18BeLQFuoxJDvBSq9r9LzNdecp
 4jTAaWOMhtqkydnV6UFtIjmbtC3Tx5uKj7zYkqYSPCxA7vLIQZOjlvNDzXtXvWxFyWoC
 rmTzP/gxgNf7RtD8hF7FHgRVA/DxPAHKTn9cLymqCVD/6Yz6RVchybDeFE5r/qEY9LeJ
 owzKClAA4z79LCbLr2qLw0lRNtXqsYsJgUWQt+sQdd1SjEMEKg1oSekP418kmHiwzCug
 oWrNeGhwvGLmTtFD3DhyeNYGlkcxIdHmDU6ceih9gc6ur8mkxJ7NRWtOHWq+cBpCuPwZ
 vQhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HRbrTSgj
Subject: [Buildroot] [PATCH v4 3/3] package/python-cython: bump to version
 3.0.11
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested by ensuring all packages with a host-python-cython dependency
build succesfully.

Note that due to namespace conflicts supporting both cython 0.29 and
cython 3.0 variants at the same time would be difficult as both can
not be installed at the same time.

License hash changed due to changing links from http to https:
https://github.com/cython/cython/commit/331d9d824ee5f0c539310332215ebd6ed3257325

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - update to 3.0.11
Changes v2 -> v3:
  - add more details to commit message
---
 package/python-cython/python-cython.hash | 6 +++---
 package/python-cython/python-cython.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 42c063014e..cd320eaa2a 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  d9a1e8416f2278857a189347858ed9d0  Cython-0.29.37.tar.gz
-sha256  f813d4a6dd94adee5d4ff266191d1d95bf6d4164a4facc535422c021b2504cfb  Cython-0.29.37.tar.gz
+md5  388b85b7c23f501320d19d991b169f5d  cython-3.0.11.tar.gz
+sha256  7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff  cython-3.0.11.tar.gz
 # Locally computed sha256 checksums
-sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
+sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 024c8c1e50..51086bedab 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.37
-PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/2a/97/8cc3fe7c6de4796921236a64d00ca8a95565772e57f0d3caae68d880b592
+PYTHON_CYTHON_VERSION = 3.0.11
+PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/84/4d/b720d6000f4ca77f030bd70f12550820f0766b568e43f11af7f7ad9061aa
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
