From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:43:26 +0200
Subject: [Buildroot] [git commit] package/kmod: explicitly disable
 compression when not enabled
Message-ID: <20201006193503.1CD95817AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd2170e808a22a126e243197628969025855a9a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Tested-by: Kris Bahnsen <kris@embeddedarm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmod/kmod.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 0a79b2cf4d..b27447192c 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -35,11 +35,15 @@ endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
 KMOD_CONF_OPTS += --with-zlib
+else
+KMOD_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPTS += --with-xz
+else
+KMOD_CONF_OPTS += --without-xz
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
