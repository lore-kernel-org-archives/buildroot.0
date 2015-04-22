From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:30 +0200
Subject: [Buildroot] [PATCH 19/30] package/matchbox: enable support for the
	Xsession manager
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <f3e0f3a40f00196638e2a5edd185d81be7bf175e.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 2d30ca0..5bd2587 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -35,6 +35,13 @@ else
 MATCHBOX_CONF_OPTS += --disable-startup-notification
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
+MATCHBOX_CONF_OPTS += --enable-session
+MATCHBOX_DEPENDENCIES += xlib_libSM
+else
+MATCHBOX_CONF_OPTS += --disable-session
+endif
+
 $(eval $(autotools-package))
 
 # After we called a package infra, w ecan include more files
-- 
1.9.1
