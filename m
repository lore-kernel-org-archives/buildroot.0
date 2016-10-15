From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:39 +0200
Subject: [Buildroot] [git commit] live555: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.2B1D981F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f3fa0cfea9b97707402568936ee9d4276bfdb65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/live555/live555.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 3ccba63..f36cce3 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -41,15 +41,15 @@ define LIVE555_CONFIGURE_CMDS
 endef
 
 define LIVE555_BUILD_CMDS
-	$(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
 endef
 
 define LIVE555_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 endef
 
 define LIVE555_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
