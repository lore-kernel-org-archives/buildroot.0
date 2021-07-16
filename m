Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F16C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:59:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A67B60EB9
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A67B60EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25465400FD;
	Tue,  3 Aug 2021 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cC5dCfnqWSND; Tue,  3 Aug 2021 21:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5728B4059A;
	Tue,  3 Aug 2021 21:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5391BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BA3A83AC1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DdaEolR9bLo8 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E6AE83A99
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D93DC86A84; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 22:59:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eae43a39d89d66547b20929395192fbf283be40d
X-Git-Newrev: 097de253b4df6c1799166d4460df07949f25e5c0
X-Patchwork-Hint: ignore
Message-Id: <20210803211003.D93DC86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-bcrypt: bump to
 version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=097de253b4df6c1799166d4460df07949f25e5c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Python 2 is no longer supported, depend on python3 and propagate
reverse dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-compose/Config.in         | 7 ++-----
 package/python-bcrypt/Config.in          | 2 +-
 package/python-bcrypt/python-bcrypt.hash | 6 +++---
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 package/python-paramiko/Config.in        | 5 +++--
 package/python-pysftp/Config.in          | 1 +
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index 74af8e03d5..8e16b60521 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -1,15 +1,12 @@
 config BR2_PACKAGE_DOCKER_COMPOSE
 	bool "docker-compose"
+	depends on !BR2_PACKAGE_PYTHON # python-paramiko -> python-bcrypt
 	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	depends on !BR2_STATIC_LIBS # python
 	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko -> python-cryptography
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
-	       if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
diff --git a/package/python-bcrypt/Config.in b/package/python-bcrypt/Config.in
index 4fa6c31a9e..81becad322 100644
--- a/package/python-bcrypt/Config.in
+++ b/package/python-bcrypt/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_BCRYPT
 	bool "python-bcrypt"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Modern password hashing for your software and your servers.
 
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index a9c070f2e1..b1970d8684 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bcrypt/json
-md5	5d6f93b575ce52470af37a8e7dce76fe  bcrypt-3.1.7.tar.gz
-sha256	0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42  bcrypt-3.1.7.tar.gz
+md5  fe31390dab603728f756cd3d6830c80a  bcrypt-3.2.0.tar.gz
+sha256  5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29  bcrypt-3.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
+sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index 381d003475..ad770cc974 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 3.1.7
+PYTHON_BCRYPT_VERSION = 3.2.0
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/fa/aa/025a3ab62469b5167bc397837c9ffc486c42a97ef12ceaa6699d8f5a5416
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/d8/ba/21c475ead997ee21502d30f76fd93ad8d5858d19a3fad7cd153de698c4dd
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index 993c84ef4d..4b8495d76d 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,15 +1,16 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
+	depends on BR2_PACKAGE_PYTHON3 # python-bcrypt
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  SSH2 protocol library.
 
 	  https://github.com/paramiko/paramiko/
 
 comment "python-paramiko needs a toolchain w/ C++"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
index 06f883f602..de2d2df63d 100644
--- a/package/python-pysftp/Config.in
+++ b/package/python-pysftp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYSFTP
 	bool "python-pysftp"
+	depends on BR2_PACKAGE_PYTHON3 # python-paramiko -> python-bcrypt
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  A friendly face on SFTP.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
