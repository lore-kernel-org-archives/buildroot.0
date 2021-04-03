From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 12:18:12 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-urllib3:
 security bump to version 1.26.4
Message-ID: <20210403095655.57F1C8B587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=378547b1a0072640c1db84fb501fbf6e5e81c86e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-28363: The urllib3 library 1.26.x before 1.26.4 for Python
omits SSL certificate validation in some cases involving HTTPS to HTTPS
proxies. The initial connection to the HTTPS proxy (if an SSLContext
isn't given via proxy_config) doesn't verify the hostname of the
certificate. This means certificates for different servers that still
validate properly with the default urllib3 SSLContext will be silently
accepted.

https://github.com/urllib3/urllib3/blob/1.26.4/CHANGES.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4a8c6746bfbd8bcf91d85239362a1618befcaf56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index dbc85c9114..820156b4ca 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  2233256ccfe140a915f68703f8c2cc1f  urllib3-1.26.2.tar.gz
-sha256  19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08  urllib3-1.26.2.tar.gz
+md5  e2a2039e22fc29b751e26b7042e8db2f  urllib3-1.26.4.tar.gz
+sha256  e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937  urllib3-1.26.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 82db02fcc2..d5a04163f9 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.2
+PYTHON_URLLIB3_VERSION = 1.26.4
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/cb/cf/871177f1fc795c6c10787bc0e1f27bb6cf7b81dbde399fd35860472cecbc
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
