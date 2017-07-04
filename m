From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:09:44 +0200
Subject: [Buildroot] [git commit] lvm2: force disable NLS support
Message-ID: <20170704170700.A80AE8015E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cb296d09c3f152926dae2d2095f58c0b4437061
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are going to pass --enable-nls to all autotools packages when NLS
support is enabled globally. However, lvm2 NLS support doesn't build,
and anyway lvm2 doesn't provide any useful translation files, so we
force disable NLS support for this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9a422fe..f5cd0b5 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -12,12 +12,14 @@ LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
 
 # Make sure that binaries and libraries are installed with write
-# permissions for the owner.
+# permissions for the owner. We disable NLS because it's broken, and
+# the package anyway doesn't provide any translation files.
 LVM2_CONF_OPTS += \
 	--enable-write_install \
 	--enable-pkgconfig \
 	--enable-cmdlib \
-	--enable-dmeventd
+	--enable-dmeventd \
+	--disable-nls
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
