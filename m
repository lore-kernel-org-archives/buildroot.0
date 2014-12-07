From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:23:13 +0100
Subject: [Buildroot] [git commit] fconfig: remove redundant CFLAGS/LDFLAGS
Message-ID: <20141207202324.5C1B3800F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f8e71ee6e8b24d1854c91b993b61c19711f8a2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CFLAGS and LDFLAGS are already passed as part of
$(TARGET_CONFIGURE_OPTS).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/fconfig/fconfig.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 7f7faad..509fc2c 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -12,9 +12,7 @@ FCONFIG_LICENSE = GPLv2+
 FCONFIG_LICENSE_FILES = fconfig.c
 
 define FCONFIG_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define FCONFIG_INSTALL_TARGET_CMDS
