From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 14:29:26 +0200
Subject: [Buildroot] [git commit branch/next] package/libglib2: add
 -Dxattr=true when libselinux is selected
Message-ID: <20210520122947.718C980187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdbd6ab4d031b03fe68c656ab91d82dba9e208c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Xattrs is required for SELinux. Explicitly enable the feature when the
libselinux package is selected.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglib2/libglib2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b5554d6b56..e3263ce9ce 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -77,10 +77,10 @@ LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-LIBGLIB2_CONF_OPTS += -Dselinux=enabled
+LIBGLIB2_CONF_OPTS += -Dselinux=enabled -Dxattr=true
 LIBGLIB2_DEPENDENCIES += libselinux
 else
-LIBGLIB2_CONF_OPTS += -Dselinux=disabled
+LIBGLIB2_CONF_OPTS += -Dselinux=disabled -Dxattr=false
 endif
 
 # Purge gdb-related files
