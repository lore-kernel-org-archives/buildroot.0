From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:39 +0100
Subject: [Buildroot] [PATCH 2/8] package/checkpolicy: rename variable
In-Reply-To: <cover.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <cd9656c5aa72066e68f41700b9f4e27db013386d.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use package names as poor-man's namespace, so fix that.

Reported by utils/check-package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/checkpolicy/checkpolicy.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index c1fb43da4d..536a7d69ca 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -11,22 +11,22 @@ CHECKPOLICY_LICENSE_FILES = COPYING
 
 CHECKPOLICY_DEPENDENCIES = libselinux flex host-flex host-bison
 
-TARGET_CHECKPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
+CHECKPOLICY_TARGET_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
 	LEX="$(HOST_DIR)/bin/flex" \
 	YACC="$(HOST_DIR)/bin/bison -y"
 
 # DESTDIR is used at build time to find libselinux
 define CHECKPOLICY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_TARGET_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
 endef
 
 define CHECKPOLICY_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_TARGET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 
 endef
 
 define CHECKPOLICY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_TARGET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
-- 
2.11.0
