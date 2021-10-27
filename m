Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10D6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:31:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CCF60C40
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43CCF60C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB0240272;
	Wed, 27 Oct 2021 20:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNj55mwkSo_F; Wed, 27 Oct 2021 20:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38F9840283;
	Wed, 27 Oct 2021 20:31:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 571581BF9C8
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E03881D65
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-1aj7jrqYyl for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AC4D81D70
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DB5C689042; Wed, 27 Oct 2021 20:27:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:28:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88a8565de08c2bd7d19034b063401a5d69c538e3
X-Git-Newrev: a0a9edb64cafeebfb20dfacbf0fd7ec88feb861c
X-Patchwork-Hint: ignore
Message-Id: <20211027202703.DB5C689042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-requests: bump to version
 2.26.0
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
Content-Type: multipart/mixed; boundary="===============4368884080045447786=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4368884080045447786==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a0a9edb64cafeebfb20dfacbf0fd7ec88feb861c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove python3-requests host package and combine with python-requests.

Make packages depending on host-python3-requests depend on
host-python-requests instead.

Drop idna patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mongodb/mongodb.mk                         |  2 +-
 ...ow-idna-3.x-to-be-installed-on-Python-3.x.patch | 33 ----------------------
 package/python-requests/Config.in                  |  2 +-
 package/python-requests/python-requests.hash       |  4 +--
 package/python-requests/python-requests.mk         |  7 +++--
 ...ow-idna-3.x-to-be-installed-on-Python-3.x.patch | 33 ----------------------
 package/python3-requests/python3-requests.hash     |  1 -
 package/python3-requests/python3-requests.mk       | 19 -------------
 package/uhd/uhd.mk                                 |  2 +-
 9 files changed, 9 insertions(+), 94 deletions(-)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 6a22acd12a..ede03e44d6 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -20,7 +20,7 @@ MONGODB_DEPENDENCIES = \
 	host-python3-psutil \
 	host-python3-pyyaml \
 	host-python3-regex \
-	host-python3-requests \
+	host-python-requests \
 	host-scons \
 	pcre \
 	snappy \
diff --git a/package/python-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch b/package/python-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
deleted file mode 100644
index ea9ad15df2..0000000000
--- a/package/python-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d747c4753484aa9b90a094d6bf7ec45e5acfb623 Mon Sep 17 00:00:00 2001
-From: Naor Livne <naorlivne@gmail.com>
-Date: Wed, 7 Jul 2021 16:25:20 +0300
-Subject: [PATCH] Allow idna 3.x to be installed on Python 3.x
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Co-authored-by: Mickaël Schoentgen <contact@tiger-222.fr>
-Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
-(cherry picked from commit 33cf965f7271ab4978ed551754db37865c4085db)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 7ba4b2a2..83d78665 100755
---- a/setup.py
-+++ b/setup.py
-@@ -43,7 +43,8 @@ packages = ['requests']
- 
- requires = [
-     'chardet>=3.0.2,<5',
--    'idna>=2.5,<3',
-+    'idna>=2.5,<3; python_version < "3"',
-+    'idna>=2.5,<4; python_version >= "3"',
-     'urllib3>=1.21.1,<1.27',
-     'certifi>=2017.4.17'
- 
--- 
-2.31.1
-
diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index c798156613..9b04c07fc9 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_REQUESTS
 	bool "python-requests"
 	depends on BR2_PACKAGE_PYTHON3 # python-idna
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
-	select BR2_PACKAGE_PYTHON_CHARDET # runtime
+	select BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index e07c7bf5cc..53503a3668 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  514d6f7eba77ada0b8c98ec7818828db  requests-2.25.1.tar.gz
-sha256  27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804  requests-2.25.1.tar.gz
+md5  8c745949ad3e9ae83d9927fed213db8a  requests-2.26.0.tar.gz
+sha256  b8aa58f8cf793ffd8782d3d8cb19e66ef36f7aba4353eec859e74678b01b07a7  requests-2.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 5d0f545ffb..474d2033ac 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-requests/python3-requests.mk
-PYTHON_REQUESTS_VERSION = 2.25.1
+PYTHON_REQUESTS_VERSION = 2.26.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/e7/01/3569e0b535fb2e4a6c384bdbed00c55b9d78b5084e0fb7f4d0bf523d7670
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
 PYTHON_REQUESTS_CPE_ID_VENDOR = python
 PYTHON_REQUESTS_CPE_ID_PRODUCT = requests
+HOST_PYTHON_REQUESTS_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python3-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch b/package/python3-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
deleted file mode 100644
index ea9ad15df2..0000000000
--- a/package/python3-requests/0001-Allow-idna-3.x-to-be-installed-on-Python-3.x.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d747c4753484aa9b90a094d6bf7ec45e5acfb623 Mon Sep 17 00:00:00 2001
-From: Naor Livne <naorlivne@gmail.com>
-Date: Wed, 7 Jul 2021 16:25:20 +0300
-Subject: [PATCH] Allow idna 3.x to be installed on Python 3.x
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Co-authored-by: Mickaël Schoentgen <contact@tiger-222.fr>
-Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
-(cherry picked from commit 33cf965f7271ab4978ed551754db37865c4085db)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 7ba4b2a2..83d78665 100755
---- a/setup.py
-+++ b/setup.py
-@@ -43,7 +43,8 @@ packages = ['requests']
- 
- requires = [
-     'chardet>=3.0.2,<5',
--    'idna>=2.5,<3',
-+    'idna>=2.5,<3; python_version < "3"',
-+    'idna>=2.5,<4; python_version >= "3"',
-     'urllib3>=1.21.1,<1.27',
-     'certifi>=2017.4.17'
- 
--- 
-2.31.1
-
diff --git a/package/python3-requests/python3-requests.hash b/package/python3-requests/python3-requests.hash
deleted file mode 120000
index 19e182d4a6..0000000000
--- a/package/python3-requests/python3-requests.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-requests/python-requests.hash
\ No newline at end of file
diff --git a/package/python3-requests/python3-requests.mk b/package/python3-requests/python3-requests.mk
deleted file mode 100644
index dbb3f21490..0000000000
--- a/package/python3-requests/python3-requests.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# python3-requests
-#
-################################################################################
-
-# Please keep in sync with package/python-requests/python-requests.mk
-PYTHON3_REQUESTS_VERSION = 2.25.1
-PYTHON3_REQUESTS_SOURCE = requests-$(PYTHON3_REQUESTS_VERSION).tar.gz
-PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b
-PYTHON3_REQUESTS_SETUP_TYPE = setuptools
-PYTHON3_REQUESTS_LICENSE = Apache-2.0
-PYTHON3_REQUESTS_LICENSE_FILES = LICENSE
-PYTHON3_REQUESTS_CPE_ID_VENDOR = python
-PYTHON3_REQUESTS_CPE_ID_PRODUCT = requests
-HOST_PYTHON3_REQUESTS_DL_SUBDIR = python-requests
-HOST_PYTHON3_REQUESTS_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index a8001dfd74..125eb05121 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -111,7 +111,7 @@ UHD_CONF_OPTS += -DENABLE_RFNOC=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_UHD_PYTHON),y)
-UHD_DEPENDENCIES += host-python-numpy host-python3-requests \
+UHD_DEPENDENCIES += host-python-numpy host-python-requests \
 	python-numpy python-requests
 UHD_CONF_OPTS += -DENABLE_PYTHON_API=ON
 else

--===============4368884080045447786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4368884080045447786==--
