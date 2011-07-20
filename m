From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jul 2011 23:51:17 +0200
Subject: [Buildroot] [git commit] zlib: always build host version dynamically
Message-ID: <20110720215406.E0C108B386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7dae68a0fa24dd733bf70d6dee9b20c70e1041fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host libraries should always be built using dynamic linking, rather than
static if BR2_PREFER_STATIC_LIB is enabled, as that then breaks dependent
libraries expecting a shared library.

Reported-by: Andy Kennedy <andy.kennedy@adtran.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index dcd2548..18e7068 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -31,9 +31,7 @@ define HOST_ZLIB_CONFIGURE_CMDS
 	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_ARGS) \
 		$(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(ZLIB_PIC)" \
 		./configure \
-		$(ZLIB_SHARED) \
 		--prefix="$(HOST_DIR)/usr" \
 		--sysconfdir="$(HOST_DIR)/etc" \
 	)
-- 
1.7.3.4
