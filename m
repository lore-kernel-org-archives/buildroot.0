Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E40F483EE
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DABFA405EE;
	Mon, 23 Mar 2026 19:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3yhi7wOA8Zw; Mon, 23 Mar 2026 19:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B2540971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295710;
	bh=8mdFV1MRryaAxpsAtcb4ga+XryjULnb5aGruCV687cA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JSg+N5WlV5BTcmdsH0gw7Mjk3bce6MIHTO/lwyQyODux00lB5E7/DfHEU0zf5tZu9
	 FsGuSEHpOR3WLNBcn9MX0VC552zJc1dIm8MO6o5TvZ7NlO8D4RMaMs3IM2LvhxOqOd
	 US2iMBCtEW69Klzgn6EgEowv3FGyP+OJUU2gqPVno2auV4bq5E3CZTpHAicZQTFGGR
	 5xdwZMkCUp0159pqydCVduxA3jr/RrPvnWEiyE001yDgjpWfHcayRzJ7EzRGq9SnA4
	 jaysxNcyjSPI9zTEJVwyAgXREYRXbYoJW/14EyP6Q6Z+5cYrDnWPHdNctvlEGbbFai
	 fU0+6LP6Xk7Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0B2540971;
	Mon, 23 Mar 2026 19:55:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAA83F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC95240A50
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ3hURYCdTHY for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F65940971
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F65940971
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D93D84C28; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:20 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dcbaf17cbc6f0362ebeb9c1f90b1bb82de78271c
X-Git-Newrev: 14f401ee7882c5da2cdd353d53ce4ee3495a2d86
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.9D93D84C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-pyasn1:
 bump version to 0.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/14f401ee7882c5da2cdd353d53ce4ee3495a2d86
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changelog: https://github.com/pyasn1/pyasn1/blob/v0.6.1/CHANGES.rst

Updated project URL according to https://pypi.org/project/pyasn1/

Updated license hash due to copyright year bump:
https://github.com/pyasn1/pyasn1/commit/acb78299d1270a2fea0d11e5509777b7c5777f3f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 593f46dcdcfa95f587efa05a57e796f20293d70b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyasn1/Config.in          | 2 +-
 package/python-pyasn1/python-pyasn1.hash | 6 +++---
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyasn1/Config.in b/package/python-pyasn1/Config.in
index fea63813b9..fb576ffb71 100644
--- a/package/python-pyasn1/Config.in
+++ b/package/python-pyasn1/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_PYASN1
 	help
 	  ASN.1 types and codecs.
 
-	  https://github.com/etingof/pyasn1
+	  https://github.com/pyasn1/pyasn1
diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 4347a43c46..4268d82c38 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  dffae4ff9f997a83324b3f33fe62be54  pyasn1-0.4.8.tar.gz
-sha256  aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba  pyasn1-0.4.8.tar.gz
+md5  75cdc260597f112fdfefec85379e710d  pyasn1-0.6.1.tar.gz
+sha256  6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034  pyasn1-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.rst
+sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 60050bef18..7a5cde40fb 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.4.8
+PYTHON_PYASN1_VERSION = 0.6.1
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/db/fffec68299e6d7bad3d504147f9094830b704527a7fc098b721d38cc7fa7
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
