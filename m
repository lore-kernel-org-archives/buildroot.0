From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:30:26 +0200
Subject: [Buildroot] [git commit] package/python-urllib3: security bump to
 version 1.26.6
Message-ID: <20210716205644.2A087911E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=56a105f9fb80fa2f6bd01280d64744cd3e7d73c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-33503: An issue was discovered in urllib3 before 1.26.5.
When provided with a URL containing many @ characters in the authority
component, the authority regular expression exhibits catastrophic
backtracking, causing a denial of service if a URL were passed as a
parameter or redirected to via an HTTP redirect.

https://github.com/urllib3/urllib3/blob/1.26.6/CHANGES.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 820156b4ca..288d986e7c 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  e2a2039e22fc29b751e26b7042e8db2f  urllib3-1.26.4.tar.gz
-sha256  e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937  urllib3-1.26.4.tar.gz
+md5  3a88ec3bcb761ca23df2c3583949be37  urllib3-1.26.6.tar.gz
+sha256  f57b4c16c62fa2760b7e3d97c35b255512fb6b59a259730f36ba32ce9f8e342f  urllib3-1.26.6.tar.gz
 # Locally computed sha256 checksums
 sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index d5a04163f9..775986d516 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.4
+PYTHON_URLLIB3_VERSION = 1.26.6
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/cb/cf/871177f1fc795c6c10787bc0e1f27bb6cf7b81dbde399fd35860472cecbc
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/4f/5a/597ef5911cb8919efe4d86206aa8b2658616d676a7088f0825ca08bd7cb8
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
