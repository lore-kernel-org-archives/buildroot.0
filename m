From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:58:16 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/iputils: drop
 wrong linux-headers dependency
Message-ID: <20200828155322.438147FE6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e51be72dc8eaf525e3db3db2f9779c61bf6877f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Commit 9ffcd9279e5505535a73cf1200b3a86fd425cf32 wrongly added a
linux-headers dependency when switching to meson.

Remove it as headers are always provided by the toolchain.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d1d89d37c02e3d8224fb6f812e87fef5612a771a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 0d260891e2..d09bc58b34 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -40,13 +40,8 @@ IPUTILS_DEPENDENCIES += libgcrypt
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=openssl
 IPUTILS_DEPENDENCIES += openssl
-else ifeq ($(BR2_PACKAGE_LINUX_HEADERS),y)
-IPUTILS_CONF_OPTS += -DUSE_CRYPTO=kernel
-IPUTILS_DEPENDENCIES += linux-headers
 else
-IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
-# BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
-IPUTILS_NINFOD = n
+IPUTILS_CONF_OPTS += -DUSE_CRYPTO=kernel
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
