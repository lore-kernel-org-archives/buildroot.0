Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B46CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3FC84552;
	Fri, 10 Oct 2025 12:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQstMD1lrgE1; Fri, 10 Oct 2025 12:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2570684183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2570684183;
	Fri, 10 Oct 2025 12:04:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 92CEA226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78846402AA
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_VCDCxZNikW for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B450240155
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B450240155
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A430286F0F; Fri, 10 Oct 2025 12:04:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 13:56:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46be3d810470e55a98e65d3f8e3fac00bcfe581f
X-Git-Newrev: 2343cad2be33b340e108b60196ce94c2e8c52e3b
X-Patchwork-Hint: ignore
Message-Id: <20251010120416.A430286F0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aerich: bump to version
 0.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2343cad2be33b340e108b60196ce94c2e8c52e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop pydantic/tomli-w runtime dependencies, add anyio runtime
dependency.

Migrate from poetry to pdm-backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aerich/Config.in          | 4 +---
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 7 ++++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
index 4e7ea1117c..9b6d8f16c6 100644
--- a/package/python-aerich/Config.in
+++ b/package/python-aerich/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_PYTHON_AERICH
 	bool "python-aerich"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_ASYNCCLICK # runtime
 	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
-	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
-	select BR2_PACKAGE_PYTHON_TOMLI_W # runtime
 	select BR2_PACKAGE_PYTHON_TORTOISE_ORM # runtime
 	help
 	  A database migrations tool for Tortoise ORM.
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index 6e44c241f3..7990532a2e 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  4d647c8f3829782f5770b7b120832f63  aerich-0.9.1.tar.gz
-sha256  629afbef5902635c41f410dd05def984c02e05e62d8a2020210a29a4aae19001  aerich-0.9.1.tar.gz
+md5  e4c7fcf3593c22d58c372595ca3d2e6c  aerich-0.9.2.tar.gz
+sha256  02d58658714eebe396fe7bd9f9401db3a60a44dc885910ad3990920d0357317d  aerich-0.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index c7417f3179..916279be78 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.9.1
+PYTHON_AERICH_VERSION = 0.9.2
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/a5/98/75c6e3053a14a14ffe86e2435698b960abe0bf03c114e67f966d92ff19e7
-PYTHON_AERICH_SETUP_TYPE = poetry
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/c4/60/5d3885f531fab2cecec67510e7b821efc403940ed9eefd034b2c21350f3c
+PYTHON_AERICH_SETUP_TYPE = pep517
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
+PYTHON_AERICH_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
