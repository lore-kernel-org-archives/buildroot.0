From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:49 +0200
Subject: [Buildroot] [PATCH 15/53] pkg-python: use $(HOST_DIR) instead of
	$(HOST_DIR)/usr as prefix
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-16-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the redundant usr/ component of the HOST_DIR paths. Since a
previous commit added a symlink from $(HOST_DIR)/usr to $(HOST_DIR),
everything keeps on working.

Build-tested with a bunch of python packages.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 2418f5dfa4..6e411ab5c5 100644
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
-- 
2.11.0
