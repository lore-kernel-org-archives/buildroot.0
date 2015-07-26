From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:30 +0200
Subject: [Buildroot] [RFC 20/37] package/efl: add Xpresent dependency
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-21-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/efl.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index a8e3b84..b63ffab 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -177,6 +177,11 @@ EFL_CONF_OPTS += --with-x=no \
 	--with-x11=none
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXPRESENT),y)
+EFL_CONF_OPTS += --enable-xpresent
+EFL_DEPENDENCIES += xlib_libXpresent
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_X_XLIB_GLX_FULL),y)
 EFL_CONF_OPTS += --with-opengl=full
 EFL_DEPENDENCIES += libgl
-- 
2.4.3
