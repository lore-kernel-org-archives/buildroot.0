From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:41 +0100
Subject: [Buildroot] [PATCH 09/51] portmap: improve installation of binaries
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit explicits the permissions with which executables are
installed, and also makes sure that the build is aborted is one of the
binary cannot be installed, instead of silently ignoring the error.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portmap/portmap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index d5d43bf..65ee551 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -22,7 +22,7 @@ endef
 
 define PORTMAP_INSTALL_TARGET_CMDS
 	for sbin in $(PORTMAP_SBINS); do \
-		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
+		$(INSTALL) -D -m 0755 $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin || exit 1; \
 	done
 endef
 
-- 
2.1.0
