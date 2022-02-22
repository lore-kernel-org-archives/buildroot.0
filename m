Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 17:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40420402C3;
	Tue, 22 Feb 2022 17:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHP0AI0qclSE; Tue, 22 Feb 2022 17:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3EC940167;
	Tue, 22 Feb 2022 17:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30D181BF4E4
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 17:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C97481376
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 17:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHLSDJZ2M8M5 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 17:50:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 410FE812F5
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 17:50:09 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q23so168605wra.2
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 09:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZLprq+Zz/lyvvTzo6RuLHkJwOMZlJBlMxsfiRsn+0s=;
 b=VNpqPEMdT3SG+jG4eEYw6wkzmPTPg5lJr7tfIqMmMm7Rld8E6+4yMtBwWO/DC8Vccm
 OzQP6PA396/muvwwfbBBf6AOp4MUK+S4KZPHiGfLQaDS/Gdyfunf2U+YgnCPiL/GbksS
 znaIw81WftRHTovsbJAHY9vQMxKwZjedAAZrh1NUbJhagEh9O5Nwl5YaHKx9qj4NqXaM
 BCay/wJnjKh5l6wNgdSn9vpXLmtSycTBf9MuSW0VHnzVQ+yixmB8xER/nhxgUApNkmDF
 LXXcA/3M0lH+pIEjLtxs9zyjGmxJcHEDEVBxyqI7pS5o1MYmiH7FDPIjWUxcLtyrjRHZ
 oGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GZLprq+Zz/lyvvTzo6RuLHkJwOMZlJBlMxsfiRsn+0s=;
 b=zBzEeqSYaQxjQDRqJshgDFUeQ5Nz8PFWzmbGmil6r/uR3/up44atQJDrTQ+2xzd80O
 mQEe5GjiUA4RrVSh5COj6asz6K/jGDxp1nO6GCFglZ+tPW/KPa+CH9jxG0TY9bvCiwxT
 CALjMa5ntriI7YTqveOlfu8L6LlliVS/reTuQT6dvI4ejqyxWW8XFQ7kbOKMGjtvlUdn
 SnBBB+A8wtglx2kp8eokQdCgYEXY50cPhO+fi6UFfQWaVSCc7pPDm/2q1n1jfrhIxy6u
 hvB32aMoiflBNW3lbBT02s1NtRuGYCEtMLsvYYbIN9sZ1Rh2VWSDIHP3sBCd8XgBSft/
 JNsQ==
X-Gm-Message-State: AOAM5327I4Bmts5DUneKFlDnYfiesPHyTQTJajHVmJPG0UJNJixYLxUN
 7Ntl8iqQ+ZyQpRH/zew7X8YOQR97n4M=
X-Google-Smtp-Source: ABdhPJzDfPnrZh82JERQxXDxqwNXJ7NzKBCk9NWmkoDyXzehC4juPYYiedQa4YUZbkSdHYeftB+whw==
X-Received: by 2002:adf:9d87:0:b0:1ea:99d9:256f with SMTP id
 p7-20020adf9d87000000b001ea99d9256fmr2539196wre.428.1645552206958; 
 Tue, 22 Feb 2022 09:50:06 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id j10sm3840826wmq.20.2022.02.22.09.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:50:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 18:49:57 +0100
