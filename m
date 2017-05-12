From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 May 2017 15:28:46 +0100
Subject: [Buildroot] [PATCH next 1/3] ed: add host package
Message-ID: <20170512142848.13956-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will be necessary for updating bc's version in a subsequent patch.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ed/ed.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index ada0316..7f69480 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -21,12 +21,29 @@ define ED_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_ED_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_MAKE_ENV) ./configure \
+		--prefix=/usr \
+		$(HOST_CONFIGURE_OPTS) \
+	)
+endef
+
 define ED_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
+define HOST_ED_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
 define ED_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
+define HOST_ED_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(HOST_DIR)" install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.10.2
