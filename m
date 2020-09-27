From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Sep 2020 14:58:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/frr: link with latomic if needed
Message-ID: <20200927125833.1892345-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c98/c989f58eabd8f012798ade75e5b0f2a93b91c82d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index a77afb52e4..6beaf776ac 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -32,6 +32,10 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 
 HOST_FRR_CONF_OPTS = --enable-clippy-only
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+FRR_CONF_ENV += LIBS=-latomic
+endif
+
 define HOST_FRR_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/lib/clippy $(HOST_DIR)/bin/clippy
 endef
-- 
2.28.0
