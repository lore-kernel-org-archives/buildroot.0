From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 19:05:09 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/openrc: install
 sysv-rcs file
Message-ID: <20191225175643.3271D8E397@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a656f6723b1ff43cbed0ddfa5441d51ab8200156
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

package/openrc has the file sysv-rcs which starts sysvinit services
not written for openrc. However, currently it is not installed to
the target.

Install this file to $(TARGET_DIR)/etc/init.d during the
target_install step.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
[yann.morin.1998 at free.fr: use full-path for destination, not just dir]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3945226a7e29c9f811fbe145ea792b18f3a5daa2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
