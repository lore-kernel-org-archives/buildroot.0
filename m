Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF42EEEB57F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5713781545;
	Thu,  1 Jan 2026 09:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0aZ5Wwil71m; Thu,  1 Jan 2026 09:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C6E815CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260556;
	bh=WxCIWEiq6DkE9ma4jB6kfUN2Rwja0VCZGNNiNXxA7QE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Orp3x331inBY9gBKwPXhtDkrN30omTEeGSLYZZP3np5kLpByAokbcJ5tTtnIup8Gn
	 AUnbggnT7c9JFMwZsodMNh+8YpuRkc+DlBnkyL2kk/3ufOmzdcb5C8mufWzD5zV3ug
	 2xH+gpSR46GlScFdTd6KJU44yb4TdKPCXc267vJyfjv0MlL4JX79JmzZVcBCZvQt4/
	 lrFuVIQB46cXnHDxw6oSOHjmOsFtfmKyu9JM3btyhkhBolcWSgPk3qqsQJIVqidiB3
	 +3zt10KNYSl3gHDSZ5k8nzvpxbpB4uVomjcqJxqkjFIiStTtveue/FsSHCbNPfVtsJ
	 u2qrc8t3s1sKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C6E815CA;
	Thu,  1 Jan 2026 09:42:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22BB3438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09DDF404A0
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDkiAAqdG-fR for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 436284047F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 436284047F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 201BA87CDE; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:32:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c382be00da0f69505c71b0205e8e6ad5c3c97ca
X-Git-Newrev: 1115aa64a0882487d9db604cf92c0eb9cf4d90e3
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.201BA87CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-setuptools: bump to
 version 80.9.0.20251223
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1115aa64a0882487d9db604cf92c0eb9cf4d90e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index 45b229ece6..8283b8ec10 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  c9a6190884fc8a12c93963333f205f72  types_setuptools-80.9.0.20250822.tar.gz
-sha256  070ea7716968ec67a84c7f7768d9952ff24d28b65b6594797a464f1b3066f965  types_setuptools-80.9.0.20250822.tar.gz
+md5  64117c464d8fbeca5851c08a5c22fd56  types_setuptools-80.9.0.20251223.tar.gz
+sha256  d3411059ae2f5f03985217d86ac6084efea2c9e9cacd5f0869ef950f308169b2  types_setuptools-80.9.0.20251223.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 463cc3b6b5..4ad09791d6 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20250822
+PYTHON_TYPES_SETUPTOOLS_VERSION = 80.9.0.20251223
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/19/bd/1e5f949b7cb740c9f0feaac430e301b8f1c5f11a81e26324299ea671a237
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/00/07/d1b605230730990de20477150191d6dccf6aecc037da94c9960a5d563bc8
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
