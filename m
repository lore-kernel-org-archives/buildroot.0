Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D988EE9A04A
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05F48233F;
	Thu, 19 Feb 2026 13:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTFtUYbC7fKB; Thu, 19 Feb 2026 13:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F80782339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771508286;
	bh=irXacIF76d4kuXkeLhLYZd4KIcSpTtaH4qDclkM6eHs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J5Z80zqAMNatEk99IRE26nvnQTIxMyVnlstOmgA34+OSdm2njqa7Xxm0x9QchYMpv
	 nZXekWm2KCGISmGdpOVHRKqWl9RZYT20jwR1b7NZZkCtohJ5ThN4RGRc/v31f/mmw7
	 i1Dxh7+kR3A7CgSGt4HcGPrlJbM3QBxtERGtLv2/zqLurF+wxahR1UXP9zdn7dF9wW
	 PiiP9MU+VJxyITB5xIRvlbeyPMC/hOf+WbjIpXU97Lo4cW32NmKjQSpaGWrzycP9vW
	 JoRCZReemfiu4x2FN2alRm6nTf5fO8mCQFq3jScczAfxoPkcfPKD+FIJ/X3eRL0/Xk
	 IOX21Cg2HrEeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F80782339;
	Thu, 19 Feb 2026 13:38:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EF44206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E1B82339
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yocG5z4ngfXP for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32ECF81E9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32ECF81E9A
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:38:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21DE68702F; Thu, 19 Feb 2026 13:38:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 14:36:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 127f36b406e80a6e5f773ce6e588a5ba9e5b3974
X-Git-Newrev: d3d55662923f9aa898ac4a2663bdce6cadfd421d
X-Patchwork-Hint: ignore
Message-Id: <20260219133804.21DE68702F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-anyio: bump to version
 v4.12.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3d55662923f9aa898ac4a2663bdce6cadfd421d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here:
https://anyio.readthedocs.io/en/stable/versionhistory.html

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 2a02bc9d37..d25c1a2bad 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  a026af4a3b485699718761b1b44ad1df  anyio-4.12.0.tar.gz
-sha256  73c693b567b0c55130c104d0b43a9baf3aa6a31fc6110116509f27bf75e21ec0  anyio-4.12.0.tar.gz
+md5  10e3ba7d02402b6605d834a1e4881a1d  anyio-4.12.1.tar.gz
+sha256  41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703  anyio-4.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 035e2298e8..32b4a84ef1 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.12.0
+PYTHON_ANYIO_VERSION = 4.12.1
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/16/ce/8a777047513153587e5434fd752e89334ac33e379aa3497db860eeb60377
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/96/f0/5eb65b2bb0d09ac6776f2eb54adee6abe8228ea05b20a5ad0e4945de8aac
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
