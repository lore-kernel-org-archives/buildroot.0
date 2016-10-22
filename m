From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] 4th: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132037.CC7C17F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2742bd3388e1e9d09a7d9c3408919e9e008fe027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/4th/4th.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 7828592..0d82614 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -54,14 +54,14 @@ define 4TH_INSTALL_TARGET_CMDS
 endef
 
 define HOST_4TH_BUILD_CMDS
-	$(MAKE) -C $(@D)/sources all \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/sources all \
 		CFLAGS="$(HOST_CFLAGS) -DUNIX -fsigned-char"
 endef
 
 define HOST_4TH_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/usr/bin
 	mkdir -p $(HOST_DIR)/usr/lib
-	$(MAKE) -C $(@D)/sources mostlyinstall \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/sources mostlyinstall \
 		BINARIES=$(HOST_DIR)/usr/bin \
 		LIBRARIES=$(HOST_DIR)/usr/lib
 endef
