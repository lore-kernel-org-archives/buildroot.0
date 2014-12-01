From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:44:04 +0100
Subject: [Buildroot] [git commit] portmap: don't install manpages
Message-ID: <20141201221140.6C1CD8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c418f1bc40e0e5af9cb1d11071b9178f0360e34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support having documentation on the target, so there's no
point in carrying code to install man pages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/portmap/portmap.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 2bffb9e..a410443 100644
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
