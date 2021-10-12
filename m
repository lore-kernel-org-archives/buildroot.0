Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CDCC433FE
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:38:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D60C61050
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D60C61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0329660BB1;
	Tue, 12 Oct 2021 20:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOvIPqgJIAMO; Tue, 12 Oct 2021 20:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53054606C0;
	Tue, 12 Oct 2021 20:38:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 272D31BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7320640704
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4GOGQNv3GQH for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABCB0406E8
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 30A8A9553E; Tue, 12 Oct 2021 20:34:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:23:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcc990f5ad02bf7595483b0941c2087343b55847
X-Git-Newrev: 6e814dea4cc38d79fb2b15001b4f662c344400ac
X-Patchwork-Hint: ignore
Message-Id: <20211012203447.30A8A9553E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gunicorn: bump to version
 20.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e814dea4cc38d79fb2b15001b4f662c344400ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore (so the POST_INSTALL
hook is not needed now).
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-gunicorn/Config.in            |  4 ++--
 package/python-gunicorn/python-gunicorn.hash |  6 +++---
 package/python-gunicorn/python-gunicorn.mk   | 16 ++--------------
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index b3d11cf199..4e7c0179a5 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
 	  UNIX. It's a pre-fork worker model ported from Ruby's
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index 402250ea78..cff4915b72 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.python.org/pypi/gunicorn/json
-md5	f581937e9d8569ebd3fd6af1f9ab809f  gunicorn-19.9.0.tar.gz
-sha256	fa2662097c66f920f53f70621c6c58ca4a3c4d3434205e608e121b5b3b71f4f3  gunicorn-19.9.0.tar.gz
+md5  db8a7c5c2064000af70286534803bf1d  gunicorn-20.1.0.tar.gz
+sha256  e0a968b5ba15f8a328fdfd7ab1fcb5af4470c28aaf7e55df02a99bc13138e6e8  gunicorn-20.1.0.tar.gz
 # Locally computed sha256
-sha256	789fe11b92e1cabfbcf744b5fcc392c9bd5c6798603a4e89f925b6337984d1df  LICENSE
+sha256  789fe11b92e1cabfbcf744b5fcc392c9bd5c6798603a4e89f925b6337984d1df  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index d113f75185..fb747bc00e 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,23 +4,11 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 19.9.0
+PYTHON_GUNICORN_VERSION = 20.1.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/47/52/68ba8e5e8ba251e54006a49441f7ccabca83b6bef5aedacb4890596c7911
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/28/5b/0d1f0296485a6af03366604142ea8f19f0833894db3512a40ed07b2a56dd
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
 
-# At the end of the build, we try to compile all py files using the host python
-# that has been built.
-# The GAIO HTTP Worker is only compatible with Python3.4.2 and up. So don't try
-# to compile it with python 2.x
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-define PYTHON_GUNICORN_REMOVE_GAIO_WORKER
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
-		-name "_gaiohttp.py" -exec rm -f {} \;
-endef
-PYTHON_GUNICORN_POST_INSTALL_TARGET_HOOKS += PYTHON_GUNICORN_REMOVE_GAIO_WORKER
-endif
-
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
