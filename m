From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Nov 2017 14:27:52 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/feh: Fix build issue with some
 older cross-compilers
Message-ID: <20171115132754.9755-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

by adding -std=gnu11 to CFLAGS.

NOTE: make needs to have variables before make as it's required by config.mk.

Fixes:
http://autobuild.buildroot.net/results/94527fcd70fa85298c366537013c939534beead0/
http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/
http://autobuild.buildroot.net/results/5b65c305b50664e02d5f8022278055c80739342d/
http://autobuild.buildroot.net/results/ed3b9fb8d09cd677af4b8825566877c552926ae5/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/feh/feh.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 3f4c410440..98e580f5bf 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -12,8 +12,8 @@ FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		-C $(@D) all
+	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -std=gnu11" $(MAKE1) \
+		CC="$(TARGET_CC) $(TARGET_LDFLAGS)" -C $(@D) all
 endef
 
 define FEH_INSTALL_TARGET_CMDS
-- 
2.15.0
