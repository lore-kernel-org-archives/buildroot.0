From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 23:28:44 +0100
Subject: [Buildroot] [RFC 3/3] package/efl/libevas: explicitly disable xlib
	support
In-Reply-To: <1423952924-6322-1-git-send-email-romain.naour@openwide.fr>
References: <1423952924-6322-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1423952924-6322-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d69/d69a324434f370b490a53e6191d38a204ac28371

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libevas/libevas.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 4868050..f327c02 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -72,6 +72,8 @@ LIBEVAS_CONF_OPTS += --enable-gl-xlib
 LIBEVAS_DEPENDENCIES += \
 	xproto_glproto xlib_libX11 xlib_libXrender \
 	xlib_libXext libeet
+else
+LIBEVAS_CONF_OPTS += --disable-gl-xlib
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
-- 
1.9.3
