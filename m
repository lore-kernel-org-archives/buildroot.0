From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:53:58 +0200
Subject: [Buildroot] [git commit] package/frr: link with latomic if needed
Message-ID: <20200930204349.731478E104@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecdde4c2752e73c2298ed8bc6f79909d69cb9881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/c98/c989f58eabd8f012798ade75e5b0f2a93b91c82d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
