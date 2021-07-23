Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071F8C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D7160EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78D7160EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1C740658;
	Tue,  3 Aug 2021 22:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJv4VoPzArHM; Tue,  3 Aug 2021 22:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0627D405EB;
	Tue,  3 Aug 2021 22:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6AD1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 921A283AD6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wW7RpWHRxvd5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EC3F835B1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 98F8281484; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 00:04:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fb58ce9735a42f3b250741bbb4994a75db4f7e09
X-Git-Newrev: 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.98F8281484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-idna: bump to
 version 3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c7e30b43a5e98abfc8db521a6415b5a5c1c267f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Python 2 is not supported since version 3.0 so update all reverse
  dependencies and remove python-coherence
- License file name and its hash is updated due to:
  https://github.com/kjd/idna/commit/e7338bce90683246c480ddebd55b7682371389ed
  https://github.com/kjd/idna/commit/537aa99d4440b0f8a6178818350f27fcaab046ee

https://github.com/kjd/idna/blob/v3.2/HISTORY.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |  7 ++++++
 package/Config.in                                  |  1 -
 .../0001-Fix-twisted-detection.patch               | 29 ----------------------
 package/python-coherence/Config.in                 | 10 --------
 package/python-coherence/python-coherence.hash     |  3 ---
 package/python-coherence/python-coherence.mk       | 13 ----------
 package/python-cryptography/Config.in              | 10 +++-----
 package/python-docker/Config.in                    |  8 +++---
 package/python-hyperlink/Config.in                 |  1 +
 package/python-ibmiotf/Config.in                   |  4 +--
 package/python-idna/Config.in                      |  4 +--
 package/python-idna/python-idna.hash               |  6 ++---
 package/python-idna/python-idna.mk                 |  6 ++---
 package/python-influxdb/Config.in                  |  1 +
 package/python-mwclient/Config.in                  |  1 +
 package/python-pyopenssl/Config.in                 |  1 +
 package/python-requests-oauthlib/Config.in         |  1 +
 package/python-requests-toolbelt/Config.in         |  1 +
 package/python-requests/Config.in                  |  8 +++---
 package/python-service-identity/Config.in          |  2 +-
 package/python-treq/Config.in                      |  1 +
 package/python-twisted/Config.in                   |  1 +
 package/python-txdbus/Config.in                    |  1 +
 package/python-txtorcon/Config.in                  |  2 +-
 24 files changed, 37 insertions(+), 85 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1beaa664d7..9c8c64717c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,6 +154,13 @@ config BR2_PACKAGE_KODI_LIBVA
 	  the kodi-specific dependencies limiting libva support to non-
 	  OPENGLES platforms were removed including this option.
 
+config BR2_PACKAGE_PYTHON_COHERENCE
+	bool "python-coherence package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it can't be built anymore due
+	  to python-twisted being now incompatible with python 2.
+
 config BR2_PACKAGE_PHP_EXT_XMLRPC
 	bool "PHP XMLRPC extension removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1a3b91304c..d4150f3cd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,7 +948,6 @@ menu "External python modules"
 	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
