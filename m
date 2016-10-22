From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] xtables-addons: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
Message-ID: <20161022132038.8A8217F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc5e9fe4bb0322f7e26fa369cd23923f32c1eeb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xtables-addons/xtables-addons.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 7fc7312..54d1517 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -23,11 +23,11 @@ endef
 XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_DISABLE_GEOIP_HELPERS
 
 define XTABLES_ADDONS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
 endef
 
 define XTABLES_ADDONS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(autotools-package))
