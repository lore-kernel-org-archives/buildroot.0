From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  6 Mar 2013 18:14:22 +0100
Subject: [Buildroot] [PATCH 1/5] cmake: convert spaces to tabs in make rules
In-Reply-To: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1362590066-5448-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/cmake/cmake.mk |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

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
-- 
1.7.10.4
