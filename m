From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:56:46 +0200
Subject: [Buildroot] [git commit] package/python-rtslib-fb: update URL to
	the open-iscsi organization
Message-ID: <20161009115741.DB90C81ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9a207e4ffbd099365da30d0f4ebd259b40c1862
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a comment to indicate that python-configshell-fb and
targetcli-fb should be bumped every time python-rtslib-fb is bumped
because upstream usually upgrades all of these packages at the same
time.

Another comment warns that switching this package to PyPI would make us
miss new versions of python-rtslib-fb.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-rtslib-fb/Config.in           | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
index 7bae560..f408334 100644
--- a/package/python-rtslib-fb/Config.in
+++ b/package/python-rtslib-fb/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_RTSLIB_FB
 	  the LIO generic SCSI target, present in 3.x Linux kernel
 	  versions.
 
-	  https://github.com/agrover/rtslib-fb
+	  https://github.com/open-iscsi/rtslib-fb
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 85bee0b..8236fb8 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -4,8 +4,11 @@
 #
 ################################################################################
 
+# When upgrading the version, be sure to also upgrade
+# python-configshell-fb and targetcli-fb at the same time.
 PYTHON_RTSLIB_FB_VERSION = v2.1.fb57
-PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
+# Do not switch site to PyPI: it does not contain the latest version.
+PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
 PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
 PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
