Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEDCC001B0
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 21:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADBED405A4;
	Mon, 17 Jul 2023 21:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADBED405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id loK8ymE5hIuZ; Mon, 17 Jul 2023 21:34:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FF48404C6;
	Mon, 17 Jul 2023 21:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FF48404C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 554551BF955
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EDB260C03
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDB260C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPqUJiCkQshS for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 21:34:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EFD60B16
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0EFD60B16
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 21:34:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso46177505e9.1
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689629643; x=1692221643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asP83rhlw7kAbmWRIjKfC75B7Zd/mLAF2QmRwJ2g7ew=;
 b=B6EcCQ/1U5Zm9VcebaqZOswpSqjqYcHnxpIKeOFrX2DF86J+1mnm/LI3yNkFctz9Wc
 aKcSX1Mwot/7g+v7wRccYx3bSXTc7sn9sJbwB9Wef54TcQMvXzdKX+kFhcjVxNk+Szdw
 n4jNeoAx+szQ7E/tsFu6Glkv7zSx0bKiyu9XCxg/i59owzRgTRSpG2x4Tv6fgsNdtqx5
 fsYf7xsMFI9N1kVmUQUwbE5oJhVkqfrppdLqwrqQ6lU0ypUYR/qJYVlK092GtZgUfjGp
 a4+7bTMy7EgxdJBkksunQYAxJHTpgu3CmB3fyfhKcA6+17NDAwZbAMlaW5f9MU+5hAL0
 4i/Q==
X-Gm-Message-State: ABy/qLa91zTU/qXt67f3lAYXTdJ1Mb6Z1gcvdnh5cOC863u+nLO0PZ18
 nQg99b7bvPz8EtCNRSKdKuhXyYFo8tc=
X-Google-Smtp-Source: APBJJlGFLWZYCALbVa4LMfzysy75CRCfLnNl6N4iUAXOn8Cyz2ANkErVzSmZ6DbU2zZt9T75xkOKjw==
X-Received: by 2002:a7b:c8cf:0:b0:3fb:bc4a:46ad with SMTP id
 f15-20020a7bc8cf000000b003fbbc4a46admr422897wml.9.1689629642592; 
 Mon, 17 Jul 2023 14:34:02 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1ce906000000b003fb40ec9475sm651950wmc.11.2023.07.17.14.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 14:34:02 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 23:33:58 +0200
Message-ID: <20230717213359.106368-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717213359.106368-1-romain.naour@gmail.com>
References: <20230717213359.106368-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689629643; x=1692221643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asP83rhlw7kAbmWRIjKfC75B7Zd/mLAF2QmRwJ2g7ew=;
 b=axCoAR0+7EknKq7P+TfLbx6mlUzW4sR2qZjG0gA6vucj0Sjt06oiYnryUmPpA8KL7n
 4qtac48f3znrUJoBK/HF6mh4JBQkVqCbql6dKSLyTS/0eciJon2yLQIdo8BZURUlnOr0
 2CtCHuvBPjulieLigSNFT63E3Ec5hQ84zByUJUFTgU2SrLBLfghdLkqe1Ps/bDe4BsSU
 xuv1qpv4gyDp44euJk4a0hvt9jb+bc/LBD5s3Ovk9r/LakxM9R0LRPtqg8sa0kh8YHVZ
 w6rxCaXp0TMvQSyXgrGvJCyZx6Vn/SKXgEsPL3x2UjWRdUGEb44SQg3DupWbr8yXE5jK
 vMVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=axCoAR0+
Subject: [Buildroot] [PATCH 2/3] gitlab-ci.yml: add stage explicitely to
 each jobs
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

"stages" is curently not defined in the .gitlab-ci.yml file,
so the default pipeline stages are:

    .pre
    build
    test
    deploy
    .post

Since any jobs specify a stage, all jobs are assigned the "test"
stage [1]. All other stages defined by default are not used in the
gitlab-ci pipeline, they remain hidden.

In order to introduce a new custom stage, add the "test" stage
explicitely.

[1] https://docs.gitlab.com/ee/ci/yaml/#stages

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/misc/gitlab-ci.yml.in | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index cbb6e555ce..d8d6b3f410 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,27 +1,36 @@
+stages:
+  - test
+
 before_script:
   - git config --global --add safe.directory ${CI_PROJECT_DIR}
 
 .check-check-package_base:
+    stage: test
     script:
         - python3 -m pytest -v utils/checkpackagelib/
 
 .check-check-symbol_base:
+    stage: test
     script:
         - python3 -m pytest -v utils/checksymbolslib/
 
 .check-DEVELOPERS_base:
+    stage: test
     script:
         - utils/get-developers -v
 
 .check-package_base:
+    stage: test
     script:
         - make check-package
 
 .check-symbol_base:
+    stage: test
     script:
         - utils/check-symbols
 
 .defconfig_check:
+    stage: test
     script:
         - DEFCONFIG_NAME=$(echo ${CI_JOB_NAME} | sed -e 's,_check$,,g')
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
@@ -42,6 +51,7 @@ before_script:
       }
 
 .defconfig_base:
+    stage: test
     script:
         - DEFCONFIG_NAME=${CI_JOB_NAME}
         - OUTPUT_DIR=output
@@ -69,6 +79,7 @@ before_script:
             - runtime-test.log
 
 .runtime_test_base:
+    stage: test
     # Keep build directories so the rootfs can be an artifact of the job. The
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
@@ -86,7 +97,7 @@ before_script:
             - test-output/*/images/*
 
 .test_pkg:
-    stage: build
+    stage: test
     script:
         - OUTPUT_DIR=${CI_JOB_NAME}
         - echo "Configure Buildroot for ${OUTPUT_DIR}"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
