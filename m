From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 24 Feb 2020 11:12:52 +0100
Subject: [Buildroot] [PATCH] package/swig: create a symlink for swig3.0
Message-ID: <20200224101252.29177-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

For now swig package creates a symlink to the latest swig version
i.e. swig4.0. If the host already has both CMake 3.10 and earlier
swig version then the earlier version (swig2.0 or swig3.0) will
be detected. This happens because CMake 3.10 doesn't know about
swig4.0 and thus searches for swig3.0 first and finds it on the
host.

With the new symlink CMake will find buildroot's swig binary.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/swig/swig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 3dba3425cf..5881a0e423 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -27,6 +27,7 @@ SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
 define HOST_SWIG_INSTALL_SYMLINK
 	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/bin/swig3.0
 endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
-- 
2.17.0
