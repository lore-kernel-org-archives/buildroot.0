From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:50:29 +0200
Subject: [Buildroot] [git commit] pkg-python: use $(HOST_DIR) instead of
	$(HOST_DIR)/usr as prefix
Message-ID: <20170705095036.73FA67FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=048689be87693b45a7d682ebe2754d1db9bf4f61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

Build-tested with a bunch of python packages.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 2418f5d..6e411ab 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -53,7 +53,7 @@ HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PYTHONNOUSERSITE=1
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
-	--prefix=$(HOST_DIR)/usr
+	--prefix=$(HOST_DIR)
 
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
@@ -83,7 +83,7 @@ HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PYTHONNOUSERSITE=1
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
-	--prefix=$(HOST_DIR)/usr
+	--prefix=$(HOST_DIR)
 
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
