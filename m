From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 07:11:40 +0100
Subject: [Buildroot] [git commit master 1/1] mpc: ensure mpfr/gmp are built
	before mpc
Message-ID: <20101105061218.E57DB8DB59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=df3f8bb35a9c3b8aa3a1d3b2cc16721ce8d46abe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mpc/Config.in |    2 +-
 package/mpc/mpc.mk    |    4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/mpc/Config.in b/package/mpc/Config.in
index 6045514..61c9638 100644
--- a/package/mpc/Config.in
+++ b/package/mpc/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBMPC
 	  Mpc is a C library for the arithmetic of complex numbers with
 	  arbitrarily high precision and correct rounding of the result.
 	  It is built upon and follows the same principles as Mpfr.
-	  
+
 	  http://www.multiprecision.org/
 
 
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 561d25a..4a65842 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -1,5 +1,3 @@
-#libmpc: libgmp libmpfr $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
-
 #############################################################
 #
 # mpc
@@ -60,7 +58,7 @@ ifeq ($(BR2_PACKAGE_LIBMPC_HEADERS),y)
 	cp -dpf $(STAGING_DIR)/usr/include/mpc.h $(TARGET_DIR)/usr/include/
 endif
 
-libmpc: $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
+libmpc: libgmp libmpfr $(TARGET_DIR)/usr/lib/libmpc$(LIBTGTEXT)
 stage-libmpc: $(STAGING_DIR)/usr/lib/$(MPC_BINARY)
 
 libmpc-clean:
-- 
1.7.1
