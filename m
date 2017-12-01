From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:56:26 +0100
Subject: [Buildroot] [git commit] package/lockfile-progs: rename variable
Message-ID: <20171201214934.DF94882660@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0565928fb95f19f96b00d7218c3ffa2ff93e0ca9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use package names as poor-man's namespace, so fix that.

Reported by utils/check-package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lockfile-progs/lockfile-progs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 57df573..ed192f1 100644
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
