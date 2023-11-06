Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A283C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4550442093;
	Mon,  6 Nov 2023 22:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4550442093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aDtuzNkF7Y99; Mon,  6 Nov 2023 22:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F9F4212B;
	Mon,  6 Nov 2023 22:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F9F4212B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5501BF954
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1604612C1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1604612C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3DIjYVRwY4Z for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D206C612C7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D206C612C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF26D86B7B; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a5ac9234fc5259648b59a2b2652280e0623ccf2
X-Git-Newrev: 18abda1791e3ca09f96b5ca106431c5d3bce8673
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.CF26D86B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gunicorn: bump to version
 21.2.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=18abda1791e3ca09f96b5ca106431c5d3bce8673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop python-setuptools runtime dependency.

Add new python-packaging runtime dependency.

License hash changed due to date update:
https://github.com/benoitc/gunicorn/commit/378f0d04ec390a754cb819f095bf65bfcc04ed99

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gunicorn/Config.in            |  2 +-
 package/python-gunicorn/python-gunicorn.hash | 10 +++++-----
 package/python-gunicorn/python-gunicorn.mk   |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index 18f0c034ba..a670dd4814 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index cff4915b72..bd4dc1b3ca 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/gunicorn/json
-md5  db8a7c5c2064000af70286534803bf1d  gunicorn-20.1.0.tar.gz
-sha256  e0a968b5ba15f8a328fdfd7ab1fcb5af4470c28aaf7e55df02a99bc13138e6e8  gunicorn-20.1.0.tar.gz
-# Locally computed sha256
-sha256  789fe11b92e1cabfbcf744b5fcc392c9bd5c6798603a4e89f925b6337984d1df  LICENSE
+# md5, sha256 from https://pypi.org/pypi/gunicorn/json
+md5  cb41319d6929842c5af7003d48c513a2  gunicorn-21.2.0.tar.gz
+sha256  88ec8bff1d634f98e61b9f65bc4bf3cd918a90806c6f5c48bc5603849ec81033  gunicorn-21.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  fc71b8f2ce774a47090c106ac5d1145359f5c0e25a0d9ab42acacd230f596936  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index fb747bc00e..03ff5a49df 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 20.1.0
+PYTHON_GUNICORN_VERSION = 21.2.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/28/5b/0d1f0296485a6af03366604142ea8f19f0833894db3512a40ed07b2a56dd
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/06/89/acd9879fa6a5309b4bf16a5a8855f1e58f26d38e0c18ede9b3a70996b021
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
