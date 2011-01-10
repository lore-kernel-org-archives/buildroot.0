From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 10 Jan 2011 09:28:44 -0500
Subject: [Buildroot] [PATCH 6/7] portmap: fix clean target to actually clean
In-Reply-To: <1294669725-5379-1-git-send-email-vapier@gentoo.org>
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
Message-ID: <1294669725-5379-6-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/portmap/portmap.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index bebafce..e996824 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -19,6 +19,10 @@ define PORTMAP_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" -C $(@D) $(PORTMAP_FLAGS)
 endef
 
+define PORTMAP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
 define PORTMAP_INSTALL_TARGET_CMDS
 	for sbin in $(PORTMAP_SBINS); do \
 		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
-- 
1.7.4.rc1
