Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69309C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:30:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C1176115A
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C1176115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14225614E5;
	Wed, 22 Sep 2021 19:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tNxa6yDzfBb; Wed, 22 Sep 2021 19:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 637D3614CA;
	Wed, 22 Sep 2021 19:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86BBD1BF9B4
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7254341596
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SG7v3WOw37Yc for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:28:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D30A441598
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:28:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B5F358C9E5; Wed, 22 Sep 2021 19:26:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:16:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c28924920d6df13a61879e3b301f71dd5edf2880
X-Git-Newrev: 3491f34d9ed97ac5980ff4a450367914b6985ff1
X-Patchwork-Hint: ignore
Message-Id: <20210922192612.B5F358C9E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: security bump to
 version 21.2.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3491f34d9ed97ac5980ff4a450367914b6985ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- SECURITY: Stop splitting on unicode separators in git references,
  which could be maliciously used to install a different revision on the
  repository. (#9827)
- Update hash of LICENSE.txt (update in year)
- Update indentation in hash file (two spaces)

https://pip.pypa.io/en/stable/news/#v21-2-4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pip/python-pip.hash | 6 +++---
 package/python-pip/python-pip.mk   | 4 ++--
 package/python3-pip/python3-pip.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 58bc239154..69214110f8 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5	7d42ba49b809604f0df3d55df1c3fd86  pip-20.0.2.tar.gz
-sha256	7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f  pip-20.0.2.tar.gz
+md5  efbdb4201a5e6383fb4d12e26f78f355  pip-21.2.4.tar.gz
+sha256  0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b  pip-21.2.4.tar.gz
 # Locally computed sha256 checksums
-sha256	5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
+sha256  23a7361c2b1581028bc623b9da2bd24997abcaa4781ace6ad444a37944f8dae1  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 71f76e2842..ba7134e235 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-pip/python3-pip.mk
-PYTHON_PIP_VERSION = 20.0.2
+PYTHON_PIP_VERSION = 21.2.4
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
index 58e3c06c39..5e20b06865 100644
--- a/package/python3-pip/python3-pip.mk
+++ b/package/python3-pip/python3-pip.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-pip/python-pip.mk
-PYTHON3_PIP_VERSION = 20.0.2
+PYTHON3_PIP_VERSION = 21.2.4
 PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
+PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
 PYTHON3_PIP_SETUP_TYPE = setuptools
 PYTHON3_PIP_LICENSE = MIT
 PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
