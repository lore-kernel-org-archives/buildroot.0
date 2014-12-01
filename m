From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:44:35 +0100
Subject: [Buildroot] [git commit] portmap: improve installation of binaries
Message-ID: <20141201221140.757C18002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f763f74422024780d23c0f0ffb2aa71b9b4a2e25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit explicits the permissions with which executables are
installed, and also makes sure that the build is aborted if one of the
binaries cannot be installed, instead of silently ignoring the error.

[Peter: fixop typos in commit message as noted by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/portmap/portmap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index a410443..5caf54c 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -22,7 +22,7 @@ endef
 
 define PORTMAP_INSTALL_TARGET_CMDS
 	for sbin in $(PORTMAP_SBINS); do \
-		$(INSTALL) -D $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin; \
+		$(INSTALL) -D -m 0755 $(@D)/$$sbin $(TARGET_DIR)/sbin/$$sbin || exit 1; \
 	done
 endef
 
