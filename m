From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:56:26 +0100
Subject: [Buildroot] [PATCHv2 08/74] portmap: don't install manpages
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support having documentation on the target, so there's no
point in carrying code to install man pages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portmap/portmap.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index dd60809..d5d43bf 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -24,12 +24,6 @@ define PORTMAP_INSTALL_TARGET_CMDS
 	for sbin in $(PORTMAP_SBINS); do \
 		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
 	done
-	$(INSTALL) -D $(@D)/portmap.man \
-		$(TARGET_DIR)/usr/share/man/man8/portmap.8
-	$(INSTALL) -D $(@D)/pmap_dump.8 \
-		$(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
-	$(INSTALL) -D $(@D)/pmap_set.8 \
-		$(TARGET_DIR)/usr/share/man/man8/pmap_set.8
 endef
 
 define PORTMAP_INSTALL_INIT_SYSV
-- 
2.1.0
