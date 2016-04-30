From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 14:54:41 +0200
Subject: [Buildroot] [git commit] libtommath: build with -fPIC
Message-ID: <20160430125452.5340381D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab51fb01f0a6205fb5a86557685561931f68a6e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the build on x86_64, see:

  http://autobuild.buildroot.net/results/212/212469db5dc8399070390603c0fdf7f12b130cda/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtommath/libtommath.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 463ea7b..eb3b00e 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -13,7 +13,7 @@ LIBTOMMATH_INSTALL_STAGING = YES
 LIBTOMMATH_INSTALL_TARGET = NO  # only static library
 
 define LIBTOMMATH_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ $(TARGET_CFLAGS)"
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ -fPIC $(TARGET_CFLAGS)"
 endef
 
 define LIBTOMMATH_INSTALL_STAGING_CMDS
