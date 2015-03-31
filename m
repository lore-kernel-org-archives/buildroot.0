From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:54:47 +0200
Subject: [Buildroot] [git commit] mesa3d: specify llvm-prefix
Message-ID: <20150331115925.46CDC7FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ea04028e1b2939fe32740c4ce34fe11b91ef617
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When it's not defined an automatic search is triggered, which can find
/usr/bin/llvm-config on distributions that include all development files
(like gentoo) and have desktop packages installed.
So point it towards the staging dir which is where it should live
eventually if/when we've got it to avoid header/include path polution
that otherwise leads to build failures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fc82227..7473110 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -128,4 +128,7 @@ else
 MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
+# Avoid automatic search of llvm-config
+MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin
+
 $(eval $(autotools-package))
