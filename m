Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4830CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B757C84458;
	Wed, 17 Sep 2025 16:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0J3NxOmAxj-M; Wed, 17 Sep 2025 16:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA24B8444E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA24B8444E;
	Wed, 17 Sep 2025 16:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 165D5199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DDCB6153B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdKLRxQEejLV for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4210A61544
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4210A61544
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FE66851BB; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4ad6e6f8b9c059c5612f64de865acc0bc32ff43
X-Git-Newrev: aca5611af71e7da1396a39bea0c604654c99a0dc
X-Patchwork-Hint: ignore
Message-Id: <20250917164534.3FE66851BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mypy: bump to version 1.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=aca5611af71e7da1396a39bea0c604654c99a0dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-pathspec runtime/build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-mypy/Config.in        | 1 +
 package/python-mypy/python-mypy.hash | 4 ++--
 package/python-mypy/python-mypy.mk   | 6 ++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
index 38ea7dc30f..6c58bc4fc1 100644
--- a/package/python-mypy/Config.in
+++ b/package/python-mypy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_MYPY
 	bool "python-mypy"
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Optional static typing for Python.
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index 21b2c9aba0..ff49a92b18 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  8297bf7865feffd704735f0fdb5a4150  mypy-1.14.1.tar.gz
-sha256  7ec88144fe9b510e8475ec2f5f251992690fcf89ccb4500b214b4226abcd32d6  mypy-1.14.1.tar.gz
+md5  fb9ff268550456e6d100a21e02fc6574  mypy-1.18.1.tar.gz
+sha256  9e988c64ad3ac5987f43f5154f884747faf62141b7f842e87465b45299eea5a9  mypy-1.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index 26614b2948..6127975756 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,19 +4,21 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.14.1
+PYTHON_MYPY_VERSION = 1.18.1
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/b9/eb/2c92d8ea1e684440f54fa49ac5d9a5f19967b7b472a281f419e69a8d228e
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/14/a3/931e09fc02d7ba96da65266884da4e4a8806adcdb8a57faaacc6edf1d538
 PYTHON_MYPY_SETUP_TYPE = setuptools
 PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
 PYTHON_MYPY_DEPENDENCIES = \
 	host-python-mypy-extensions \
+	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
 HOST_PYTHON_MYPY_DEPENDENCIES = \
 	host-python-mypy-extensions \
+	host-python-pathspec \
 	host-python-types-psutil \
 	host-python-types-setuptools \
 	host-python-typing-extensions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
