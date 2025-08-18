Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7BFCA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28664406E0;
	Mon, 18 Aug 2025 20:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8et85AGMDrLR; Mon, 18 Aug 2025 20:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3998840701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3998840701;
	Mon, 18 Aug 2025 20:27:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55CE1E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C65140248
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTCFgFWsNyDS for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6FD8040240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FD8040240
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FD8040240
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:27:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 04ED41A0614
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:27:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D46C4606A6;
 Mon, 18 Aug 2025 20:27:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 456A41C22C93E; 
 Mon, 18 Aug 2025 22:27:14 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Mon, 18 Aug 2025 22:27:09 +0200
Message-ID: <20250818202709.3216273-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755548840; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=RN2FphHmMY0VXgV/XwnujJYM/razmDq5uPhNAcIon94=;
 b=Vlpuj7Wb7xjrkVYBqzZ0ZeyRJOb+YK6jVuLCgwq4DPjr4uWw2nvlvLDwF/m7N9SyjSmgn4
 yfAQzMFPv9MdcR/kxJntVP4LfaJz4I9kYetlXT42rlQD0KcbhJN5VIKjjtEA52AF0GEoFh
 V5u1GGd685o+yMY+ApZeqs8S1fQHGiKS/+QIA3pTdugLZQ90fNn0Dzt7+31ctKsiq/7WsH
 D9YpjnSZtifdHaDKndVvnVAw12WiLfyiEx79sEhJj7vieq/u4ZBNC9o9HzHoISuFKhnJ4l
 bAGHdcU41Y3h/+sOEGURMKqDb0v3mE49vfFkauThIcm0f5IudFBbupJrNUlI4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Vlpuj7Wb
Subject: [Buildroot] [PATCH] support/testing: use again the default
 BR2_BACKUP_SITE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 559bb33ae71dd2358ca2314ccb24b56cc3809fc1, which
was disabling BR2_BACKUP_SITE in our tests with the following
reasoning:

    support/testing: do not use s.b.o

    Currently, the runtime tests will use the sources.buildroot.org backup
    mirror, which is the default setup.

    However, in some cases we do not want to use the backup site, because we
    want to ensure that the download actually works.

    This is the case for vendored packages, like cargo or golang packages,
    for whbich we want to check that gthe download still works when we
    update the rust or go versions, or when our download helpers change.

    So, disable the use of the backup site in all runtime tests, and drop
    the no-longer needed special cases.

    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
    Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

However, not using the backup site is causing a LOT of random failures
in Gitlab CI, making the results barely usable. Since it's more
important to get real failures than random ones due to download
issues, let's re-enable BR2_BACKUP_SITE in our testing infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py               | 1 -
 support/testing/tests/download/test_git.py      | 5 ++++-
 support/testing/tests/download/test_gitforge.py | 5 ++++-
 support/testing/tests/download/test_ssh.py      | 4 +++-
 support/testing/tests/package/test_rust.py      | 1 +
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 4f020e8a93..9fb9dffc53 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -37,7 +37,6 @@ class BRConfigTest(unittest.TestCase):
         super(BRConfigTest, self).__init__(names)
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
-        self.config += '\nBR2_BACKUP_SITE=""\n'
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 3cf98f6456..ba52e03ef5 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -7,7 +7,10 @@ import infra
 
 
 class GitTestBase(infra.basetest.BRConfigTest):
-    config = ""
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
     gitremotedir = infra.filepath("tests/download/git-remote")
     gitremote = None
 
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
index 477c365a34..e1ac35ec67 100644
--- a/support/testing/tests/download/test_gitforge.py
+++ b/support/testing/tests/download/test_gitforge.py
@@ -5,7 +5,10 @@ import infra
 
 
 class GitforgeTestBase(infra.basetest.BRConfigTest):
-    config = ""
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
 
     def setUp(self):
         super(GitforgeTestBase, self).setUp()
diff --git a/support/testing/tests/download/test_ssh.py b/support/testing/tests/download/test_ssh.py
index 7d6ac3aaf7..126002a355 100644
--- a/support/testing/tests/download/test_ssh.py
+++ b/support/testing/tests/download/test_ssh.py
@@ -7,7 +7,9 @@ import infra
 
 
 class SSHTestBase(infra.basetest.BRConfigTest):
-    config = infra.basetest.MINIMAL_CONFIG
+    config = infra.basetest.MINIMAL_CONFIG + '''
+BR2_BACKUP_SITE=""
+'''
     sshd_test_dir = infra.filepath("tests/download/sshd")
     sshd = None
 
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 8160cb6053..763125ca20 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -70,6 +70,7 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
         BR2_PACKAGE_RIPGREP=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        BR2_BACKUP_SITE=""
         """
 
     def setUp(self):
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
