From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 21:25:50 +0200
Subject: [Buildroot] [git commit] babeld: use TARGET_CONFIGURE_OPTS
Message-ID: <20160703192631.D2791807E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbf799e2afa80875be240dc8f97c7288460e13a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by a previous submission of
babeld (https://patchwork.ozlabs.org/patch/631953/), we can use
TARGET_CONFIGURE_OPTS instead of passing CFLAGS and LDFLAGS in
PLATFORM_DEFINES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/babeld/babeld.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index fa504b8..ca39c71 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -10,8 +10,7 @@ BALELD_LICENSE = MIT
 BALELD_LICENSE_FILES = LICENSE
 
 define BABELD_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" \
-		PLATFORM_DEFINES="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
 define BABELD_INSTALL_TARGET_CMDS
