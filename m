Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0A9C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF1B4150F;
	Sat, 26 Aug 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BF1B4150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QevE7D_Vj17w; Sat, 26 Aug 2023 21:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE6141525;
	Sat, 26 Aug 2023 21:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE6141525
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A16301BF471
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B4FC401A1
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4FC401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYLjznuc9X8I for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 21:00:17 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2101140154
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 21:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2101140154
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4018af1038cso19503805e9.0
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 14:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693083615; x=1693688415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MIXpeD0AQP4Wo+TY0K0tTtU23LLnm21GGbK+Yr90VCs=;
 b=E/v8agX9H89bZbFShgHpRlaC5XK55iY2t4paWav28QIju5BvPxpBB+dHFKafAmE7cR
 eXmclBQ8ufARpcF3ksKrpJBdyzSYKaXyUwLfZvYNHPwj0wXcxSwbkvxyZtK2XnNBhUkb
 TGImEq7DNbjv6/xlpKGhMSwrXmXXN5jvnenGwdIO96ZPi0Fqb5Ldo5pPZvzJEqlXbmDN
 ZCqBKL28eWR83sufCxNZ0lCzfMgvGAueQZCWUIGGQPItISbV1o2t/XjgmNuZRru0wkuK
 EaVOKc1jPC6MZC2mDDYlY5U9kUwJ2W0qfyuz7Y95Rap45KzSNyfocW2RhAwkiUBfFbfX
 H57g==
X-Gm-Message-State: AOJu0YweMAvJLvLA11INI9RLMyqK6s4LSvozrtivelIy9FNsumViwLul
 /12HySbPWVNTmXo+h5/q4cYzsSDvmDQ=
X-Google-Smtp-Source: AGHT+IEy5yqcz7u3Xafe8REOmSUEe7D60zXNk7+9H9Ef4k7SE4bhqpSMEpEWmJGkKjj5ssfkgwfqUQ==
X-Received: by 2002:a05:600c:44a:b0:401:eb0:a98d with SMTP id
 s10-20020a05600c044a00b004010eb0a98dmr6646659wmb.24.1693083614824; 
 Sat, 26 Aug 2023 14:00:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c299300b003fed70fb09dsm5937701wmd.26.2023.08.26.14.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 14:00:14 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 23:00:11 +0200
Message-ID: <20230826210011.39269-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693083615; x=1693688415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MIXpeD0AQP4Wo+TY0K0tTtU23LLnm21GGbK+Yr90VCs=;
 b=dmK5KPj6a9dKawShaW0Fx1kwS2MzVi6dOImAGp/W2NlOIWuY+k5/LFLE9cXpmWaU+M
 yF2LFrXC40QUGU+jsZl5pe2QlYjXh3vsBqd9us3w431TAkrtiwOZqFIB+th5qtgKOeWA
 RXRBCRr5c1I4nP1DSOJZr8XmVFUUS2rCLVuCWB3JJfbdjzfiPhw5iLPf9MT67MTZb/W+
 9XrYuFrmD1yzOmGbKTI4AmjMidl9Cep2ApL6PZmTpdInTBzUUJmTPBEOsPxUScAGCpMY
 jpGS1kdbMvLLbjRY10QwbgNWIjmGbZp/3lbwA4L/twvF8ucVXz7F+4vxq9FUJe7sP65Y
 FmFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dmK5KPj6
Subject: [Buildroot] [RFC] support/misc/gitlab-ci.yml.in: retry a job only
 if it failed due to a runner issue
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

Each time a new pipeline is trigged, some jobs may fail due to temporary
issue with a Gitlab runner (network, power supply, docker or maintainance).

Most of the problems are "runner system failure" [1] and requires to retart
each failed jobs manually by maintainers to complete the pipeline with only
real failure if any.

The "retry" keyword allows to configure how many time a job is retried if
it fails. "retry:when" allows to retry a failed job only on specific
failure types like "runner_system_failure".

While at it, retry a job if it failed due to a timeout failure (this
timeout means that the job was pending for more than 24h) [2].

Such timeout failure occurs on pipeline testing each Buildroot's defconfig
since there is not enough gitlab runner avaible to build all of them
within 24h.

Retry only jobs that are more likely to wait for a runner
(generate-gitlab-ci-yml, runtime_test_base, defconfig_base and test_pkg).

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949397 (runner system failure)
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949530 (timeout failure or the job got stuck)

https://docs.gitlab.com/ee/ci/yaml/#retrywhen

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 .gitlab-ci.yml                |  5 +++++
 support/misc/gitlab-ci.yml.in | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ed17bb14b9..3d7719568f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -10,6 +10,11 @@ stages:
 generate-gitlab-ci-yml:
   stage: generate-gitlab-ci
   script: ./support/scripts/generate-gitlab-ci-yml support/misc/gitlab-ci.yml.in > generated-gitlab-ci.yml
+  retry:
+    max: 2
+    when:
+      - runner_system_failure
+      - stuck_or_timeout_failure
   artifacts:
     when: always
     paths:
diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 446132846f..4d9acbc3d3 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -67,6 +67,11 @@ before_script:
                 tail -200 runtime-test.log
                 exit 1
             }
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -99,6 +104,11 @@ before_script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
         - echo "Starting runtime test ${TEST_CASE_NAME}"
         - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
     artifacts:
         when: always
         expire_in: 2 weeks
@@ -119,6 +129,11 @@ before_script:
     needs:
         - pipeline: $PARENT_PIPELINE_ID
           job: generate-gitlab-ci-yml
+    retry:
+        max: 2
+        when:
+            - runner_system_failure
+            - stuck_or_timeout_failure
     artifacts:
         when: always
         expire_in: 2 weeks
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
