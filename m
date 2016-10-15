From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:30 +0200
Subject: [Buildroot] [git commit] lmbench: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.10FFB81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=168e3eb80dc522f20892a603e593c5cd45e187b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lmbench/lmbench.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index dc758c6..b62096d 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -31,11 +31,11 @@ endef
 # script. So the variables override below don't take direct effect in
 # src/Makefile.
 define LMBENCH_BUILD_CMDS
-	$(MAKE) CFLAGS="$(LMBENCH_CFLAGS)" LDLIBS="$(LMBENCH_LDLIBS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
+	$(TARGET_MAKE_ENV) $(MAKE) CFLAGS="$(LMBENCH_CFLAGS)" LDLIBS="$(LMBENCH_LDLIBS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/usr -C $(@D)/src install
+	$(TARGET_MAKE_ENV) $(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/usr -C $(@D)/src install
 endef
 
 $(eval $(generic-package))
