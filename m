Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C87CE7BDA3
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 11:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B35835CA;
	Mon, 16 Feb 2026 11:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwFDMPm-Pwv5; Mon, 16 Feb 2026 11:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B53083438
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771242505;
	bh=VHDFrmo1l0fxzA52z4vCwdRCaRg/sFcUhOtq0lrATjs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mBouAIswKdBUa/CFfiq66o9auzIcqnMyL/4nPltQhgHaNP9UHK49pLO3ZAaNWao7Q
	 87KT6EhHFyv6BRd2qhbLll45Pml64hFZIWk0a8X0ukhHfrwksvyMk2TrBZtNf2NIeL
	 60Il01XocUax3CQiVqeBCdr2kZSyF9/4RVI4FTGjDHnoBG5eUy+9SigCHMCHfLsEGg
	 rlgJ9JPjNL5YP5MOE8BPGp98VjM4H6aNaIimPggPTgX+rw6KVFsbA4NkdF4B9DWXJM
	 TbgS2opui1RixTs8aFYof2Ax3AkXVqqHymwIJiTiTVAO2AQYw39xdEXIKsPQ/VWJ9O
	 ydfsya3j5DXeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B53083438;
	Mon, 16 Feb 2026 11:48:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E1641EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42CEA607B6
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRvTXzvoa8IT for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5030D6072E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5030D6072E
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31C20867C0; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 12:43:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8340535bb354b580c63d81d791dbeea705ed873f
X-Git-Newrev: 46baf529c5847ca814f94be3856dbd104ed88b73
X-Patchwork-Hint: ignore
Message-Id: <20260216114823.31C20867C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyasynchat: bump to version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46baf529c5847ca814f94be3856dbd104ed88b73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes: https://github.com/simonrob/pyasynchat/releases/tag/v1.0.5

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pyasynchat/python-pyasynchat.hash | 4 ++--
 package/python-pyasynchat/python-pyasynchat.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasynchat/python-pyasynchat.hash b/package/python-pyasynchat/python-pyasynchat.hash
index 232f936bcc..fe911d2902 100644
--- a/package/python-pyasynchat/python-pyasynchat.hash
+++ b/package/python-pyasynchat/python-pyasynchat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasynchat/json
-md5  9fa7e3822f689b1236ca59c5f1b71415  pyasynchat-1.0.4.tar.gz
-sha256  3f5333df649e46c56d48c57e6a4b7163fd07f626bfd884e22ef373ab3c3a4670  pyasynchat-1.0.4.tar.gz
+md5  211b23ba9dfd0905ee83bfa26ea60659  pyasynchat-1.0.5.tar.gz
+sha256  36665473ae730dac51e6d7dad70f8295962120c830ab692f0a31efba32687e24  pyasynchat-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
index 2c503ea71b..55f8979805 100644
--- a/package/python-pyasynchat/python-pyasynchat.mk
+++ b/package/python-pyasynchat/python-pyasynchat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASYNCHAT_VERSION = 1.0.4
+PYTHON_PYASYNCHAT_VERSION = 1.0.5
 PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
-PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/8a/fd/aacc6309abcc5a388c66915829cd8175daccac583828fde40a1eea5768e4
+PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/ec/d2/b41df9021c12ca314146abcde7bdd3d9d37d44cc01559d7f13df459ee586
 PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
 PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
 PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
