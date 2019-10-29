From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Oct 2019 22:40:46 +0100
Subject: [Buildroot] [PATCH 2/2] package/gmpc: fix build with NLS
In-Reply-To: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
References: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
Message-ID: <20191029214046.14722-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/3de60bd9a9f8f2ad94a7d12e03263cdaea918251

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gmpc/gmpc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 51646ac470..ece876473b 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -14,6 +14,6 @@ GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
 	$(TARGET_NLS_DEPENDENCIES)
-GMPC_CONF_ENV = LIBS=-lm
+GMPC_CONF_ENV = LIBS="-lm $(TARGET_NLS_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.23.0
