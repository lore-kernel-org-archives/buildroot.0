From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 22:40:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/gmpc: needs -lm
Message-ID: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gmpc forgets to link with -lm:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld: GmpcVolume.o: undefined reference to symbol 'ceil@@GLIBC_2.0'
/home/buildroot/autobuild/instance-2/output-1/host/mips64el-buildroot-linux-gnu/sysroot/soft-float/el/lib64/libm.so.6: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.org/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gmpc/gmpc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 40b77eb189..51646ac470 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -14,5 +14,6 @@ GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
 	$(TARGET_NLS_DEPENDENCIES)
+GMPC_CONF_ENV = LIBS=-lm
 
 $(eval $(autotools-package))
-- 
2.23.0
