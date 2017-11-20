From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Nov 2017 22:42:40 +0100
Subject: [Buildroot] [git commit] package/feh: Fix build issue with some
 older cross-compilers
Message-ID: <20171120213528.CEFDE8110E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17299cd0182df1b4202429a9c567765b3d2510bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

by adding -std=gnu99 to CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/392b58cca2671e206c85a530221ce7b2d42f31fb/
http://autobuild.buildroot.net/results/94527fcd70fa85298c366537013c939534beead0/
http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/
http://autobuild.buildroot.net/results/5b65c305b50664e02d5f8022278055c80739342d/
http://autobuild.buildroot.net/results/ed3b9fb8d09cd677af4b8825566877c552926ae5/

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/feh/feh.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 3f4c410..7211dc7 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -12,8 +12,8 @@ FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		-C $(@D) all
+	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -std=gnu99" $(MAKE1) \
+		CC="$(TARGET_CC) $(TARGET_LDFLAGS)" -C $(@D) all
 endef
 
 define FEH_INSTALL_TARGET_CMDS
