From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:48 +0200
Subject: [Buildroot] [PATCH 17/21] package/weston: add support for libinput
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <04c179087a1d27273a58bb533ce9f3f136572540.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index ea63203..325cfc7 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -32,6 +32,13 @@ else
 WESTON_CONF_OPT += --disable-xkbcommon
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+WESTON_DEPENDENCIES += libinput
+WESTON_CONF_OPT += --enable-libinput-backend
+else
+WESTON_CONF_OPT += --disable-libinput-backend
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
-- 
1.8.3.2
