From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 23:16:17 +0200
Subject: [Buildroot] [git commit] package/python-cryptography: bump to
 version 2.9
Message-ID: <20200417210200.E5D768F06A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22d784d5753ad522328f4fe4be7f993a32fb6a91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can remove CFLAGS="$(TARGET_CFLAGS) -pthread" as of upstream commit:
https://github.com/pyca/cryptography/commit/085382fb17a560dd11e4710077b63a26d5dcf05c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/python-cryptography.hash | 10 +++++-----
 package/python-cryptography/python-cryptography.mk   |  5 ++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 30ffa73d72..1323e490dd 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/cryptography/json
-md5	77730058b556c6d9838679a94c6229ce  cryptography-2.8.tar.gz
-sha256	3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651  cryptography-2.8.tar.gz
+md5  b1d1802e8874fa7d18e84bfe5607333f  cryptography-2.9.tar.gz
+sha256  0cacd3ef5c604b8e5f59bf2582c076c98a37fe206b31430d0cd08138aff0986e  cryptography-2.9.tar.gz
 # Locally computed sha256 checksums
-sha256	35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
-sha256	aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
-sha256	602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
+sha256  35452b557fab0efb1e80d7edb9c4e5118b9384082adaa051dde342102cb9de8d  LICENSE
+sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
+sha256  602c4c7482de6479dd2e9793cda275e5e63d773dacd1eca689232ab7008fb4fb  LICENSE.BSD
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 54437ae688..5e58266e64 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 2.8
+PYTHON_CRYPTOGRAPHY_VERSION = 2.9
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/be/60/da377e1bed002716fb2d5d1d1cab720f298cb33ecff7bf7adea72788e4e4
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/9d/0a/d7060601834b1a0a84845d6ae2cd59be077aafa2133455062e47c9733024
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
-PYTHON_CRYPTOGRAPHY_ENV = CFLAGS="$(TARGET_CFLAGS) -pthread"
 
 $(eval $(python-package))
