From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 13:59:04 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/nbd: add
 host-pkgconf to dependencies
Message-ID: <20191028125352.7CB998B5BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0689e268e7749483fe012f7003b1dd2cf0a094db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

pkg-config is used to find libglib2 since version 3.17 and
https://github.com/NetworkBlockDevice/nbd/commit/ef86bbd9da2e2116ec0da6f9c130fb52e89fc310

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d630ed2dcf1fcb11c93f8ae363e4fd85c7ba8a4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nbd/nbd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 484f3e695b..fa569f3224 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -8,7 +8,7 @@ NBD_VERSION = 3.19
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-NBD_DEPENDENCIES = libglib2
+NBD_DEPENDENCIES = host-pkgconf libglib2
 NBD_LICENSE = GPL-2.0
 NBD_LICENSE_FILES = COPYING
 
