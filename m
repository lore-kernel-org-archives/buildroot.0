Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C49E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE56640790;
	Sun, 28 Dec 2025 22:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jR8aLgGRzWsh; Sun, 28 Dec 2025 22:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F8674077F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959629;
	bh=OmpJl0+4qb/US7KVOs6ulyiStPOazszjPe+HMR8u00w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B/beW0U5NCey4g+HtUQmRGm+MRvnqhH+wMQC/BmsMBAIvkG+YuMoRQfHDPK876el0
	 mOm7la157ltUwIyfrwoWTnT1CCKsnk0COpCaVZCTg882L91Q0DhuMLdIBjYRIEJ8Ew
	 ILCqD+jffpOHH7WMpx5YSlVExCw1biHOvRlW7MRNODu7H814HG8iAZOKog/t9ePFJl
	 94MRuEJYHgW3gcKU41u5EV5Z00B2hZ37GccFppwGY9jxZG036vx1eW4MT3ea/zDOFU
	 bFGDBROVTxvxRaDgjL+zJyS0gEPQ6BNrKfNMtMVc3415snpAxNtkHpbDfIXSQUVm0T
	 zD8rFwCDIjgeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8674077F;
	Sun, 28 Dec 2025 22:07:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D6830D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB97E80DF7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ2mAonhuTyO for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A56780DFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A56780DFB
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18E7787950; Sun, 28 Dec 2025 22:06:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:02:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2952d38125d2f8f0229d7daa450f7d961d3417e1
X-Git-Newrev: d0900ca523fe5a32832351520d504619650d269c
X-Patchwork-Hint: ignore
Message-Id: <20251228220646.18E7787950@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysnmp-mibs: update tarball
 URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0900ca523fe5a32832351520d504619650d269c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysnmp-mibs/python-pysnmp-mibs.hash | 4 ++--
 package/python-pysnmp-mibs/python-pysnmp-mibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
index 52a507f4b3..4744963185 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pysnmp-mibs/json
+# md5, sha256 from https://pypi.org/pypi/pysnmp-mibs/json
 md5  01845c4595d87d3c3485c0449616cbda  pysnmp-mibs-0.1.6.tar.gz
-# Locally computed
 sha256  00fa321ca598e8a14c0ad98702bf10fb5e9d57b7d06bb99dc818fea07683720c  pysnmp-mibs-0.1.6.tar.gz
+# Locally computed sha256 checksums
 sha256  361eda483f7fac1f8cca4e16c340fa07a1cad2bf1200577a01075745233b406c  LICENSE.txt
diff --git a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
index 9772b78c91..eb9119a352 100644
--- a/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
+++ b/package/python-pysnmp-mibs/python-pysnmp-mibs.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYSNMP_MIBS_VERSION = 0.1.6
 PYTHON_PYSNMP_MIBS_SOURCE = pysnmp-mibs-$(PYTHON_PYSNMP_MIBS_VERSION).tar.gz
-PYTHON_PYSNMP_MIBS_SITE = https://pypi.python.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
+PYTHON_PYSNMP_MIBS_SITE = https://files.pythonhosted.org/packages/bf/7c/99ab192af934ed5d41ceef92a1b949b41652f29b46241b902ffec55642f4
 PYTHON_PYSNMP_MIBS_SETUP_TYPE = setuptools
 PYTHON_PYSNMP_MIBS_LICENSE = BSD-3-Clause
 PYTHON_PYSNMP_MIBS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
