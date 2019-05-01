From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 May 2019 09:24:26 +0200
Subject: [Buildroot] [git commit] package/python-itsdangerous: bump to
 version 1.1.0
Message-ID: <20190501072307.F090D83D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cb60a21f49c0e77e89a5b473c92a5192e9bc84d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash for the license file, and change the license file to LICENSE.rst
as LICENSE no longer exists.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-itsdangerous/python-itsdangerous.hash | 6 ++++--
 package/python-itsdangerous/python-itsdangerous.mk   | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-itsdangerous/python-itsdangerous.hash b/package/python-itsdangerous/python-itsdangerous.hash
index a927b8b7ab..0904a91183 100644
--- a/package/python-itsdangerous/python-itsdangerous.hash
+++ b/package/python-itsdangerous/python-itsdangerous.hash
@@ -1,2 +1,4 @@
-# Locally calculated
-sha256 b035b2da1d493b00a5ee7a5b750f96929de87b610643939fbe382902774626fc  python-itsdangerous-0.24.tar.gz
+# md5, sha256 from https://pypi.org/pypi/itsdangerous/json
+md5	9b7f5afa7f1e3acfb7786eeca3d99307  itsdangerous-1.1.0.tar.gz
+sha256	321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19  itsdangerous-1.1.0.tar.gz
+sha256	feb28bfa348d816b0e7dbaeddf18499ee7e8007c67813db8d6ab37c65e046cd4  LICENSE.rst
diff --git a/package/python-itsdangerous/python-itsdangerous.mk b/package/python-itsdangerous/python-itsdangerous.mk
index 45adbb0655..9429233703 100644
--- a/package/python-itsdangerous/python-itsdangerous.mk
+++ b/package/python-itsdangerous/python-itsdangerous.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ITSDANGEROUS_VERSION = 0.24
-PYTHON_ITSDANGEROUS_SITE = $(call github,mitsuhiko,itsdangerous,$(PYTHON_ITSDANGEROUS_VERSION))
+PYTHON_ITSDANGEROUS_VERSION = 1.1.0
+PYTHON_ITSDANGEROUS_SOURCE = itsdangerous-$(PYTHON_ITSDANGEROUS_VERSION).tar.gz
+PYTHON_ITSDANGEROUS_SITE = https://files.pythonhosted.org/packages/68/1a/f27de07a8a304ad5fa817bbe383d1238ac4396da447fa11ed937039fa04b
 PYTHON_ITSDANGEROUS_SETUP_TYPE = setuptools
 PYTHON_ITSDANGEROUS_LICENSE = BSD-3-Clause
-PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE
+PYTHON_ITSDANGEROUS_LICENSE_FILES = LICENSE.rst
 
 $(eval $(python-package))
