From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:17:50 +0200
Subject: [Buildroot] [git commit] libtommath: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.5F4F381F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c223dcb16525d2fa12dc7abb46bb42851b11afd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtommath/libtommath.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index eb3b00e..2fc8c39 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -13,11 +13,11 @@ LIBTOMMATH_INSTALL_STAGING = YES
 LIBTOMMATH_INSTALL_TARGET = NO  # only static library
 
 define LIBTOMMATH_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ -fPIC $(TARGET_CFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="-I./ -fPIC $(TARGET_CFLAGS)"
 endef
 
 define LIBTOMMATH_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
 endef
 
 $(eval $(generic-package))
