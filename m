From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:21:01 +0100
Subject: [Buildroot] [git commit] package/python-ecdsa: bump to version 0.15
Message-ID: <20200309140906.747AC821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f843ff366c64775c54581db2eef839c879f0274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select new requirement python-six.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ecdsa/Config.in         | 1 +
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-ecdsa/Config.in b/package/python-ecdsa/Config.in
index ce11910e8b..eb0d65801f 100644
--- a/package/python-ecdsa/Config.in
+++ b/package/python-ecdsa/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ECDSA
 	bool "python-ecdsa"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  ECDSA cryptographic signature library (pure python).
 
diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index 3e24783657..efe396bf0a 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5	b1b33f7fe171eb1278de6f93eefc34f8  ecdsa-0.13.3.tar.gz
-sha256	163c80b064a763ea733870feb96f9dd9b92216cfcacd374837af18e4e8ec3d4d  ecdsa-0.13.3.tar.gz
+md5	821d543047941dd26f543f62912230d4  ecdsa-0.15.tar.gz
+sha256	8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277  ecdsa-0.15.tar.gz
 # Locally computed sha256 checksums
 sha256	3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 90e359f8b7..ffb51a3aa5 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.13.3
+PYTHON_ECDSA_VERSION = 0.15
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/8c/d8/9c3596fd0f18ae0a76333492a119c00183323d8e64de1a4f4bd642856963
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/e3/7c/b508ade1feb47cd79222e06d85e477f5cfc4fb0455ad3c70eb6330fc49aa
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
