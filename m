From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:32:50 +0100
Subject: [Buildroot] [git commit] lockfile-progs: add error handling to for
	loop
Message-ID: <20141201223450.E107F80048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef1c109e6fbc998d347e87247cff010c27a45de1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lockfile-progs/lockfile-progs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index e2e0a44..deb9f90 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -21,7 +21,7 @@ endef
 
 define LOCKFILE_PROGS_INSTALL_TARGET_CMDS
 	for i in $(LOCKFILE_BINS); do \
-		$(INSTALL) -D -m 755 $(@D)/bin/$$i $(TARGET_DIR)/usr/bin/$$i; \
+		$(INSTALL) -D -m 755 $(@D)/bin/$$i $(TARGET_DIR)/usr/bin/$$i || exit 1; \
 	done
 endef
 
