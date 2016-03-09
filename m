From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  9 Mar 2016 22:30:28 +0100
Subject: [Buildroot] [PATCH 1/5] nvidia-driver: indentation cleanup
Message-ID: <1457559032-3384-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/nvidia-driver/nvidia-driver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 7eef73b..49ef9e1 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -144,7 +144,7 @@ endif # BR2_PACKAGE_NVIDIA_DRIVER_MODULE == y
 # no-version symlink, so we can link to them at build time.
 define NVIDIA_DRIVER_INSTALL_LIBS
 	for libpath in $(addsuffix .so.$(NVIDIA_DRIVER_VERSION),$(NVIDIA_DRIVER_LIBS)) \
-	           $(NVIDIA_DRIVER_LIBS_NO_VERSION); \
+		$(NVIDIA_DRIVER_LIBS_NO_VERSION); \
 	do \
 		libname="$${libpath##*/}"; \
 		$(INSTALL) -D -m 0644 $(@D)/$${libpath} $(1)/usr/lib/$${libname}; \
-- 
1.9.1
