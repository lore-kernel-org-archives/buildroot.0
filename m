From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:11:32 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXpm: Add
	gettext/iconv support
Message-ID: <20150404131139.79D738041C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d8bd92775b2037dcbdd8594677ebfc7d465119e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package uses gettext/iconv when needed

fli4l at fli4lbuild64:~/br5$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libXpm.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
 0x00000001 (NEEDED)                     Shared library: [libxcb.so.1]
 0x00000001 (NEEDED)                     Shared library: [libXau.so.6]
 0x00000001 (NEEDED)                     Shared library: [libXdmcp.so.6]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 766724f..997ef95 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -13,6 +13,8 @@ XLIB_LIBXPM_INSTALL_STAGING = YES
 # we patch configure.ac
 XLIB_LIBXPM_AUTORECONF = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto \
+	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	host-gettext
 
 $(eval $(autotools-package))
