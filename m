From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 14:34:46 +0200
Subject: [Buildroot] [git commit] package/python-pyzmq: bump to version
 18.0.2
Message-ID: <20190801123216.DDC4B83D20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f10dec399e4c6215284b79cace9b0b597652e0d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the patch for the newer version.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-use-buildroot-zmq-version-instead-of-detect.patch   | 12 ++++++------
 package/python-pyzmq/python-pyzmq.hash                       |  4 ++--
 package/python-pyzmq/python-pyzmq.mk                         |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
index 461ef4e5fe..315c8c8bb2 100644
--- a/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
+++ b/package/python-pyzmq/0001-use-buildroot-zmq-version-instead-of-detect.patch
@@ -15,7 +15,7 @@ dynamically, return the version of the buildroot environment.
 Written by Michael Rommel, modified for version 16.0.2 by Lionel
 Flandrin.
 
-Modified for version 17.1.2 by Asaf Kahlon.
+Modified for version 18.0.2 by Asaf Kahlon
 
 Signed-off-by: Lionel Flandrin <lionel@svkt.org>
 Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
@@ -24,16 +24,16 @@ Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
  1 file changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/buildutils/detect.py b/buildutils/detect.py
-index cb14a8d..b33a3b5 100644
+index d1380fe..4a91351 100644
 --- a/buildutils/detect.py
 +++ b/buildutils/detect.py
-@@ -116,13 +116,15 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
-     
+@@ -120,13 +120,15 @@ def detect_zmq(basedir, compiler=None, **compiler_attrs):
+ 
      cc = get_compiler(compiler=compiler, **compiler_attrs)
      efile = test_compilation(cfile, compiler=cc, **compiler_attrs)
 -    patch_lib_paths(efile, cc.library_dirs)
 +    #patch_lib_paths(efile, cc.library_dirs)
-     
+ 
 -    rc, so, se = get_output_error([efile])
 -    if rc:
 -        msg = "Error running version detection script:\n%s\n%s" % (so,se)
@@ -50,5 +50,5 @@ index cb14a8d..b33a3b5 100644
      handlers = {'vers':  lambda val: tuple(int(v) for v in val.split('.'))}
  
 -- 
-2.17.1
+2.20.1
 
diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index 58d5fa1f56..330ca7b4cd 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5    81d643d1e9eb9238960a18b6b0989db2  pyzmq-18.0.0.tar.gz
-sha256 b30c339eb58355f51f4f54dd61d785f1ff58c86bca1c3a5916977631d121867b  pyzmq-18.0.0.tar.gz
+md5	1bcdc3a18c99875e01a24735dc168b8d  pyzmq-18.0.2.tar.gz
+sha256	31a11d37ac73107363b47e14c94547dbfc6a550029c3fe0530be443199026fc2  pyzmq-18.0.2.tar.gz
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 5d772b9fa3..bcc2604008 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 18.0.0
+PYTHON_PYZMQ_VERSION = 18.0.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/64/8d/78975da77627fd863c08e8ea3c7cebce7e51bed2936be5118de6b0050638
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/a8/5e/7e4ed045fc1fb7667de4975fe8b6ab6b358b16bcc59e8349c9bd092931b6
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
