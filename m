Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91829CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 17:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2BD9838E0;
	Sun,  5 Oct 2025 17:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlB4trHK8_E8; Sun,  5 Oct 2025 17:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC4C833A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC4C833A3;
	Sun,  5 Oct 2025 17:56:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AF0909
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F0B540B2D
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKWHjZyy_myS for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 17:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF7640A70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF7640A70
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 17:56:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACB5886919; Sun,  5 Oct 2025 17:56:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 19:38:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1d608e0c81eb473164d794ee94a0f63d9326d0d
X-Git-Newrev: 2ecb2d2847701795d384ee9e4eaeb0669dcc2bef
X-Patchwork-Hint: ignore
Message-Id: <20251005175632.ACB5886919@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-restx: bump version
 to 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ecb2d2847701795d384ee9e4eaeb0669dcc2bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see [1].

This commit removes the runtime dependency to pytz, as it was replace
with the python standard zoneinfo. See [2]. It also adds the python
referencing runtime dependency. See [3].

[1] https://github.com/python-restx/flask-restx/releases/tag/1.3.2
[2] https://github.com/python-restx/flask-restx/commit/dbd6f0dc3459b2b0526228a445af31590f0aafdd
[3] https://github.com/python-restx/flask-restx/commit/0f4f53498129696c85ea150d10becb97a579de6a

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
[Julien: add details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-restx/Config.in               | 3 +--
 package/python-flask-restx/python-flask-restx.hash | 4 ++--
 package/python-flask-restx/python-flask-restx.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
index ec5b3283bd..c98dd74d5b 100644
--- a/package/python-flask-restx/Config.in
+++ b/package/python-flask-restx/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_PYTHON_FLASK_RESTX
 	bool "python-flask-restx"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema
 	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_REFERENCING # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	help
 	  Fully featured framework for fast, easy and documented API
diff --git a/package/python-flask-restx/python-flask-restx.hash b/package/python-flask-restx/python-flask-restx.hash
index f90601cdc1..5bbe0dfa93 100644
--- a/package/python-flask-restx/python-flask-restx.hash
+++ b/package/python-flask-restx/python-flask-restx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-restx/json
-md5  262984a0c902db0b6f4afb86a69ea40e  flask-restx-1.3.0.tar.gz
-sha256  4f3d3fa7b6191fcc715b18c201a12cd875176f92ba4acc61626ccfd571ee1728  flask-restx-1.3.0.tar.gz
+md5  3fe0cd948ae1a0ebcbca569daf069586  flask-restx-1.3.2.tar.gz
+sha256  0ae13d77e7d7e4dce513970cfa9db45364aef210e99022de26d2b73eb4dbced5  flask-restx-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d736fc20d979831ab5c380973d01542de97857d975b60a4cf03efbd9e4e38997  LICENSE
diff --git a/package/python-flask-restx/python-flask-restx.mk b/package/python-flask-restx/python-flask-restx.mk
index 23596f23d4..f8e8ef133a 100644
--- a/package/python-flask-restx/python-flask-restx.mk
+++ b/package/python-flask-restx/python-flask-restx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_RESTX_VERSION = 1.3.0
+PYTHON_FLASK_RESTX_VERSION = 1.3.2
 PYTHON_FLASK_RESTX_SOURCE = flask-restx-$(PYTHON_FLASK_RESTX_VERSION).tar.gz
-PYTHON_FLASK_RESTX_SITE = https://files.pythonhosted.org/packages/45/4c/2e7d84e2b406b47cf3bf730f521efe474977b404ee170d8ea68dc37e6733
+PYTHON_FLASK_RESTX_SITE = https://files.pythonhosted.org/packages/43/89/9b9ca58cbb8e9ec46f4a510ba93878e0c88d518bf03c350e3b1b7ad85cbe
 PYTHON_FLASK_RESTX_SETUP_TYPE = setuptools
 PYTHON_FLASK_RESTX_LICENSE = BSD-3-Clause
 PYTHON_FLASK_RESTX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
