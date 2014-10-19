From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:51:18 +0200
Subject: [Buildroot] [git commit] package/findutils: Fix compile error
Message-ID: <20141019205145.257E2AFE04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2691bb681a473b7f88f4bada4a1cd6d2c0be4f1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Error occured with an allyespackageconfig setup:

/home/fli4l/br5/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -std=gnu99  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os -g2   -o find ftsfind.o ./libfindtools.a ../lib/libfind.a ../gnulib/lib/libgnulib.a -lintl  -lm -lm
../gnulib/lib/libgnulib.a(getdate.o): In function `get_date':
getdate.c:(.text+0x15cd): undefined reference to `rpl_mktime'
getdate.c:(.text+0x168e): undefined reference to `rpl_mktime'
getdate.c:(.text+0x1707): undefined reference to `rpl_mktime'
getdate.c:(.text+0x1812): undefined reference to `rpl_mktime'
collect2: error: ld returned 1 exit status
make[3]: *** [find] Error 1
make[3]: Leaving directory `/home/fli4l/br5/output/build/findutils-4.4.2/find'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/findutils/findutils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index d9b6050..3caedf8 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -9,6 +9,7 @@ FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPLv3+
 FINDUTILS_LICENSE_FILES = COPYING
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
+			ac_cv_func_working_mktime=yes \
 			gl_cv_func_wcwidth_works=yes
 
 $(eval $(autotools-package))
