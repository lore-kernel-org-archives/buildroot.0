From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Jun 2009 21:40:41 +0200
Subject: [Buildroot] [git commit] neon: Fix pkgconfig dependency
Message-ID: <20090611194249.794D877826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1029ec82dfe45ff8f2bf61cfeb0a626c92542e86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


neon should depend on host-pkgconfig rather than pkgconfig.

Closes #385.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/neon.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 61cf752..2e1da07 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -9,7 +9,7 @@ NEON_INSTALL_STAGING:=YES
 NEON_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
 NEON_CONF_OPT:=--enable-shared --without-gssapi --disable-rpath
 
-NEON_DEPENDENCIES:=pkgconfig
+NEON_DEPENDENCIES:=host-pkgconfig
 
 ifeq ($(BR2_PACKAGE_NEON_LIBXML2),y)
 NEON_CONF_OPT+=--with-libxml2=yes
-- 
1.6.0.6
