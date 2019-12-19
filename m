From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 22:21:49 +0100
Subject: [Buildroot] [git commit] package/openrc: install sysv-rcs file
Message-ID: <20191219211329.188958D2C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3945226a7e29c9f811fbe145ea792b18f3a5daa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/openrc has the file sysv-rcs which starts sysvinit services
not written for openrc. However, currently it is not installed to
the target.

Install this file to $(TARGET_DIR)/etc/init.d during the
target_install step.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
[yann.morin.1998 at free.fr: use full-path for destination, not just dir]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openrc/openrc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 387962d4d5..3f6453cef5 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -35,6 +35,8 @@ endef
 
 define OPENRC_INSTALL_TARGET_CMDS
 	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
+		$(TARGET_DIR)/etc/init.d/sysv-rcs
 endef
 
 ifeq ($(BR2_PACKAGE_NETIFRC),y)
