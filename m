From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 16 Nov 2015 11:25:04 +0100
Subject: [Buildroot] [PATCH 1/1] swig: use a relative path for the host
	swig2.0 symlink's target
Message-ID: <1447669504-10777-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An absolute path isn't really necessary and breaks relocating

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/swig/swig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 3f3ab2f..6b9b8ae 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -25,7 +25,7 @@ SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 # swig, so that our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
-	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
 endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
-- 
2.1.4
