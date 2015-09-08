From: Romain Naour <romain.naour@openwide.fr>
Date: Tue,  8 Sep 2015 23:19:55 +0200
Subject: [Buildroot] [PACH v2 21/38] package/efl: add Xpresent dependency
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1441747212-27421-22-git-send-email-romain.naour@openwide.fr>
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
index 39d4cfc..c309836 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -182,6 +182,11 @@ EFL_CONF_OPTS += --with-x=no \
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
