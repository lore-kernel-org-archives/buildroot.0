Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66D1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:33:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E74960F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E74960F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A5C415FC;
	Tue,  3 Aug 2021 23:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnNVR9wYPGbW; Tue,  3 Aug 2021 23:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF079421F3;
	Tue,  3 Aug 2021 23:33:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00C7F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E64D440ECD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8h2sd1YZyfws for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD48540653
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0BD8185586; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 22:59:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 79f34e1b5830e370428abc73b7c1625f1f6f64db
X-Git-Newrev: 40fe600f17ce0cfb7377d6a02230a171d4d174ac
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.0BD8185586@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cchardet: bump
 to version 2.1.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=40fe600f17ce0cfb7377d6a02230a171d4d174ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Python 2 is no longer supported.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cchardet/Config.in            | 2 ++
 package/python-cchardet/python-cchardet.hash | 4 ++--
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-cchardet/Config.in b/package/python-cchardet/Config.in
index 74153126fb..0f8645aafe 100644
--- a/package/python-cchardet/Config.in
+++ b/package/python-cchardet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CCHARDET
 	bool "python-cchardet"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  cChardet is high speed universal character encoding
@@ -8,4 +9,5 @@ config BR2_PACKAGE_PYTHON_CCHARDET
 	  https://github.com/PyYoshi/cChardet
 
 comment "python-cchardet needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index 960801f889..1ecfd6fa95 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5  ee884e2c7762e56e8a0600aa34ad4fa3  cchardet-2.1.6.tar.gz
-sha256  b76afb2059ad69eab576949980a17413c1e9e5a5624abf9e43542d8853f146b3  cchardet-2.1.6.tar.gz
+md5  8a76472ad09c68c12069203ea9348ee3  cchardet-2.1.7.tar.gz
+sha256  c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf  cchardet-2.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index 78daf6075e..396e9d6c53 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.1.6
+PYTHON_CCHARDET_VERSION = 2.1.7
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/41/e6/2e2184a3bc887bfb6e6b97aef5e94af9b8de43806ce14b023ddbbcb0b30d
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/a8/5d/090c9f0312b7988a9433246c9cf0b566b1ae1374368cfb8ac897218a4f65
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
