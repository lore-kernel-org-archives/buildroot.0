Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82B8C001DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 21:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601894024A;
	Mon, 17 Jul 2023 21:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601894024A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDoGp1uMhHZt; Mon, 17 Jul 2023 21:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E70A405AA;
	Mon, 17 Jul 2023 21:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E70A405AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A22ED1BF2C1
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A5594024A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A5594024A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYRlJP7DC6tX for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 21:34:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A554023E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88A554023E
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 21:34:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc63c2e84so49770185e9.3
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689629643; x=1692221643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7wnEI3GTmsxoqe0ubsRrn8aSPpa0FDm/lGxVrkzOUz0=;
 b=VnIo00RizslZLJKpiXgU1PWXTXRI8HnlpVeb5wVx251picquJ1C3eAn0hQy7TMAhro
 mUP4GuPZ0AcuuKx+7hJiMmfM8GVg9yAujpcoGksUaYz5QbV9KL3qKIefKyqU/Q8mbsSR
 eXfx454U4P2ZEx8I2QjpL1WMq3oRpIhHgtmoaP2OYWD1QzEKJ1N/sYYHenCgMX25y+Sy
 P5yaFuQRpHWNuVRkBkktCstw9ywITlvCmqqMxn/rRLumoB1dTuwM4N0MLD5peCLiZFLg
 PDoVRXQ3fWvGZrecKY9tTkof4V73o6EJVUHA/IYUaxUb524idPuhLwDg0oWMZnnh8As2
 nfbQ==
X-Gm-Message-State: ABy/qLaH7OyWfDGNgYH908R/39szeWvL4y6KZdFHO2BG77XssyLFErZh
 y8s2Qd26HXhJmeNCI2LkLAWs4HiiAnM=
X-Google-Smtp-Source: APBJJlFRpzLrXVc1q8mKpmRs76PjqzQTksx/VYIMNXQYM/g69EHHm2HtFA6g9NkE8iELxnYYSE2a+Q==
X-Received: by 2002:a7b:ce11:0:b0:3fa:964e:e85 with SMTP id
 m17-20020a7bce11000000b003fa964e0e85mr392077wmc.5.1689629643417; 
 Mon, 17 Jul 2023 14:34:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1ce906000000b003fb40ec9475sm651950wmc.11.2023.07.17.14.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 14:34:02 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 23:33:59 +0200
Message-ID: <20230717213359.106368-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717213359.106368-1-romain.naour@gmail.com>
References: <20230717213359.106368-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689629643; x=1692221643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wnEI3GTmsxoqe0ubsRrn8aSPpa0FDm/lGxVrkzOUz0=;
 b=Nli8vJUGRvTRMPYxSMJjT7uY2nFk7qM6B6zEh8I2oT2+ECdhgStR+PbOZd8CqPoh9N
 Winn2u99xVaLrxv18EPbBcOqvZLfBaon9/qPEvBz6Hw/mGQxeqRU0hFW6gE/rwNyjY0i
 VyQjg8+FCWmyhV4ufKHATWq2W4kGtfn9YWYH/eixgDzJrdaLM2KnzD12uy9oZVuBUlsI
 8ReEo8ZpIuLsMdx/uwRBz+muZVBqmKsD7MJkxCQjIfR1UKUsb1qQEkj9mm5P68guKQA4
 z3qzpd1dm96N6XXuamsTqAUw3EUXh7RFxxkTXQ3CklthaBuk6x9rDVDQFcwVLFa95P7V
 7PYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Nli8vJUG
Subject: [Buildroot] [PATCH 3/3] gitlab-ci.yml: pass emulator builtin
 binaries as artifacts
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

Notes: We can't use runtime_test_download job from the parent pipeline
(generate-gitlab-ci) since the artifacts archive size is limited to 5MB.
So introduce a new custom stage named "download" executed before "test"
stage. test-dl directory that contain downloaded files can be an
artifact of the job passed to all jobs of next stages.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4409032417

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/934319226

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/misc/gitlab-ci.yml.in          | 11 +++++++++++
 support/scripts/generate-gitlab-ci-yml |  1 +
 2 files changed, 12 insertions(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index d8d6b3f410..446132846f 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,4 +1,5 @@
 stages:
+  - download
   - test
 
 before_script:
@@ -78,6 +79,16 @@ before_script:
             - output/build/*/.config
             - runtime-test.log
 
+.runtime_test_download:
+    stage: download
+    # Keep test-dl directory so the downloaded files can be an artifact of
+    # the job passed to all jobs of next stages.
+    script: ./support/testing/run-tests -d test-dl/ --prepare-only
+    artifacts:
+        when: always
+        paths:
+            - test-dl/
+
 .runtime_test_base:
     stage: test
     # Keep build directories so the rootfs can be an artifact of the job. The
diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index ea4340f47c..2d922b9eb2 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -132,6 +132,7 @@ gen_tests() {
     fi
 
     if ${do_runtime:-false}; then
+        printf 'runtime_test_download: { extends: .runtime_test_download }\n'
         printf '%s: { extends: .runtime_test_base }\n' "${runtimes[@]}"
     fi
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
