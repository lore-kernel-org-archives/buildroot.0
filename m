Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A36CD6E2AF
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E995861188;
	Thu, 18 Dec 2025 16:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIlc1sbDwVgA; Thu, 18 Dec 2025 16:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21DD460D74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075714;
	bh=hj5hiZJS8bPObuDjMOGYfCjWVQF64TmD1izqGwCm3/0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E/ccuKCgAcF98lW7MvamKfk3fQ2HFHGEWcvTTizLbBlHrx3kJVlX40t6WMuwh9p7m
	 DU5oRqzlYQHmhwTafrRTswFQ+mLi1k50dQB8nALQlsFFTA2Vek/9Pe14OtZUBmSwy6
	 KehdTd3S+3rmEw6XrYRxrRSFModzPWJ37vut680qRltC66ZkP43lWKWeY9xg+7vX6T
	 Iq2GslOO67OSNObxzGauSsbvRJoyWwFhI53CQPp+iKvzH/9xdSczNj9CgPiAvSBJDJ
	 707cL6ycMmkqgzYvg89W1Z3iLmHv/kX/ciqJln2UhK8LPA63honCnrpaLSe7jkc8fN
	 L4lqodi2pj5KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21DD460D74;
	Thu, 18 Dec 2025 16:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34ED11A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCD2583DB4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwFk4Lwpcc3Q for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F0B83DDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5F0B83DDE
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B45F08229C; Thu, 18 Dec 2025 16:35:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:55:19 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cdbd1f62fcf17ed1f4349d072e08012b677fc65f
X-Git-Newrev: 701e9685f7effa9cbd3b4088106951b7936a84ef
X-Patchwork-Hint: ignore
Message-Id: <20251218163507.B45F08229C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-fonttools:
 security bump version to 4.61.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=701e9685f7effa9cbd3b4088106951b7936a84ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

https://github.com/fonttools/fonttools/releases/tag/4.61.0

Fixes CVE-2025-66034:
https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b0aa7e5a23895627e28cbcd33f0b998c59023148)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 49f1ca0235..b83663e8fb 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  b4b79d23865d50084d4c05defa186fc9  fonttools-4.60.1.tar.gz
-sha256  ef00af0439ebfee806b25f24c8f92109157ff3fac5731dc7867957812e87b8d9  fonttools-4.60.1.tar.gz
+md5  55a7d3d40e191410bbe604d0d795baa4  fonttools-4.61.0.tar.gz
+sha256  ec520a1f0c7758d7a858a00f090c1745f6cde6a7c5e76fb70ea4044a15f712e7  fonttools-4.61.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 3094b1985c..592ef51354 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.60.1
+PYTHON_FONTTOOLS_VERSION = 4.61.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/4b/42/97a13e47a1e51a5a7142475bbcf5107fe3a68fc34aef331c897d5fb98ad0
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/33/f9/0e84d593c0e12244150280a630999835a64f2852276161b62a0f98318de0
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
