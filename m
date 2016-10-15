From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:18:02 +0200
Subject: [Buildroot] [git commit] duma: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121836.83AE781F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23a9d0384a7e1fe495c5f24031a3fbef8745f030
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/duma/duma.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 5e862ab..a8348b9 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -18,18 +18,18 @@ DUMA_OPTIONS = \
 # The dependency of some source files in duma_config.h, which is generated at
 # build time, is not specified in the Makefile. Force non-parallel build.
 define DUMA_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
 		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)"   \
 		$(DUMA_CPP) -C $(@D)
 endef
 
 define DUMA_INSTALL_STAGING_CMDS
-	$(MAKE) OS=linux prefix=$(STAGING_DIR)/usr install -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) OS=linux prefix=$(STAGING_DIR)/usr install -C $(@D)
 endef
 
 define DUMA_INSTALL_TARGET_CMDS
-	$(MAKE) OS=linux prefix=$(TARGET_DIR)/usr install -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) OS=linux prefix=$(TARGET_DIR)/usr install -C $(@D)
 endef
 
 $(eval $(generic-package))
