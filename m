From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:41 +0100
Subject: [Buildroot] [PATCH 4/8] package/lockfile-progs: rename variable
In-Reply-To: <cover.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <8c0d3284088b1915e10387d4808b18b75d2343e5.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use package names as poor-man's namespace, so fix that.

Reported by utils/check-package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lockfile-progs/lockfile-progs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 57df573d4a..ed192f1028 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -11,7 +11,7 @@ LOCKFILE_PROGS_DEPENDENCIES = liblockfile
 LOCKFILE_PROGS_LICENSE = GPL-2.0
 LOCKFILE_PROGS_LICENSE_FILES = COPYING
 
-LOCKFILE_BINS = \
+LOCKFILE_PROGS_BINS = \
 	$(addprefix lockfile-,check create remove touch) \
 	$(addprefix mail-,lock touchlock unlock)
 
@@ -20,7 +20,7 @@ define LOCKFILE_PROGS_BUILD_CMDS
 endef
 
 define LOCKFILE_PROGS_INSTALL_TARGET_CMDS
-	for i in $(LOCKFILE_BINS); do \
+	for i in $(LOCKFILE_PROGS_BINS); do \
 		$(INSTALL) -D -m 755 $(@D)/bin/$$i $(TARGET_DIR)/usr/bin/$$i || exit 1; \
 	done
 endef
-- 
2.11.0
