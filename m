From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 14 Oct 2013 21:22:19 +0800
Subject: [Buildroot] [PATCH 2/3] sam-ba: specify ln -sf to remove existing
 destination file
In-Reply-To: <1381756890.15266.1.camel@phoenix>
References: <1381756890.15266.1.camel@phoenix>
Message-ID: <1381756939.15266.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes below build error when executing
"make host-sam-ba-dirclean; make host-sam-ba-rebuild".

ln -s ../../opt/sam-ba/sam-ba /opt/test/br-x86/buildroot/output/host/usr/bin/sam-ba
ln: failed to create symbolic link '/opt/test/br-x86/buildroot/output/host/usr/bin/sam-ba': File exists
make: *** [/opt/test/br-x86/buildroot/output/build/host-sam-ba-2.12/.stamp_host_installed] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/sam-ba/sam-ba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index e425503..8e24fa6 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -24,7 +24,7 @@ endef
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
-	ln -s ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
+	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
 endef
 
 $(eval $(host-generic-package))
-- 
1.8.1.2
