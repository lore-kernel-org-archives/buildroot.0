From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:52 +0200
Subject: [Buildroot] [git commit] odhcploc: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.6C5EE81F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39c6d150acd251b17db5b818f1e90d04c8ad2d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odhcploc/odhcploc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/odhcploc/odhcploc.mk b/package/odhcploc/odhcploc.mk
index 3995551..bf4227a 100644
--- a/package/odhcploc/odhcploc.mk
+++ b/package/odhcploc/odhcploc.mk
@@ -10,11 +10,11 @@ ODHCPLOC_LICENSE = ISC
 ODHCPLOC_LICENSE_FILES = COPYING
 
 define ODHCPLOC_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
 endef
 
 define ODHCPLOC_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 $(eval $(generic-package))
