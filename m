Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF5DC433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:52:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240F260F93
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 18:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 240F260F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E58D7402B1;
	Fri, 10 Sep 2021 18:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3egEd_8aP2nN; Fri, 10 Sep 2021 18:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34E2A401D0;
	Fri, 10 Sep 2021 18:52:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54D661BF424
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43606401D0
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 18:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qg04t5gkzqWX for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 18:52:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5268740129
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 18:52:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (4)
Received: from zm.localdomain (pub-198.183.29.194.multiplay.pl
 [194.29.183.198])
 by server220076.nazwa.pl (Postfix) with ESMTP id 637911C5454;
 Fri, 10 Sep 2021 20:52:14 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 20:52:12 +0200
Message-Id: <20210910185213.2686343-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-packaging: bump to version 21.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index b3145dfee6..0c23a5f71c 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  5377308b3ba89f2d78c05e7f485be65d  packaging-20.9.tar.gz
-sha256  5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5  packaging-20.9.tar.gz
+md5  240ba5823ed31051a1254e74c9d18d55  packaging-21.0.tar.gz
+sha256  7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b7471f779df49c2fbe7  packaging-21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 5fdf7616cc..6b54d2416d 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 20.9
+PYTHON_PACKAGING_VERSION = 21.0
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/86/3c/bcd09ec5df7123abcf695009221a52f90438d877a2f1499453c6938f5728
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/86/aef78bab3afd461faecf9955a6501c4999933a48394e90f03cd512aad844
 PYTHON_PACKAGING_SETUP_TYPE = setuptools
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
