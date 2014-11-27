From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:57:05 +0100
Subject: [Buildroot] [PATCHv2 47/74] lockfile-progs: add error handling to
	for loop
In-Reply-To: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417125452-18705-48-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lockfile-progs/lockfile-progs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
2.1.0
