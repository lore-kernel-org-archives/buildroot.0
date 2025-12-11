Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FCED4335A
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 22:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D072260754;
	Thu, 11 Dec 2025 22:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQV1YAJUhu3a; Thu, 11 Dec 2025 22:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E117E60780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765492206;
	bh=ZqpVQwt1pvmTi6amkzFPIVQ4lvNW/HGxlct8SkTO5Vg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JQ9D6RrvaMLqUr4aoHyXZr+d1zPc+tpmcyc5BnynOtqUdEOPS6og/TwnvSu3zhEvL
	 yCIjF8MdbHJtYs/dYGT8Xh/hmFiz7q++QkbNG6ra2WiKFEU7lQp3nycJm54tpWOUgJ
	 0WdTBpg4wJhf0vYETMYP1C7xSpuIDKTQPkqMWutKSLVFRI3jww+S8WgxEZla17jqrt
	 FwUts0T9rhdSzFsJU4ugWNFawU4agglwURbcSKUbYgBQa0i3FUpouBdB//he+S9oU8
	 U5DY0+NmEphbsn2aKt+cdC595NdoTWvalrMZ7/4pAJI07n5jMb6BpIGXp2nHBxxIFX
	 /jSulUYvxRhXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E117E60780;
	Thu, 11 Dec 2025 22:30:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5DF22E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C385F40206
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zk1Wh8v9Klin for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 22:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ACDD401EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ACDD401EC
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0C0486C31; Thu, 11 Dec 2025 22:30:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 23:21:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 974b5ce907e4b14571e528afccd00e55dc21ac3e
X-Git-Newrev: b0aa7e5a23895627e28cbcd33f0b998c59023148
X-Patchwork-Hint: ignore
Message-Id: <20251211223002.F0C0486C31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: security bump
 version to 4.61.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0aa7e5a23895627e28cbcd33f0b998c59023148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/fonttools/fonttools/releases/tag/4.61.0

Fixes CVE-2025-66034:
https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
