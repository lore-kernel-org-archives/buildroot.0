Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A97E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F248156D;
	Sun, 21 Dec 2025 22:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xj13XKIRLwKT; Sun, 21 Dec 2025 22:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F628156F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355150;
	bh=OIZUulTyW6E3bU9UuAYIbXcXOCPWLXTE/6NkouVxPkw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rzHA73rHPkoa1v0cUda61OJ0b7GPDxYSaEHGJvEPkMtGynmV4E/0Db/PyuFCsCFuT
	 Fr8e+jS0r5BNNojCvWxfzJlpojhEW4Ng4vGkhd8Li2P5VH6sYRfAIaszrumHy6Iw2B
	 uKDe4Ko7v4sOI0vzGwPfJkbSims8/HOS8/JDHBArgYSFa4H9qxFTRvBdj8WyHf+4RE
	 yjitPQmpKdNtdJVk1zDx+GqvUKjYC1cXof7yvaJS1xSD/q3cBuwQQlfzX95ZR93v46
	 1vH1KSczr9ugqcvSjNrLMw2J48yuV23/3jTZ++zGlCrk/d4/xA41F8Vuls7xu5EKBn
	 UBMh3/WeoKsZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F628156F;
	Sun, 21 Dec 2025 22:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA851A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C8FA4078E
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rElN5eQ5HjOS for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E4A40778
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49E4A40778
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 462EE874B9; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fe8f09e74a09f6cffed020af58f2c0a02b46e8e
X-Git-Newrev: 98181333f5584b63aa71065850e3d1e2649e833e
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.462EE874B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-docutils: bump version to
 0.22.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=98181333f5584b63aa71065850e3d1e2649e833e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://docutils.sourceforge.io/HISTORY.html#release-0-22-4-2025-12-18

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-docutils/python-docutils.hash | 4 ++--
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index b435135f15..7393c029a5 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  98a6168e7f4719c9fd90184e88157656  docutils-0.22.3.tar.gz
-sha256  21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd  docutils-0.22.3.tar.gz
+md5  58f718cd60a87725d4dac56ae427c9f8  docutils-0.22.4.tar.gz
+sha256  4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968  docutils-0.22.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6ab4f27c76c74f96e5e692da5944a6f82968f3bddaac5660a4aa723e70eb5d8f  COPYING.rst
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 20773fae91..bad9ce56af 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.22.3
+PYTHON_DOCUTILS_VERSION = 0.22.4
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/d9/02/111134bfeb6e6c7ac4c74594e39a59f6c0195dc4846afbeac3cba60f1927
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/b6/03bb70946330e88ffec97aefd3ea75ba575cb2e762061e0e62a213befee8
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.rst
 PYTHON_DOCUTILS_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
