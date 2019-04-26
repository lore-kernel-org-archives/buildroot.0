From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:05:51 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-urllib3:
 security bump to version 1.24.2
Message-ID: <20190426130224.00E4980163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39dc2c601f713fad3e2c8d0d2d59c13f6a53fac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

- CVE-2019-11324: The urllib3 library before 1.24.2 for Python mishandles
  certain cases where the desired set of CA certificates is different from
  the OS store of CA certificates, which results in SSL connections
  succeeding in situations where a verification failure is the correct
  outcome.  This is related to use of the ssl_context, ca_certs, or
  ca_certs_dir argument.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5bc45c5e77505cc07902e6fbd99a15c9d352ded7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 098c7940a0..ec075cb4f6 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5	f3d8b1841539200c949a33e87e551d8e  urllib3-1.24.1.tar.gz
-sha256	de9529817c93f27c8ccbfead6985011db27bd0ddfcdb2d86f3f663385c6a9c22  urllib3-1.24.1.tar.gz
+md5	20bb5a170a534bd0acd98bfc007fcc22  urllib3-1.24.2.tar.gz
+sha256	9a247273df709c4fedb38c711e44292304f73f39ab01beda9f6b9fc375669ac3  urllib3-1.24.2.tar.gz
 # Locally computed sha256 checksums
 sha256	11db569430ca5ad793f1399297b8df5041a22137abaf90642ea71da21d59121c  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index a2c3096a9c..893d32d976 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.24.1
+PYTHON_URLLIB3_VERSION = 1.24.2
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/fd/fa/b21f4f03176463a6cccdb612a5ff71b927e5224e83483012747c12fc5d62
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
