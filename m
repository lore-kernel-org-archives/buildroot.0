From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:43 +0100
Subject: [Buildroot] [PATCH 05/38] libxcb: fix build with Buildroot compiled
	xsltproc
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e5d1244a747a3863b9f53c80c3ad3f0d60fbe8cd.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that libxcb depends on host-xsltproc, since xsltproc is
required for the compilation of libxcb.

Moreover, remove the XSLTPROC=/usr/bin/xsltproc variable definition,
which was assuming that XSLTPROC was installed on the host. xsltproc
should just be part of the PATH.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/libxcb/libxcb.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index b79addd..19cfc6a 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -10,9 +10,9 @@ LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_AUTORECONF = NO
-LIBXCB_DEPENDENCIES = pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
+LIBXCB_DEPENDENCIES = host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XSLTPROC=/usr/bin/xsltproc
+LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb
 
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb))
 
-- 
1.6.3.3
