Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A7CD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 104E86085D;
	Mon, 11 May 2026 10:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8QVCwxFO2VT; Mon, 11 May 2026 10:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3167660860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778494938;
	bh=VvhiGPIfdKASkIGiun4EclHxmMA6Qa3GURwzrxLTw+Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e5+a9OhzXaZusUDWXdL40Y4K9HfGM9ATzqgA7ZbzuIj4AL3JwPpp82yVk4RcpllcU
	 sRh7D6xgtw08DlSqFZKCeWlYN28jxEag8MK4AZ7URrYQHpyKuQA3d/Pgepj/LJ2eGU
	 rjFyu0Y03EZzi7p7FAg0JMXgPDDBbYaLFlk4z7WzORHNwPrKeY85Nc1hDvAH3XM/un
	 YNUrOZCut070wwig07FHUX2aENOKU0xB1BXw7nUUadCnNuCV1gDbd6eDcQ0FVkbQ+c
	 fHCPWKOE6hMqBN6EcQcZoKL5ivcANIzrSXD01vppqN9hYl+eTSh7NrxhpQ7XrNTQI/
	 +FB7beZWvNsRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3167660860;
	Mon, 11 May 2026 10:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CCC8272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F236784173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92isdB3snoeo for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 167CA84166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 167CA84166
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:22:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D5F285DB5; Mon, 11 May 2026 10:22:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 12:20:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3c662eac9968dcfb598f837d639d51de7217627
X-Git-Newrev: aa8e6bc395fe11070cab29f2ef8f848a1a871c4e
X-Patchwork-Hint: ignore
Message-Id: <20260511102211.6D5F285DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/python-setuptools: bump to
 version 82.0.0"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa8e6bc395fe11070cab29f2ef8f848a1a871c4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This reverts commit 51365ff06379aaf6fcc9a751e8ff32ac694f3e92.

This breaks u-boot < v2025.10 builds using binman, so revert it for now
given that v2025.10 is a quite recent release.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/14249332016
And many more.

Longer term we either want to upgrade all the defconfigs (which will not fix
the issue for external users) or find a way to patch older u-boot versions.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 0236a13999..d0ed270e9c 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  6e65b88d2466b35e86e5187b99502b1c  setuptools-82.0.0.tar.gz
-sha256  22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb  setuptools-82.0.0.tar.gz
+md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
+sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3c94931fbe..e013000c57 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 82.0.0
+PYTHON_SETUPTOOLS_VERSION = 80.9.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/82/f3/748f4d6f65d1756b9ae577f329c951cda23fb900e4de9f70900ced962085
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
