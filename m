From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:11:54 +0200
Subject: [Buildroot] [git commit] libtommath: set PREFIX when installing
Message-ID: <20170905190456.C7E4F80794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe6afbfa03b21a45fba549ab1d8bb387a17ae21b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default value is /usr/local and causes breakage in libtomcrypt & moarvm

Fixes:

  http://autobuild.buildroot.net/results/a760063f05ae23f79920bc89ffc37e7dcf77aeab/
  http://autobuild.buildroot.net/results/78c9bc9a21cfce48615b70d80b25dd4847bd803b/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtommath/libtommath.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 8e0b10c..ceb2e68 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -17,7 +17,7 @@ define LIBTOMMATH_BUILD_CMDS
 endef
 
 define LIBTOMMATH_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
 endef
 
 $(eval $(generic-package))
