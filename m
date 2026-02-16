Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DD6E7BDA1
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 11:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD90383806;
	Mon, 16 Feb 2026 11:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1AMNp8PuHCh; Mon, 16 Feb 2026 11:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C090083705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771242509;
	bh=t368TrWc5M1262ob2xI89mCPyPoYsRlIsn0hImcMsW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fCQzawLKvJ2agzBMF0PO1dgCm/lexUXtN6pnirF54Be3+eSXUvEIrpMj3wz/DUbGD
	 zdzjpDUPUMIpmhsQqh84XQkCYT+oPEawUejp0leEtRGVDPcGzJ4ijQI++e2PHY0bIQ
	 XegpC016L7hmE7GhtoV6+d3ux6XBQK6nCBjvR2Nw07PS5xcTpOwsN9Dx+AC0qbbnKg
	 VQ3SwHhe28/AXpIb/fRU/MAQO0KEe+VdOuar0S0w1rV4PxFSjzQV3e0Cfx7MroEyro
	 GfH7N6cP6dYm2vwtBAhmcZsEwC5ToEWD0RTIO5hVTrM1twZokjIZG1tLvpmmmaYm2T
	 KOVhwiVqmKdig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C090083705;
	Mon, 16 Feb 2026 11:48:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 720F3396
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E7F834E8
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puR7aDNSKZBE for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8EC83438
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C8EC83438
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4056F86EA0; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 12:44:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46baf529c5847ca814f94be3856dbd104ed88b73
X-Git-Newrev: beabd8baeef37f1780f52e3c9d464c611731ba98
X-Patchwork-Hint: ignore
Message-Id: <20260216114823.4056F86EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasyncore: bump version to
 1.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/beabd8baeef37f1780f52e3c9d464c611731ba98
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes:
https://github.com/simonrob/pyasyncore/releases/tag/v1.0.5

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pyasyncore/python-pyasyncore.hash | 4 ++--
 package/python-pyasyncore/python-pyasyncore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasyncore/python-pyasyncore.hash b/package/python-pyasyncore/python-pyasyncore.hash
index ee4665fe5e..21c72176b9 100644
--- a/package/python-pyasyncore/python-pyasyncore.hash
+++ b/package/python-pyasyncore/python-pyasyncore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasyncore/json
-md5  f97e2b69f1fa11470867b395c2fabf84  pyasyncore-1.0.4.tar.gz
-sha256  2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6  pyasyncore-1.0.4.tar.gz
+md5  2ad79027ce567b5c899010a7258de6b9  pyasyncore-1.0.5.tar.gz
+sha256  dd483d5103a6d59b66b86e0ca2334ad43dca732ff23a0ac5d63c88c52510542e  pyasyncore-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
index d86ac2cad8..a6d0fce13e 100644
--- a/package/python-pyasyncore/python-pyasyncore.mk
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASYNCORE_VERSION = 1.0.4
+PYTHON_PYASYNCORE_VERSION = 1.0.5
 PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
-PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/25/6e/956e2bc9b47e3310cd524036f506b779a77788c2a1eb732e544240ad346f
+PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/4e/43/035dfe0cb01687c1940fdc008f46a43c41067e226e862df49327469764a0
 PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
 PYTHON_PYASYNCORE_LICENSE = PSF-2.0
 PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
