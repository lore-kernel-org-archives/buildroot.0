From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Apr 2013 22:13:44 +0200
Subject: [Buildroot] [git commit] post-image: show each script filename
	before execution
Message-ID: <20130424201555.3E9059B765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d90a69f6c58caff17c1de2f000b65f9bc5a9077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also simplifies code by removing the ifneq/endif clauses.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index e825bcd..840aa1f 100644
--- a/Makefile
+++ b/Makefile
@@ -555,11 +555,9 @@ target-generatelocales: host-localedef
 endif
 
 target-post-image:
-ifneq ($(BR2_ROOTFS_POST_IMAGE_SCRIPT),"")
-	@$(call MESSAGE,"Executing post-image script\(s\)")
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
+		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(s) $(BINARIES_DIR)$(sep))
-endif
 
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