-	source "package/python-coherence/Config.in"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
diff --git a/package/python-coherence/0001-Fix-twisted-detection.patch b/package/python-coherence/0001-Fix-twisted-detection.patch
deleted file mode 100644
index c0e51b9e31..0000000000
--- a/package/python-coherence/0001-Fix-twisted-detection.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3cf8d89cbb44b5c7a0693d0b5d665e68acc3927c Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <wiz@NetBSD.org>
-Date: Tue, 10 May 2016 00:14:33 +0200
-Subject: [PATCH] Fix twisted detection.
-
-Addresses https://github.com/coherence-project/Coherence/issues/25
-
-Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- coherence/__init__.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/coherence/__init__.py b/coherence/__init__.py
-index 2e4e8f1..4c4d73d 100644
---- a/coherence/__init__.py
-+++ b/coherence/__init__.py
-@@ -24,8 +24,6 @@ try:
-     if twisted_version < Version("twisted", 2, 5, 0):
-         raise ImportError("Twisted >= 2.5 is required. Please install it.")
- 
--    if twisted_web_version < Version("twisted.web", 2, 5, 0):
--        raise ImportError("Twisted.Web >= 2.5 is required. Please install it")
- except ImportError, exc:
-     # log error to stderr, might be useful for debugging purpose
-     for arg in exc.args:
--- 
-2.8.1
-
diff --git a/package/python-coherence/Config.in b/package/python-coherence/Config.in
deleted file mode 100644
index 0f50080e67..0000000000
--- a/package/python-coherence/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PYTHON_COHERENCE
-	bool "python-coherence"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_TWISTED
-	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
-	select BR2_PACKAGE_PYTHON_PYASN1
-	help
-	  A DLNA/UPnP Media Server and Framework for the Digital Living.
-
-	  https://github.com/coherence-project/Coherence
diff --git a/package/python-coherence/python-coherence.hash b/package/python-coherence/python-coherence.hash
deleted file mode 100644
index 3c2d45b537..0000000000
--- a/package/python-coherence/python-coherence.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  97c8b700b3fe73d48eacb259008f410d6567e5d7d1b8e96386f8cc2422135ca5  python-coherence-b7856985fd496689ca1f9024925ae737297c00d1.tar.gz
-sha256  7713ed8484b4d3364c7f6f2c02aed427b06a0159b1f77aecf907d47016812e81  LICENCE
diff --git a/package/python-coherence/python-coherence.mk b/package/python-coherence/python-coherence.mk
deleted file mode 100644
index 24da7f70a7..0000000000
--- a/package/python-coherence/python-coherence.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# python-coherence
-#
-################################################################################
-
-PYTHON_COHERENCE_VERSION = b7856985fd496689ca1f9024925ae737297c00d1
-PYTHON_COHERENCE_SITE = $(call github,coherence-project,Coherence,$(PYTHON_COHERENCE_VERSION))
-PYTHON_COHERENCE_SETUP_TYPE = setuptools
-PYTHON_COHERENCE_LICENSE = MIT
-PYTHON_COHERENCE_LICENSE_FILES = LICENCE
-
-$(eval $(python-package))
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index d1c2917ea9..5a2e6da900 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -1,19 +1,15 @@
 config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	bool "python-cryptography"
+	depends on BR2_PACKAGE_PYTHON3 # python-idna
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
 	  primitives and recipes to Python developers.
diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
index df5e4887f4..41b4aacd5e 100644
--- a/package/python-docker/Config.in
+++ b/package/python-docker/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_PYTHON_DOCKER
 	bool "python-docker"
-	# docker-engine may be running on another host, so no dependency
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
-	       if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3 # python-requests -> python-idna
+	# docker-engine may be running on another host, so no other dependency
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
diff --git a/package/python-hyperlink/Config.in b/package/python-hyperlink/Config.in
index 8dad0af19a..3a85e6f461 100644
--- a/package/python-hyperlink/Config.in
+++ b/package/python-hyperlink/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_HYPERLINK
 	bool "python-hyperlink"
+	depends on BR2_PACKAGE_PYTHON3 # python-idna
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	help
 	  A featureful, correct URL for Python.
diff --git a/package/python-ibmiotf/Config.in b/package/python-ibmiotf/Config.in
index 0f5f75be5e..3f3f7e1965 100644
--- a/package/python-ibmiotf/Config.in
+++ b/package/python-ibmiotf/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_PYTHON_IBMIOTF
 	bool "python-ibmiotf"
+	depends on BR2_PACKAGE_PYTHON3 # python-requests -> python-idna
 	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_PAHO_MQTT # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Python Client for IBM Watson IoT Platform.
 
diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
index e3e548d493..3df634f9bf 100644
--- a/package/python-idna/Config.in
+++ b/package/python-idna/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_IDNA
 	bool "python-idna"
-	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	help
 	  A library to support the Internationalised Domain Names in
 	  Applications (IDNA) protocol as specified in RFC 5891. This
diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index c5f7378fda..08a7be9d56 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  7a910c706db30d758f377db2762c0f9a  idna-2.10.tar.gz
-sha256  b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6  idna-2.10.tar.gz
+md5  08ea8e2ce09e522424e872409c221138  idna-3.2.tar.gz
+sha256  467fbad99067910785144ce333826c71fb0e63a425657295239737f7ecd125f3  idna-3.2.tar.gz
 # Locally computed sha256 checksums
