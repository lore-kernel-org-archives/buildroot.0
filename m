Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66237E95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C07680981;
	Tue, 30 Dec 2025 13:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fW3MEnz4wgvh; Tue, 30 Dec 2025 13:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58DC680868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099648;
	bh=wZnfFynkhGTIjVagB2H/pyFGgoJkKcJ1E1c3ORZptN8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l3Lgz2bLbiUxOzvDQXCS+bKMkpoGKp1MIxs+FRf4aYYRdNYrsOQg+gNwpTmmHFa32
	 PmKBjAVp/QypV4Ek3fjq9kG9GjBl0t5S7qbJqx19iGTwhBVFDyfAFseox6ZvztY+e2
	 sQc7ee6ecSCvFywb6dFZCXp48P8pTzezlbTgEOC5QUu2bgXcqMXyKmPnXM6WxfUmH3
	 ejfu8VXB2v6mj3yikTI9r9oi5fLqGExEJMUosiIgf9FQUHFq66fVu5fznSur+5GFe7
	 8zaYLUdWHwFDjH0KIczQgBamOnfCq5QSrepFuPMR8/T6kRdr64p11At0ld/Uwl8J7G
	 bVLVXEJiefi1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DC680868;
	Tue, 30 Dec 2025 13:00:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D832177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F2CB4019A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DX1GDhiJC0c for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 851C5405AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 851C5405AA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8364087A6A; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:00:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c1be092bc86fd081f8fb9ae1d083c3f2081de8d
X-Git-Newrev: 5f446a8d6dd8715385d6e2df2714f064bf26243d
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.8364087A6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 12.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f446a8d6dd8715385d6e2df2714f064bf26243d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add libavif support.

Add new python-pybind build dependency.

Set --skip-dependency-check since pybind isn't detected properly by
the pep517 build frontend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pillow/Config.in          |  1 +
 package/python-pillow/python-pillow.hash |  4 ++--
 package/python-pillow/python-pillow.mk   | 14 +++++++++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
index 126cb452fa..51d8db5920 100644
--- a/package/python-pillow/Config.in
+++ b/package/python-pillow/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PILLOW
 	bool "python-pillow"
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON_PYBIND
 	help
 	  Pillow is the "friendly" PIL fork by Alex Clark and
 	  Contributors. PIL is the Python Imaging Library by Fredrik
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index d9077daaf7..22d1f3fe7f 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  9464f92bed3be9c68293cb399ec1ec1a  pillow-11.3.0.tar.gz
-sha256  3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523  pillow-11.3.0.tar.gz
+md5  a7432f8c473441996d72efdefbc49d40  pillow-12.0.0.tar.gz
+sha256  87d4f8125c9988bfbed67af47dd7a953e2fc7b0cc1e7800ec6d2080d490bb353  pillow-12.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 80961b92a5..19e3f8e279 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 11.3.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238
+PYTHON_PILLOW_VERSION = 12.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5a/b0/cace85a1b0c9775a9f8f5d5423c8261c858760e2466c79b2dd184638b056
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
@@ -13,8 +13,9 @@ PYTHON_PILLOW_CPE_ID_VENDOR = python
 PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 
-PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
+PYTHON_PILLOW_DEPENDENCIES = host-pkgconf python-pybind
 PYTHON_PILLOW_BUILD_OPTS = \
+	--skip-dependency-check \
 	-Cplatform-guessing=disable \
 	-Cimagequant=disable \
 	-Craqm=disable
@@ -40,6 +41,13 @@ else
 PYTHON_PILLOW_BUILD_OPTS += -Clcms=disable
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAVIF),y)
+PYTHON_PILLOW_DEPENDENCIES += libavif
+PYTHON_PILLOW_BUILD_OPTS += -Clibavif=enable
+else
+PYTHON_PILLOW_BUILD_OPTS += -Clibavif=disable
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 PYTHON_PILLOW_DEPENDENCIES += libxcb
 PYTHON_PILLOW_BUILD_OPTS += -Cxcb=enable
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
