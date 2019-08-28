From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 17:14:40 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python3-urllib:
 security bump to version 1.24.3
Message-ID: <20190828151112.374B9880F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86f86a724bc0fe77f87d565c80ef9c8798916c01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerability:

CVE-2019-9740: An issue was discovered in urllib2 in Python 2.x through
2.7.16 and urllib in Python 3.x through 3.7.3.  CRLF injection is possible
if the attacker controls a url parameter, as demonstrated by the first
argument to urllib.request.urlopen with \r\n (specifically in the query
string after a ?  character) followed by an HTTP header or a Redis command.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index ec075cb4f6..b3f9038918 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5	20bb5a170a534bd0acd98bfc007fcc22  urllib3-1.24.2.tar.gz
-sha256	9a247273df709c4fedb38c711e44292304f73f39ab01beda9f6b9fc375669ac3  urllib3-1.24.2.tar.gz
+md5	1efcddca675b80f3ac110439921fc66b  urllib3-1.24.3.tar.gz
+sha256	2393a695cd12afedd0dcb26fe5d50d0cf248e5a66f75dbd89a3d4eb333a61af4  urllib3-1.24.3.tar.gz
 # Locally computed sha256 checksums
 sha256	11db569430ca5ad793f1399297b8df5041a22137abaf90642ea71da21d59121c  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 893d32d976..309e18f10f 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.24.2
+PYTHON_URLLIB3_VERSION = 1.24.3
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/fd/fa/b21f4f03176463a6cccdb612a5ff71b927e5224e83483012747c12fc5d62
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/8a/3c/1bb7ef6c435dea026f06ed9f3ba16aa93f9f4f5d3857a51a35dfa00882f1
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
