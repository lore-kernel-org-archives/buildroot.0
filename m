Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED76E67497
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 034E6407BD;
	Sun, 21 Dec 2025 22:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_fOT6MeRBqZ; Sun, 21 Dec 2025 22:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B8D40779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355159;
	bh=jlaqpYziuwfU+CkVwPpqfE6ssU7pU5P8Hf600EyU0UA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J8j3AzM1fWaB6MsCake3QIQPDnd2UZrbYuIVOknWAfbkr0J1/QEi4qMtIa18sdEJz
	 dLpMDUMiMtU5AvwK4jBJtAnQVc1p9nAgzsZ+vYmg+jCXdP9Z3n8GE7T2e13XWZrTQ9
	 vbQ+nQ0/4HgFwQasmLYs8Xi0TfP0qzZnFswnCFBtvIplIEmjgkgtuJZkTOyQYw2Oq5
	 nvNMlqwwvWCMAEdfGVM0A3FVHu/rnqHLSRuQxmr97OxP2gd+6Ej+Et8uz4e3t1EEje
	 JICJYYA6dqQbQgiUMiW8KcCf3UbbiluGJA2GNb4wWbTkmtAazJRCxrORQN7M1nBay8
	 3DiT3nSIMVR1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B8D40779;
	Sun, 21 Dec 2025 22:12:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFF0119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 608164077F
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAkbWqi3vSqZ for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9530C4078C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9530C4078C
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94555870BB; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb918373c448bd472ed81eed50da7bfb2bea86c2
X-Git-Newrev: 67be39af9196e1d9cf3b1afd5a6677dac2f1732e
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.94555870BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump version to
 1.42.14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67be39af9196e1d9cf3b1afd5a6677dac2f1732e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/boto/botocore/blob/1.42.14/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 8f2792c829..6b4d788410 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  ed7c48a9f7b0b422b71e6507ab14f957  botocore-1.42.5.tar.gz
-sha256  37bfc487f14286d9795920807fcb8318b940835b18fff6bec5253449f377136f  botocore-1.42.5.tar.gz
+md5  5905039db132a93c73a18ad9e497bb43  botocore-1.42.14.tar.gz
+sha256  cf5bebb580803c6cfd9886902ca24834b42ecaa808da14fb8cd35ad523c9f621  botocore-1.42.14.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index c3770b4833..3d7fe258bb 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.42.5
+PYTHON_BOTOCORE_VERSION = 1.42.14
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/8c/46/5b40b1deb780869ca9f0c1de47062a78a0494b53d6f9d6bad10fc38eef9d
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/3f/50c56f093c2c6ce6de1f579726598db1cf9a9cccd3bf8693f73b1cf5e319
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
