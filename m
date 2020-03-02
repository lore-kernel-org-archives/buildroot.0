From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2020 23:28:32 +0100
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 4.7.5
Message-ID: <20200302221916.1B0758F16D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62355ebd4f94b70c4ecc677133a6d79a7466c124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a number of issues. From the CHANGES file:

- Fixed creating and updating of MultiDict from a sequence of pairs and
  keyword arguments.  Previously passing a list argument modified it
  inplace, and other sequences caused an error.
  https://github.com/aio-libs/multidict/issues/457

- Fixed comparing with mapping: an exception raised in the __len__ method caused raising a SyntaxError.
  https://github.com/aio-libs/multidict/issues/459

- Fixed comparing with mapping: all exceptions raised in the __getitem__
  method were silenced.
  https://github.com/aio-libs/multidict/issues/460>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-multidict/python-multidict.hash | 6 +++---
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index 02e1c1ef51..431a94247a 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	22b46f759cf2cc3ca1d2c9f82cc9bb79  multidict-4.7.4.tar.gz
-sha256	d7d428488c67b09b26928950a395e41cc72bb9c3d5abfe9f0521940ee4f796d4  multidict-4.7.4.tar.gz
+md5  9a1ed2cc0cd3e5dd2e71921104f2b760  multidict-4.7.5.tar.gz
+sha256  aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e  multidict-4.7.5.tar.gz
 # Locally computed sha256 checksums
-sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
+sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 10aa556aa1..2f80b1f851 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.7.4
+PYTHON_MULTIDICT_VERSION = 4.7.5
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/b6/22/ae21cedaa0e6d35e84e8ab57700dcf3d4609421ebe113e1aaafc468eec42
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/61/b4/475114b3f1671da634f89239e61038f8742d9ac13aa34b32a05bf8022d22
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
