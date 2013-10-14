From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:00:09 +0200
Subject: [Buildroot] [git commit] sam-ba: specify ln -sf to remove existing
	destination file
Message-ID: <20131014203036.94FFF9A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58712bbe4f085e92962db17d2d4ae34057d9384e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes below build error when executing
"make host-sam-ba-dirclean; make host-sam-ba-rebuild".

ln -s ../../opt/sam-ba/sam-ba /opt/test/br-x86/buildroot/output/host/usr/bin/sam-ba
ln: failed to create symbolic link '/opt/test/br-x86/buildroot/output/host/usr/bin/sam-ba': File exists
make: *** [/opt/test/br-x86/buildroot/output/build/host-sam-ba-2.12/.stamp_host_installed] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sam-ba/sam-ba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
