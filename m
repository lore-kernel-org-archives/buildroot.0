From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 26 Oct 2016 11:19:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/nvidia-driver: indentation cleanup
Message-ID: <1477473548-16918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index c1fc986..626ff84 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -160,7 +160,7 @@ define NVIDIA_DRIVER_INSTALL_LIBS
 	$(foreach lib,$(NVIDIA_DRIVER_LIBS),\
 		$(INSTALL) -D -m 0644 $(@D)/$(lib) $(1)/usr/lib/$(notdir $(lib))
 		libsoname="$$( $(TARGET_READELF) -d "$(@D)/$(lib)" \
-		       |sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
+			|sed -r -e '/.*\(SONAME\).*\[(.*)\]$$/!d; s//\1/;' )"; \
 		if [ -n "$${libsoname}" -a "$${libsoname}" != "$(notdir $(lib))" ]; then \
 			ln -sf $(notdir $(lib)) \
 				$(1)/usr/lib/$${libsoname}; \
-- 
1.9.1
