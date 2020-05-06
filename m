From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 06:57:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/azure-iot-sdk-c:
 use full destination path for $(INSTALL)
Message-ID: <20200506051930.ACB7281027@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42687ce6750ae972de0b478233cfa6edbd4bf20d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The canonical way to use $(INSTALL) is to have a full destination
path, that includes the file name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 59de11b0476699ddeb2cbcd30a524b849249956a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index b194bf9a4c..e6345104eb 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -46,7 +46,7 @@ endif
 
 define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
 	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
-		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
+		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/$(notdir $(l))
 	)
 	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
 	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
@@ -54,7 +54,7 @@ endef
 
 define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
 	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
-		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/
+		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/$(notdir $(l))
 	)
 endef
 
