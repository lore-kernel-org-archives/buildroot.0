From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:17:33 +0100
Subject: [Buildroot] [git commit] package/python-webpy: fix licensing
	information
Message-ID: <20151219131738.B1DBE81E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85854ac8b3daefea43cad5c289780f3eeef447b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license files defined in the .mk do not exist in the release
tarball. However, they do exist in the git repository.

Since the git tree is rather small, switch to using it instead of the
released tarball.

Fixes:
    http://autobuild.buildroot.org/results/d94/d944f36220326510c15685efe19075e90e72a5c3/
    http://autobuild.buildroot.org/results/14f/14f411ef29cbf0ba8cf4a4fed71556eacc96eb04/
    and many others...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-webpy/python-webpy.hash | 5 ++---
 package/python-webpy/python-webpy.mk   | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
index 05ee808..0e0a8d0 100644
--- a/package/python-webpy/python-webpy.hash
+++ b/package/python-webpy/python-webpy.hash
@@ -1,3 +1,2 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=93375e3f03e74d6bf5c5096a4962a8db, sha256 locally computed
-md5     93375e3f03e74d6bf5c5096a4962a8db  web.py-0.37.tar.gz
-sha256  748c7e99ad9e36f62ea19f7965eb7dd7860b530e8f563ed60ce3e53e7409a550  web.py-0.37.tar.gz
+# Locally computed
+sha256  c3cb8930739294103b1ad109e5fd1d0efae67c06d5b6d59fce5b5a2ee6b21624  python-webpy-webpy-0.37.tar.gz
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index 2074b39..8bcc8ec 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_WEBPY_VERSION = 0.37
-PYTHON_WEBPY_SOURCE = web.py-$(PYTHON_WEBPY_VERSION).tar.gz
-PYTHON_WEBPY_SITE = https://pypi.python.org/packages/source/w/web.py
+PYTHON_WEBPY_VERSION = webpy-0.37
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,$(PYTHON_WEBPY_VERSION))
 PYTHON_WEBPY_SETUP_TYPE = distutils
 PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
 PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
