From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jun 2012 16:40:04 +0200
Subject: [Buildroot] [git commit] eeprog: use provided linker flags as well
Message-ID: <20120629144806.51CD08EE23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df2b9516eaa6fc59b8bd847fa0af7ada99e59ad6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/eeprog/eeprog.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index 40b059e..7520744 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -8,7 +8,7 @@ EEPROG_VERSION = 0.7.6
 EEPROG_SITE = http://codesink.org/download
 
 define EEPROG_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define EEPROG_INSTALL_TARGET_CMDS
