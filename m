From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:46 +0200
Subject: [Buildroot] [PATCH 29/32 v2] package/matchbox: xlib_libXfixes is an
	optional dependency
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <67c7e9a9c9b0c7832067f74e8914279081685044.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox can use xlib_libXfixes to completely and really hide the
cursor, so build-depend on it if enabled.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 3b6a0eb..9094b1e 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -39,4 +39,8 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
 MATCHBOX_DEPENDENCIES += xlib_libXcursor
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+MATCHBOX_DEPENDENCIES += xlib_libXfixes
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
