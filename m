Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C370F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE0440A23;
	Sun, 15 Mar 2026 22:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4q0kFyByJg2; Sun, 15 Mar 2026 22:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 372CC409FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613091;
	bh=ef34/vbhB1KBKEGoIydvvcDsbv0wKEVH2vVi2NYAmNw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bM9ODcUnWK7ikg10XnnTcTh+BLlBKtBQOBYKgbjLsZzmJ9rD64o0CLIOxZXbVaFt8
	 LKv5aFmPN8mkFxWbh9fIEHRoTk8gEx3ghP2avkC25TGIdqR6h/bw+7EAl3lgrNkBy3
	 k2mQLjiyL8e0gTgZ40CU3KY9M+t1Ymq929+81HOB98X/l0U9kxGu6sBbX/8z/f9rtG
	 2075AmZFEKKiHJg+hdg9zQRa6PfZBsp4tH58JH8FG7qA1RNLabmLqiIjMsDz9RqouN
	 oQ/5ptJyibeq4KDV0ppOAl7VvH5FTARCgKezRZUW7jV14GGKRT1U1tBIj0yt+HfXiJ
	 TG9ehSWA6+s/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 372CC409FD;
	Sun, 15 Mar 2026 22:18:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CDE0357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC6F5409C0
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VikKhWZF-aVW for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC08040930
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC08040930
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A3048285B; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3fee9b0987c4530031cf0e5a1225bdffda48a8a
X-Git-Newrev: 9b0a90c10c03c66109b4bfcf64eb6461ecfd64b3
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.2A3048285B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect: bump version to
 1.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b0a90c10c03c66109b4bfcf64eb6461ecfd64b3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/scrapy/cssselect/blob/v1.4.0/CHANGES
"Switched the build system to ``hatchling``."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cssselect/python-cssselect.hash | 4 ++--
 package/python-cssselect/python-cssselect.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index d9b89d1c61..9e7f8e6244 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5  e0148abb13430399cbdbc173c3fa1c80  cssselect-1.3.0.tar.gz
-sha256  57f8a99424cfab289a1b6a816a43075a4b00948c86b4dcf3ef4ee7e15f7ab0c7  cssselect-1.3.0.tar.gz
+md5  3aca561a6fe4e51d2993e0a0f604e30a  cssselect-1.4.0.tar.gz
+sha256  fdaf0a1425e17dfe8c5cf66191d211b357cf7872ae8afc4c6762ddd8ac47fc92  cssselect-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 1a5087f495..d58aea52a8 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.3.0
+PYTHON_CSSSELECT_VERSION = 1.4.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/72/0a/c3ea9573b1dc2e151abfe88c7fe0c26d1892fe6ed02d0cdb30f0d57029d5
-PYTHON_CSSSELECT_SETUP_TYPE = setuptools
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/ec/2e/cdfd8b01c37cbf4f9482eefd455853a3cf9c995029a46acd31dfaa9c1dd6
+PYTHON_CSSSELECT_SETUP_TYPE = hatch
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