-sha256  412014420d2473dba06117c3d4d9e0eecaa6dde0ca30cd951f4ec2be39426f32  LICENSE.rst
+sha256  a2d6e4d940bd24dbe7b9645cde19a9792cc51db7ae0d5acd301ac860caa3e836  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index b4d9839e29..7314d85493 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 2.10
+PYTHON_IDNA_VERSION = 3.2
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/ea/b7/e0e3c1c467636186c39925827be42f16fee389dc404ac29e930e9136be70
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/cb/38/4c4d00ddfa48abe616d7e572e02a04273603db446975ab46bbcd36552005
 PYTHON_IDNA_LICENSE = BSD-3-Clause
-PYTHON_IDNA_LICENSE_FILES = LICENSE.rst
+PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
diff --git a/package/python-influxdb/Config.in b/package/python-influxdb/Config.in
index 6ebbd4aa9c..48c300f90d 100644
--- a/package/python-influxdb/Config.in
+++ b/package/python-influxdb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_INFLUXDB
 	bool "python-influxdb"
+	depends on BR2_PACKAGE_PYTHON3 # python-requests -> python-idna
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
index dc93e6c0df..1af60fdcd0 100644
--- a/package/python-mwclient/Config.in
+++ b/package/python-mwclient/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MWCLIENT
 	bool "python-mwclient"
+	depends on BR2_PACKAGE_PYTHON3 # python-requests-oauthlib -> python-requests -> python-idna
 	select BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
index c32e211e17..95630f2461 100644
--- a/package/python-pyopenssl/Config.in
+++ b/package/python-pyopenssl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYOPENSSL
 	bool "python-pyopenssl"
+	depends on BR2_PACKAGE_PYTHON3 # python-cryptography -> python-idna
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
diff --git a/package/python-requests-oauthlib/Config.in b/package/python-requests-oauthlib/Config.in
index 85283b209c..2510644bd1 100644
--- a/package/python-requests-oauthlib/Config.in
+++ b/package/python-requests-oauthlib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB
 	bool "python-requests-oauthlib"
+	depends on BR2_PACKAGE_PYTHON3 # python-requests -> python-idna
 	select BR2_PACKAGE_PYTHON_OAUTHLIB # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
diff --git a/package/python-requests-toolbelt/Config.in b/package/python-requests-toolbelt/Config.in
index ba2b95152e..47141c2c8a 100644
--- a/package/python-requests-toolbelt/Config.in
+++ b/package/python-requests-toolbelt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT
 	bool "python-requests-toolbelt"
+	depends on BR2_PACKAGE_PYTHON3 # python-requests -> python-idna
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
 	  A utility belt for advanced users of python-requests.
diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index 30158b8d25..c798156613 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -1,14 +1,12 @@
 config BR2_PACKAGE_PYTHON_REQUESTS
 	bool "python-requests"
+	depends on BR2_PACKAGE_PYTHON3 # python-idna
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PYTHON_CHARDET # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
-	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Requests is an Apache2 Licensed HTTP library, written in
 	  Python, for human beings.
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index 0260ab4010..cac1c06912 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
+	depends on BR2_PACKAGE_PYTHON3 # python-pyopenssl -> python-cryptography -> python-idna
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 23056e72d2..47719f92bf 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
+	depends on BR2_PACKAGE_PYTHON3 # python-idna
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 4e24a3f71a..805a1aa345 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
+	depends on BR2_PACKAGE_PYTHON3 # python-hyperlink -> python-idna
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
index f38bbf93f0..c7de322f91 100644
--- a/package/python-txdbus/Config.in
+++ b/package/python-txdbus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TXDBUS
 	bool "python-txdbus"
+	depends on BR2_PACKAGE_PYTHON3 # python-twisted -> python-cryptography -> python-idna
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-txtorcon/Config.in b/package/python-txtorcon/Config.in
index 4f91e7b048..9677eb4da8 100644
--- a/package/python-txtorcon/Config.in
+++ b/package/python-txtorcon/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PYTHON_TXTORCON
 	bool "python-txtorcon"
+	depends on BR2_PACKAGE_PYTHON3 # python-idna
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-service-identity
 	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
-	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
