From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jan 2017 14:57:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/weston: do not try to build dev docs
In-Reply-To: <cover.1485093464.git.yann.morin.1998@free.fr>
References: <cover.1485093464.git.yann.morin.1998@free.fr>
Message-ID: <24de480e72ed68aa96f39be0186f9603bed9ca0f.1485093464.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The developper's documentation will be automatically built when doxygen
is present. But we can't guarantee that it is.

Besides, we are not interested in the devlopper's documentation.

Simply disable it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 3a02df0..9bd127c 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -20,6 +20,7 @@ WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
 	--disable-headless-compositor \
 	--disable-colord \
+	--disable-devdocs \
 	--disable-setuid-install
 
 WESTON_MAKE_OPTS = \
-- 
2.7.4
