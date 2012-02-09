From: Trevor Woerner <twoerner@gmail.com>
Date: Thu,  9 Feb 2012 17:25:14 -0500
Subject: [Buildroot] [PATCH v3 directfb] directfb: font handling requires
	libbz2
In-Reply-To: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
References: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
Message-ID: <1328826314-30424-2-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Trevor Woerner <twoerner@gmail.com>

One of the libraries which is built by directfb, libidirectfbfont_ft2.so,
requires libbz2:

$ pwd
/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont
$ /lib/ld-2.9.so --list ./libidirectfbfont_ft2.so
        libdirect-1.4.so.6 => /usr/lib/libdirect-1.4.so.6 (0x40155000)
        libdirectfb-1.4.so.6 => /usr/lib/libdirectfb-1.4.so.6 (0x40171000)
        libfusion-1.4.so.6 => /usr/lib/libfusion-1.4.so.6 (0x40133000)
        libz.so.1 => /usr/lib/libz.so.1 (0x4008b000)
        libfreetype.so.6 => /usr/lib/libfreetype.so.6 (0x40214000)
        libm.so.6 => /lib/libm.so.6 (0x40286000)
        libdl.so.2 => /lib/libdl.so.2 (0x40036000)
        libpthread.so.0 => /lib/libpthread.so.0 (0x400a6000)
        libc.so.6 => /lib/libc.so.6 (0x402f9000)
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x400fa000)
        libbz2.so.1 => /usr/lib/libbz2.so.1 (0x400c6000)
        /lib/ld-2.9.so (0x40065000)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 977d272..8fd8d5e 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -23,7 +23,7 @@ DIRECTFB_CONF_OPT = \
 	--disable-video4linux2 \
 	--without-tools
 
-DIRECTFB_DEPENDENCIES = freetype zlib
+DIRECTFB_DEPENDENCIES = freetype zlib bzip2
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
 DIRECTFB_CONF_OPT += --enable-multi --enable-fusion
-- 
1.7.9.GIT
