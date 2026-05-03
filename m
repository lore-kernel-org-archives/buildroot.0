Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2328ACD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E458427E;
	Sun,  3 May 2026 14:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xs5FOz6_0z_k; Sun,  3 May 2026 14:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30EBB8426C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819855;
	bh=qJYC+EGYpEMCP4XOAy2JAFRyK41Rf9dkHTRCZvtLPN8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B/oiuZ+fp2CEByaKNGrOdJt1PC4wSSdoBy98bgfe7zCvHDIsj/J8UL76B9sl0EaK4
	 66fHo83e/XEaiXDE12Husv/dMPyXBX5IZrY1Fsc8P4JVzhaKqDVVYIZ1J4e+2O2+GQ
	 ddfSPNMuOn0ef4sx4NlEzLvV1BsuBat4VR2dwED0rg5K79Sot/VWitnhn0v2BAgIsN
	 pPyD3yJPUGHepzwJcrcvoJk83HymJrbq4I7Rg/E9OAuRWFX3RwyX8LDRA78+lVLamn
	 ktDYpWQudKqqFCoWFPeOPu3/YvnLyQGRlLhJKpuEgROREN1MNaAccHaF5+z8SZ8Kx+
	 8AmVxhQRTobPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30EBB8426C;
	Sun,  3 May 2026 14:50:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DA8C127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E498A84225
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRurRpPmRz8W for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762A18423D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 762A18423D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32E6283FC1; Sun,  3 May 2026 14:50:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 703a7bde26ffe0d1adcbac8fe48cbbc4c1d98769
X-Git-Newrev: af7cb9be2a0be4e7dede68672e3053fdc465de3f
X-Patchwork-Hint: ignore
Message-Id: <20260503145029.32E6283FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow: bump version
 to 4.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af7cb9be2a0be4e7dede68672e3053fdc465de3f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/marshmallow-code/marshmallow/blob/4.3.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 56bc15bfa2..6be06f20f4 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  d3f861e4957521a6a15eb906194deb70  marshmallow-4.2.2.tar.gz
-sha256  ba40340683a2d1c15103647994ff2f6bc2c8c80da01904cbe5d96ee4baa78d9f  marshmallow-4.2.2.tar.gz
+md5  95589d6f1082aae57ef81cc5ce15fc2c  marshmallow-4.3.0.tar.gz
+sha256  fb43c53b3fe240b8f6af37223d6ef1636f927ad9bea8ab323afad95dff090880  marshmallow-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 5e86821d0a..964ff66732 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 4.2.2
+PYTHON_MARSHMALLOW_VERSION = 4.3.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/f9/03/261af5efb3d3ce0e2db3fd1e11dc5a96b74a4fb76e488da1c845a8f12345
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/25/7e/1dbd4096eb7c148cd2841841916f78820bb85a4d80a0c25c02d30815a7fb
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
