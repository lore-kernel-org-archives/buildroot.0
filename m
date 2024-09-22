Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7181BCF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D05DC4027F;
	Sun, 22 Sep 2024 18:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2n166QljNzF; Sun, 22 Sep 2024 18:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1D38402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1D38402F2;
	Sun, 22 Sep 2024 18:17:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C89CD1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C35CF811A7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSQCwygjMjBx for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD33C811AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD33C811AD
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:17:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D64484310; Sun, 22 Sep 2024 18:17:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 20:14:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2fe9e861bb29ace50876b7ff07c6ddbfa9c647d
X-Git-Newrev: ddcddc47882fac09b895e1414bf97f8b7baea46e
X-Patchwork-Hint: ignore
Message-Id: <20240922181730.8D64484310@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: bump to version
 4.8.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddcddc47882fac09b895e1414bf97f8b7baea46e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-argcomplete runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-esptool/Config.in           | 1 +
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 4099957971..5095454aa1 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ESPTOOL
 	bool "python-esptool"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_ARGCOMPLETE # runtime
 	select BR2_PACKAGE_PYTHON_BITSTRING # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 490b4e7e9c..0a60fd7235 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  e7f2012cf31cd23f60049b179fb3b53a  esptool-4.7.0.tar.gz
-sha256  01454e69e1ef3601215db83ff2cb1fc79ece67d24b0e5d43d451b410447c4893  esptool-4.7.0.tar.gz
+md5  4bcb7f6f3d2c9b4edb4caa09912f1dfe  esptool-4.8.0.tar.gz
+sha256  f933150b5753e7501024e4d237fe078a77913a0cb7e2f08197ef8d70306b1b53  esptool-4.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index 648748237d..df19daf61e 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.7.0
+PYTHON_ESPTOOL_VERSION = 4.8.0
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/1b/8b/f0d1e75879dee053874a4f955ed1e9ad97275485f51cb4bc2cb4e9b24479
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/d4/c7/b7e4b96a0e7d9b94fe953e1b55b3573bec498bac05f72e61e5a0e979e2c7
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
