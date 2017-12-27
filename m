From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:45:44 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/checkpolicy:
 rename variable
Message-ID: <20171227095308.C6B8D8348F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=241f5078efbca85360820bc7e86d8e2cb1a148c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

We use package names as poor-man's namespace, so fix that.

Reported by utils/check-package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: use CHECKPOLICY_MAKE_OPTS instead of
CHECKPOLICY_TARGET_MAKE_OPTS, as it is more consistent with
HOST_CHECKPOLICY_MAKE_OPTS being used for the host variant.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(cherry picked from commit d9f771b9020bda091804fdc3ff75a2d5b18a0e6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/checkpolicy/checkpolicy.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index c1fb43d..52f8160 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -11,22 +11,22 @@ CHECKPOLICY_LICENSE_FILES = COPYING
 
 CHECKPOLICY_DEPENDENCIES = libselinux flex host-flex host-bison
 
-TARGET_CHECKPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
+CHECKPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
 	LEX="$(HOST_DIR)/bin/flex" \
 	YACC="$(HOST_DIR)/bin/bison -y"
 
 # DESTDIR is used at build time to find libselinux
 define CHECKPOLICY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
 endef
 
 define CHECKPOLICY_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 
 endef
 
 define CHECKPOLICY_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(CHECKPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
 HOST_CHECKPOLICY_DEPENDENCIES = host-libselinux host-flex host-bison
