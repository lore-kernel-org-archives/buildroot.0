From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 22:54:37 +0200
Subject: [Buildroot] [git commit] libnl: minor package fixes
Message-ID: <20110516210341.E511C8352F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f890debb30c0ce920bc44e7d74f1d5d4280d4625
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* libnl fails to build with multiple jobs so keep make at -j1
* Multiple libraries are installed so update uninstall target for this

[Peter: remove libnl/libnl-*.* to catch subdir + any new libs in the future]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 8d3b9ad..6edb1f8 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -9,9 +9,11 @@ LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
+LIBNL_MAKE = $(MAKE1)
 
 define LIBNL_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
+	rm -r $(TARGET_DIR)/usr/lib/libnl.* $(TARGET_DIR)/usr/lib/libnl-*.*
+	rm -rf $(TARGET_DIR)/usr/lib/libnl
 endef
 
 $(eval $(call AUTOTARGETS,package,libnl))
-- 
1.7.3.4
