Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89243EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5737C81E29;
	Thu,  1 Jan 2026 09:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qfnoUp_5SZ6; Thu,  1 Jan 2026 09:42:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56B4781E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260573;
	bh=ZMTEBaWCl/plVMwM49NF2qOudZBcukJ9wmfFQk2dqdM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UA6w06mWhheVqROE88ciejtmrzryRvI8AzZFxkbOm50sMYLwWuASRvM+Pg/zKrY8x
	 FD5cAKLTm5MPObOlcSeTMkCwU4LuvlPs39+KjmdajkMcnIRgPgjrON9BclM6n6aQoj
	 ckH4ENBDuCAeYdshcP/vi8eeuQePKANJ5KTOtE9kDmxiNSvEOcktWHNR/6GPrxSYyS
	 Iwy6qL8i3YvcBgOUpQc/LVuB5UjXkyPns0lR0+CN6OPOsdQVgjQGxYgV6onegsyUJL
	 KUftk1q+jNNVvDwiz2oygSWNyHheEp4gWvw3b3Gc1+6n2xKAINUbshUjgdWSxe5q88
	 eN/D+oJffHkVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B4781E2F;
	Thu,  1 Jan 2026 09:42:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E17351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5D6381425
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHX9oG2x8P_S for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 196C28154B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 196C28154B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 178B0878FB; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3090d1c87195446aaf048fdf4879677b894204d5
X-Git-Newrev: 8f7f912ead49893cc5f26f0885bc7d89387addd9
X-Patchwork-Hint: ignore
Message-Id: <20260101094233.178B0878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycares: bump to version
 5.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f7f912ead49893cc5f26f0885bc7d89387addd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dependency on c-ares and set env variable to ensure it's used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycares/Config.in           | 1 +
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pycares/Config.in b/package/python-pycares/Config.in
index 889e0943be..e58f922ad3 100644
--- a/package/python-pycares/Config.in
+++ b/package/python-pycares/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYCARES
 	bool "python-pycares"
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Python interface for c-ares.
diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 179288f694..c77915987b 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  230e5133767e84f5d99c93dd07fea611  pycares-4.11.0.tar.gz
-sha256  c863d9003ca0ce7df26429007859afd2a621d3276ed9fef154a9123db9252557  pycares-4.11.0.tar.gz
+md5  577c064ebf4b84fbd53890b4c0f86f5a  pycares-5.0.0.tar.gz
+sha256  62e38a6cce0f3dbfe6dfcccba10526255b3823a2a040b313afef7aa9b039ce03  pycares-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 0f42bc591b..0cb1eeda6f 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.11.0
+PYTHON_PYCARES_VERSION = 5.0.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/8d/ad/9d1e96486d2eb5a2672c4d9a2dd372d015b8d7a332c6ac2722c4c8e6bbbf
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/59/5d/b50bdc30026f350f1c4b0c4fb6b7543598f2bcc370308c5148c7019d9886
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-PYTHON_PYCARES_DEPENDENCIES = host-python-cffi
+PYTHON_PYCARES_DEPENDENCIES = c-ares host-python-cffi
+PYTHON_PYCARES_ENV = PYCARES_USE_SYSTEM_LIB=1
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
