Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5282AC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB85612C1;
	Fri, 16 May 2025 14:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsKKN3drVjD2; Fri, 16 May 2025 14:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A7BD612EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7BD612EF;
	Fri, 16 May 2025 14:59:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42ED8185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F9A60C14
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIkAnN2tyFjQ for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF75F61299
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF75F61299
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:59:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC62486CB6; Fri, 16 May 2025 14:59:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:56:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 218a17dbc4ea320304d35d74c773cc319ec3dda9
X-Git-Newrev: d0841c007b4fbfaa4d9070d5936ad6924d61a105
X-Patchwork-Hint: ignore
Message-Id: <20250516145945.CC62486CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: bump to
 version 3.4.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0841c007b4fbfaa4d9070d5936ad6924d61a105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-mypy and host-python-setuptools-scm build
dependencies.

Set --skip-dependency-check due to unnecessarily strict mypy
version limit.

Set CHARSET_NORMALIZER_USE_MYPYC=1 in env so that mypyc optimizations
are enabled.

License hash changed due to year update:
https://github.com/jawah/charset_normalizer/commit/deed20577ba5358bb9624c17e6c8aa6ab26f6e08

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../python-charset-normalizer/python-charset-normalizer.hash  |  6 +++---
 .../python-charset-normalizer/python-charset-normalizer.mk    | 11 +++++++++--
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index ebed9d19d7..0518440057 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  8e0d0f33219087c2cd2d01b1d6ff11b6  charset_normalizer-3.4.0.tar.gz
-sha256  223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e  charset_normalizer-3.4.0.tar.gz
+md5  1d808eb9efaf70bf0ec3b800f3c7dca8  charset_normalizer-3.4.1.tar.gz
+sha256  44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3  charset_normalizer-3.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
+sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index ee04bf8968..64a82dd016 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.0
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.1
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
+PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
+PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
+PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
+
+HOST_PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
+HOST_PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
+HOST_PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
