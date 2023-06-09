Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFCCC7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 17:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFC483BE9;
	Fri,  9 Jun 2023 17:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFC483BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ru7OgA7a8APA; Fri,  9 Jun 2023 17:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 209A483C05;
	Fri,  9 Jun 2023 17:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 209A483C05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22AF11BF37B
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 056FD83BE9
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 056FD83BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16BLexeAxntn for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 17:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB1883BD4
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DB1883BD4
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 17:50:01 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30af159b433so1987644f8f.3
 for <buildroot@buildroot.org>; Fri, 09 Jun 2023 10:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686332999; x=1688924999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BqMNE5ru7VzBCpMQ+b/VXta3aDgHJmIfzW/C48Pqmqo=;
 b=HN184qjZ8rQXPDxuoM4QjQe8aCpmb+YoCz1Eg/iDexX6YSmyJfIivofSHi09QP62Va
 oWzKc1zihalRkqS5UmXb9ODa4rjULm+VmDFciDxsxBhwwrZmoXNSq3HId+JhlZO3x8V5
 u2xF4NyD9ZJUf7QamG+0d9RhLu/oMzE7dr9oQmzI8Prya9JIubq3ktq4p66AsrzWMt6j
 UPWwKxTobl3wcMYLJ13lXzVYcBJ5bPYYjJ1yHQsRVd6qGH+yMxhK1zOfaX8Eru+tkEko
 ppnG5+AEOf1d7/58h9RZnhg/c3CFwR+xVJibA+gCpXaDmqW7klFtsfO4bkEl3QMfsCsb
 /x2g==
X-Gm-Message-State: AC+VfDwIRHlGthpN0cmK/KxrrcmWYvHNuoxlhT8vKSNDOVS71OPh6l7G
 PuGMEHmv+ujWbyC7RgU9VALAUa33NQs=
X-Google-Smtp-Source: ACHHUZ4bVamaCNXPDYa9Mz+rJGTbcqamLPEutlidTSZ+niFr6ZuSPD2mOE9a3Ik/GZhkgG+23CFdnw==
X-Received: by 2002:a5d:5919:0:b0:30a:b4e1:a8a7 with SMTP id
 v25-20020a5d5919000000b0030ab4e1a8a7mr1802749wrd.64.1686332999283; 
 Fri, 09 Jun 2023 10:49:59 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffac4000000b00307c46f4f08sm5048877wrs.79.2023.06.09.10.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:49:58 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 19:49:52 +0200
Message-Id: <20230609174955.409551-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686332999; x=1688924999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BqMNE5ru7VzBCpMQ+b/VXta3aDgHJmIfzW/C48Pqmqo=;
 b=MhfDrQX+Z9EehNC5WVuunZX10n/sXXOsE1itmeMichMA6+oyNFUvCRc1WWi8Ai6pdU
 MS0mGJyHf+B5sEBW7PHz+pPb9xhFz08AcYUiUHEMXzk8wfLVuAdMDesOjdZGICKb+rlS
 pOOG14jZgTObIeODk2RUqssKXoWxQ1Ax8rbrRZ7nTMwaggw3rudT+z5nDnkFykTTHT/7
 a7MOzzdASxNWXFMB6MfLzE85RDeFM5fU1cgjUuzSdfNr79RsLrougjhgAktccsv+Ri0c
 5GTBbx1GqOTCCWBH0FOBvLqUB83pnDFtfsDbmDV2x3gauXY3BawVXC1sJlv72djVy91C
 sJGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MhfDrQX+
Subject: [Buildroot] [PATCH 1/4] support/testing: add python-mako runtime
 test
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

This new runtime test allows to reproduce the issue
reported by https://bugs.busybox.net/show_bug.cgi?id=15628
with a simple python script.

Traceback (most recent call last):
  File "/bin/piglit", line 107, in <module>
    import framework.programs.summary as summary
  File "/usr/lib64/piglit/framework/programs/summary.py", line 30, in <module>
    from framework import summary, status, core, backends, exceptions
  File "/usr/lib64/piglit/framework/summary/__init__.py", line 31, in <module>
    from .html_ import html, feat
  File "/usr/lib64/piglit/framework/summary/html_.py", line 37, in <module>
    from mako.lookup import TemplateLookup
  File "/usr/lib/python3.11/site-packages/mako/lookup.py", line 13, in <module>
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 292, in <module>
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 289, in _install_highlighting
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 277, in _install_fallback
  File "/usr/lib/python3.11/site-packages/mako/filters.py", line 14, in <module>
ModuleNotFoundError: No module named 'markupsafe

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/sample_python_mako.py |  1 +
 support/testing/tests/package/test_python_mako.py   | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_mako.py
 create mode 100644 support/testing/tests/package/test_python_mako.py

diff --git a/support/testing/tests/package/sample_python_mako.py b/support/testing/tests/package/sample_python_mako.py
new file mode 100644
index 0000000000..aedae7ebad
--- /dev/null
+++ b/support/testing/tests/package/sample_python_mako.py
@@ -0,0 +1 @@
+from mako import runtime
diff --git a/support/testing/tests/package/test_python_mako.py b/support/testing/tests/package/test_python_mako.py
new file mode 100644
index 0000000000..b6075bde6a
--- /dev/null
+++ b/support/testing/tests/package/test_python_mako.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Mako(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MAKO=y
+        """
+    sample_scripts = ["tests/package/sample_python_mako.py"]
+    timeout = 30
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
