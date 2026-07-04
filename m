Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94E9C44500
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 19:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CEC240956;
	Sat,  4 Jul 2026 19:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6UabkE23UCd; Sat,  4 Jul 2026 19:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD19F407E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783192350;
	bh=9yLl8WiyLLbFFTL6Nz28ywUO+x+Twbf8M/XMgpWImr0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=alhff7RGRwPueg+mR+a3tUEcwexI+ZhBXpTtlRvTGeD+PnmAFlbww8rbN7kDeySop
	 zi6rvdgSbSxtxu0FYBb6iZ0bZHsrJdMt9ffnikyadxPaBpxrvzzQ9bZFDiAVCBydkR
	 ls/1gpL3hcksbcfJuRhQF7J4gCVdvP3mj1ldDkmIXfE2h1hZBRBHflhoiy6Od64AUf
	 dxUo9TQCdv3lStbwcZO4tI0/CUHW3/rYRdcyELVyPb1MLKtKS5FMKF7v3D8lyIG/fU
	 E9dlRZ8/lbOAYJ5USXPVOtd/k3solmoRBnkIK5VkQ/vFw098DMnv4OAnJT46zTNpKQ
	 2JDilw2BK4Fww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD19F407E7;
	Sat,  4 Jul 2026 19:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2E5C316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88FEA407E4
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSXcPhpiPQXU for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 19:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B0514079A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B0514079A
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:12:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DFB988415; Sat,  4 Jul 2026 19:11:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 21:02:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4853fb2a1b84870d59ee1bc06b8bfc819a9d586e
X-Git-Newrev: 48f8ab703c44c2739d112bd9046749b9e2f2d732
X-Patchwork-Hint: ignore
Message-Id: <20260704191158.7DFB988415@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jc: bump to version 1.25.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48f8ab703c44c2739d112bd9046749b9e2f2d732
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here: https://github.com/kellyjonbrazil/jc/blob/master/CHANGELOG

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index d2eb47d41c..49372996e8 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  f3fbc012843d192e446462e45ab2ebe1  jc-1.25.6.tar.gz
-sha256  27f58befc7ae0a4c63322926c5f1ec892e3eac4a065eff3b07cfe420a6924a07  jc-1.25.6.tar.gz
+md5  9cf85817e3a9553b19d413f9d1ce3687  jc-1.25.7.tar.gz
+sha256  63481e34d92715781e1b094eca7d76d122a14489463d45b7f3e8180f44ea3a10  jc-1.25.7.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index 0404275277..e07fe671a2 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.6
+PYTHON_JC_VERSION = 1.25.7
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/7c/fa/f174bfb1ecfd3bdc6259b2de32052f09cccba11c9a1b733aedf618fadd05
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a9/da/7827d3389d87fa645556d595a2a437576de83f7a7d4a5fceda9c32208c0b
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
