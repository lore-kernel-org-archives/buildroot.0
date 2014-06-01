From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:48 +0200
Subject: [Buildroot] [PATCH 24/26] pacakge/freerdp: disable building the
	manpages
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <e853f036a9e1b313d0c619568d74a7023e3a5a57.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Building the manpages requires xsltproc, which might not be available.
Also, who needs the manpages on the target anyway? ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 95430bb..aef9350 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -14,6 +14,8 @@ FREEDRP_LICENSE_FILES = LICENSE
 
 FREERDP_INSTALL_STAGING = YES
 
+FREERDP_CONF_OPT = -DWITH_MANPAGES=OFF
+
 ifeq ($(BR2_PACKAGE_FREERDP_NEEDS_XLIBS),y)
 FREERDP_DEPENDENCIES += xlib_libX11 xlib_libXt xlib_libXext xlib_libXcursor
 FREERDP_CONF_OPT += -DWITH_X11=ON
-- 
1.8.3.2
