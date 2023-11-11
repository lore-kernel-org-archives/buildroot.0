Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD63EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 11:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD0B4210D;
	Sat, 11 Nov 2023 11:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DD0B4210D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhVB7TlAAVa5; Sat, 11 Nov 2023 11:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7110841E40;
	Sat, 11 Nov 2023 11:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7110841E40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3E781BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91EE06106D
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91EE06106D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcuB6_D25kvm for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 11:37:38 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0277061013
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 11:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0277061013
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40839652b97so21393695e9.3
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 03:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699702656; x=1700307456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aOeTk22o9EEeB+e7VyDSIHH/cTILb5ozhChCBB7OpvY=;
 b=QQBJW61eDTuABXFJzKlVWWdqWb5k4djwF9yOkdxWz+OEd47uGmhlh3HvXoKiortQoZ
 Ax9OM8OxCX4iWXxSUWXPKr1i4SBCrXzXtDl5FveRPkG1FRURAzs66sHNQ6cglruPfDjW
 nrB8FrU/55fpRPLd4M/5g7ehBELbgP2WBkCSkmL3KIxqx7voDQHr6R55E0RJGgIRMbtX
 F/jqkvUygVVc61Ku4FRCukEvzso1q5jKO9TObDW7z+NA3k35gBqgRNAB9S6szuyyYkMA
 GndWcfjGH/BFffgWl1cHSlnlAgufHJqvTQRqaeuzHWAewxUXtdpV4yCFvCXAuvTanfbj
 tH/w==
X-Gm-Message-State: AOJu0YybyxXFxzdIYTmYhC+Z21cIUcNB7CmB2eRbTGKzolTIWWT7hkSp
 tHixR/fzVdWHs99UKcU2oxRY8uG8ae8aQq0mdOo=
X-Google-Smtp-Source: AGHT+IH66lsCsXQPg14384cpTj6VqRTHgJNJpbYnswzwz8XEMZgGCNlsBzlc+1idXZpS5DLlkdMPbA==
X-Received: by 2002:a7b:cbd0:0:b0:407:58e1:24ed with SMTP id
 n16-20020a7bcbd0000000b0040758e124edmr1532177wmi.39.1699702655644; 
 Sat, 11 Nov 2023 03:37:35 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c218600b00405c7591b09sm1910681wme.35.2023.11.11.03.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 03:37:35 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 12:37:31 +0100
Message-ID: <20231111113731.859747-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699702656; x=1700307456;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aOeTk22o9EEeB+e7VyDSIHH/cTILb5ozhChCBB7OpvY=;
 b=W7dIX1yqURIl+PhTZwvp1ouBVDFsUAu9tvpESpIfxCSpWVm/WvThrXE2ErDAf4JZ9n
 f7EnnNVBKfA06qigg7hO2jMfiijD/dZn8Dcg9tud6RtzEhi95pYzhvnm0/jndjc2jS2Y
 qv0NJBATwgX+QX7b2hVv4dD6H7eOrvK87ZBFyRpZvC6SCyK0Dh5vIF1FW52NToQ/eZ4E
 FkwlA7e0l2rJJsmss2A9QVP1DzrO868AxuFdkK6UvIZbsQlbwpZJby9Y51XPHvCGrCXn
 7CJyywcy0qsZwjM22+QUev3d9ikP7QyOl7jiV18GaZlYHwG1vQhH7BKv/Llz7ESxDp0w
 u9MQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=W7dIX1yq
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: print error log
 if the runtime test fail
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When an error occurs, the gitlab-ci job log doesn't contain any useful
information than the name of the failing test:

  FAIL: test_run (tests.package.test_python_paho_mqtt.TestPythonPahoMQTT)

In order to encourage contributors to investigate issues reported by
gitlab-ci, we want to print the last lines of the log file (build or
runtime).

Unfortunately, gitlab-ci job log completely strips lines ending with
CRCRLF [1][2]. We have to take a look at the gitlab-ci raw log to see
the complete log [3].

To workaround this issue, remove crlf from qemu serial stdio log
while printing in the gitlab-ci job log (we don't want to change
the log file generated by support/testing/run-tests and saved as
artefacts).

[1] https://gitlab.com/gitlab-org/gitlab/-/issues/218771
[2] https://gitlab.com/kubu93/buildroot/-/jobs/5492937691
[3] https://gitlab.com/kubu93/buildroot/-/jobs/5492937691/raw

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/misc/gitlab-ci.yml.in | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 4d9acbc3d3..db206432aa 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -103,7 +103,16 @@ before_script:
     script:
         - TEST_CASE_NAME=${CI_JOB_NAME}
         - echo "Starting runtime test ${TEST_CASE_NAME}"
-        - ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME}
+        - |
+            ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${TEST_CASE_NAME} || {
+                echo 'Failed runtime test last output'
+                if [ -f test-output/*-run.log ]; then
+                    tail -200 test-output/*-run.log | sed 's/\r\r$//'
+                else
+                    tail -200 test-output/*-build.log
+                fi
+                exit 1
+            }
     retry:
         max: 2
         when:
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
