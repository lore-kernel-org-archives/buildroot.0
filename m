From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 16:26:20 +0200
Subject: [Buildroot] [git commit] package/libpciaccess: Add optional support
	for zlib
Message-ID: <20141019142636.BA7D6AF5BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b337c11ad175e6956e9a804a965ec2fa42d5a0dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpciaccess/libpciaccess.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 010707e..f27925d 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -11,4 +11,11 @@ LIBPCIACCESS_LICENSE = MIT
 LIBPCIACCESS_LICENSE_FILES = COPYING
 LIBPCIACCESS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBPCIACCESS_CONF_OPTS += --with-zlib
+LIBPCIACCESS_DEPENDENCIES += zlib
+else
+LIBPCIACCESS_CONF_OPTS += --without-zlib
+endif
+
 $(eval $(autotools-package))
