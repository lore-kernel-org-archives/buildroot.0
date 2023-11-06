Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2410C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D46140971;
	Mon,  6 Nov 2023 22:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D46140971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkOWt3ei8-CM; Mon,  6 Nov 2023 22:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7779D42133;
	Mon,  6 Nov 2023 22:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7779D42133
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4B01BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD9BF41605
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD9BF41605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDCe8b2spjy4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:20:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94F09415ED
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F09415ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9223686B77; Mon,  6 Nov 2023 22:20:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:15:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 714c0130ceaaf0ea2c4b5a9d4fd5d01802bedb78
X-Git-Newrev: 219ba0034ce150456ccbf8772c3c7b7831105c06
X-Patchwork-Hint: ignore
Message-Id: <20231106222017.9223686B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask: bump to version 3.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=219ba0034ce150456ccbf8772c3c7b7831105c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

Remove python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask/Config.in         | 1 -
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 19b2f0ae7b..8dc2cef356 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_FLASK
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SSL
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 37ff0d70a5..3b5afc48e7 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  a5d5fe05dff5c6e0d28ece3fb03ef5cd  Flask-2.3.2.tar.gz
-sha256  8c2f9abd47a9e8df7f0c3f091ce9497d011dc3b31effcf4c85a6e2b50f4114ef  Flask-2.3.2.tar.gz
+md5  4848c9d5305197822b5b00c8e9a6d9aa  flask-3.0.0.tar.gz
+sha256  cfadcdb638b609361d29ec22360d6070a77d7463dcb3ab08d2c2f2f168845f58  flask-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index b0a38488f8..1372d915c1 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 2.3.2
-PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4d/00/ef81c18da32fdfcde6381c315f4b11597fb6691180a330418848efee0ae7
-PYTHON_FLASK_SETUP_TYPE = setuptools
+PYTHON_FLASK_VERSION = 3.0.0
+PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d8/09/c1a7354d3925a3c6c8cfdebf4245bae67d633ffda1ba415add06ffc839c5
+PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
 PYTHON_FLASK_CPE_ID_VENDOR = palletsprojects
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