Message-Id: <20220222174957.3086493-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pycli: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even with the two upstream patches added in commit
b2e6e376a2d7551ccf146855ec4e99a65c35bd16, python-pycli still raises the
following build failure since bump of python3 to version 3.10.1 in
commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc due to the new "Multiple
Exception types without parentheses" exception
(https://docs.python.org/3/whatsnew/3.10.html):

error:   File "/usr/lib/python3.10/site-packages/cli/test.py", line 142
    except raises, e:
           ^^^^^^^^^
SyntaxError: multiple exception types must be parenthesized

So drop the package as the last release was made 10 years ago.

Fixes:
 - http://autobuild.buildroot.org/results/6112e1830ce608abcea4a26b659c10e5ff09a66a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                              |  7 ++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...aise-exceptions-in-wrapped-functions.patch | 26 ------------
 ...pt-statement-changed-slightly-in-2-6.patch | 41 -------------------
 package/python-pycli/Config.in                |  7 ----
 package/python-pycli/python-pycli.hash        |  5 ---
 package/python-pycli/python-pycli.mk          | 14 -------
 8 files changed, 7 insertions(+), 95 deletions(-)
 delete mode 100644 package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
 delete mode 100644 package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
 delete mode 100644 package/python-pycli/Config.in
 delete mode 100644 package/python-pycli/python-pycli.hash
 delete mode 100644 package/python-pycli/python-pycli.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index aefb0ba6ea..99459c7ad3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_PYCLI
+	bool "python-pycli removed"
+	select BR2_LEGACY
+	help
+	  Package was removed because it is not compatible with python
+	  3.10 and is not maintained anymore (no release since 2012).
+
 config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
 	bool "bpftool was moved"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 3e7c753836..6208df974d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1065,7 +1065,6 @@ N:	Geoff Levand <geoff@infradead.org>
 F:	package/flannel/
 
 N:	Geoffrey Ragot <geoffreyragot@gmail.com>
-F:	package/python-pycli/
 F:	package/python-pyyaml/
 
 N:	Gerome Burlats <gerome.burlats@smile.fr>
diff --git a/package/Config.in b/package/Config.in
index 3213c4a9b4..ed7d9555b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1144,7 +1144,6 @@ menu "External python modules"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
-	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pycups/Config.in"
diff --git a/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
deleted file mode 100644
index 7ac9d7af9f..0000000000
--- a/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 57c563f8b47a56feefc0a8bcbef05f4b54280549 Mon Sep 17 00:00:00 2001
-From: mmbutter <mario.butter@gmail.com>
-Date: Tue, 9 Jun 2020 11:50:41 -0500
-Subject: [PATCH] Fix problem with re-raise exceptions in wrapped functions.
-
-[Retrieved from:
-https://github.com/whilp/cli/commit/57c563f8b47a56feefc0a8bcbef05f4b54280549]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/cli/app.py | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/cli/app.py b/lib/cli/app.py
-index 7b6db52..f487ab4 100644
---- a/lib/cli/app.py
-+++ b/lib/cli/app.py
-@@ -240,6 +240,9 @@ def run(self):
-         try:
-             returned = self.main(*args)
-         except Exception, e:
-+        	elif isinstance(e, self.reraise):
-+        	    # raising the last exception preserves traceback
-+        	    raise
-             returned = e
- 
-         return self.post_run(returned)
diff --git a/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
deleted file mode 100644
index 75869d6d23..0000000000
--- a/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2af95cff5609142ec14efdf13b394f9b0121ab2e Mon Sep 17 00:00:00 2001
-From: mmbutter <mario.butter@gmail.com>
-Date: Thu, 11 Jun 2020 15:50:03 -0500
-Subject: [PATCH] except statement changed slightly in 2.6. This could cause
- problems in newer versions. Updated to the new format.
-
-[Retrieved from:
-https://github.com/whilp/cli/commit/2af95cff5609142ec14efdf13b394f9b0121ab2e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/cli/app.py | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/lib/cli/app.py b/lib/cli/app.py
-index f487ab4..45256b8 100644
---- a/lib/cli/app.py
-+++ b/lib/cli/app.py
-@@ -239,10 +239,10 @@ def run(self):
-             args = ()
-         try:
-             returned = self.main(*args)
--        except Exception, e:
--        	elif isinstance(e, self.reraise):
--        	    # raising the last exception preserves traceback
--        	    raise
-+        except self.reraise:
-+            # raising the last exception preserves traceback
-+            raise
-+        except Exception as e:
-             returned = e
- 
-         return self.post_run(returned)
-@@ -420,7 +420,7 @@ def pre_run(self):
-         """
-         try:
-             ns = self.argparser.parse_args()
--        except SystemExit, e:
-+        except SystemExit as e:
-             if self.exit_after_main:
-                 raise
-             else:
diff --git a/package/python-pycli/Config.in b/package/python-pycli/Config.in
deleted file mode 100644
index e1ce3b99a6..0000000000
--- a/package/python-pycli/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_PYCLI
-	bool "python-pycli"
-	help
-	  The cli package is a framework for making simple, correct
-	  command line applications in Python.
-
-	  https://pythonhosted.org/pyCLI/
diff --git a/package/python-pycli/python-pycli.hash b/package/python-pycli/python-pycli.hash
deleted file mode 100644
index f0890e83a9..0000000000
--- a/package/python-pycli/python-pycli.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5 from https://pypi.python.org/pypi/pycli/json
-md5 89c487e7c8068ce05d63394d2ae7ebad pyCLI-2.0.3.tar.gz
-# Locally computed
-sha256  bc53e6c5db031ae1c05d131641f153d22a201c5e82cc8c9324a945752efbb622  pyCLI-2.0.3.tar.gz
-sha256  591490b2ef462a4ad2be1aae5dd47738cb17e191c82d3ba38c3ae906d288e6ba  lib/cli/__init__.py
diff --git a/package/python-pycli/python-pycli.mk b/package/python-pycli/python-pycli.mk
deleted file mode 100644
index 7aff1c6200..0000000000
--- a/package/python-pycli/python-pycli.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-pycli
-#
-################################################################################
-
-PYTHON_PYCLI_VERSION = 2.0.3
-PYTHON_PYCLI_SOURCE = pyCLI-$(PYTHON_PYCLI_VERSION).tar.gz
-PYTHON_PYCLI_SITE = https://pypi.python.org/packages/95/fc/b2d86a5fbdac4072bcf70b01674b612e1a13026f54962c878fe3eca36fd1
-PYTHON_PYCLI_LICENSE = ISC-like
-PYTHON_PYCLI_LICENSE_FILES = lib/cli/__init__.py
-PYTHON_PYCLI_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
