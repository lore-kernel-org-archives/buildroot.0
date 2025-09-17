Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ACECAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D42C4135B;
	Wed, 17 Sep 2025 16:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vat-kZoa2Uxe; Wed, 17 Sep 2025 16:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8941D4135F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8941D4135F;
	Wed, 17 Sep 2025 16:45:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10870279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C9F161248
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wE11QSo8Ez35 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A35C61579
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A35C61579
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48023851CA; Wed, 17 Sep 2025 16:45:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 18:42:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aca5611af71e7da1396a39bea0c604654c99a0dc
X-Git-Newrev: 85fef1bb9137864f7a7274ccb596ba68619520f2
X-Patchwork-Hint: ignore
Message-Id: <20250917164534.48023851CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mypy-extensions: bump to
 version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=85fef1bb9137864f7a7274ccb596ba68619520f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-mypy-extensions/python-mypy-extensions.hash | 4 ++--
 package/python-mypy-extensions/python-mypy-extensions.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
index 5e3763bd63..6db4ca35b0 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.hash
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy_extensions/json
-md5  5b77a3cafc7e9749a0157533c0915b5d  mypy_extensions-1.0.0.tar.gz
-sha256  75dbf8955dc00442a438fc4d0666508a9a97b6bd41aa2f0ffe9d2f2725af0782  mypy_extensions-1.0.0.tar.gz
+md5  f59bfd7f9dca73f36c8feed12f9e8eba  mypy_extensions-1.1.0.tar.gz
+sha256  52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558  mypy_extensions-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4  LICENSE
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
index 99b30b2c07..cf0f7c681c 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.mk
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MYPY_EXTENSIONS_VERSION = 1.0.0
+PYTHON_MYPY_EXTENSIONS_VERSION = 1.1.0
 PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
-PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/98/a4/1ab47638b92648243faf97a5aeb6ea83059cc3624972ab6b8d2316078d3f
-PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = setuptools
+PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/a2/6e/371856a3fb9d31ca8dac321cda606860fa4548858c0cc45d9d1d4ca2628b
+PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
 PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
