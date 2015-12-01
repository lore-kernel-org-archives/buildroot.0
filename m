From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:19 -0000
Subject: [Buildroot] [git commit] swig: use a relative path for the host
	swig2.0 symlink's target
Message-ID: <20151201232117.A17547FA3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f99baf41ab9fb15cd874c1e90ba7fe0a6eefdcbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An absolute path isn't really necessary and breaks relocating

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
