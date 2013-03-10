From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 21:27:21 +0100
Subject: [Buildroot] [git commit] cmake: convert spaces to tabs in make rules
Message-ID: <20130310203044.E19899AF86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9b0023c5b2c41002aae8826a63e1127cb6d846d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cmake/cmake.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6836172..d0db502e 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -10,19 +10,19 @@ CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
 define HOST_CMAKE_CONFIGURE_CMDS
- (cd $(@D); \
-	LDFLAGS="$(HOST_LDFLAGS)" \
-	CFLAGS="$(HOST_CFLAGS)" \
-	./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
- )
+	(cd $(@D); \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		CFLAGS="$(HOST_CFLAGS)" \
+		./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
+	)
 endef
 
 define HOST_CMAKE_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_CMAKE_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
 $(eval $(generic-package))
