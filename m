From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 00:09:48 +0200
Subject: [Buildroot] [PATCH 02/11] package/weston: fix variable name
In-Reply-To: <cover.1381269937.git.yann.morin.1998@free.fr>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
Message-ID: <9f47cbe09f7914213180912dc88020ca752299f5.1381269937.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The weston package uses the $(WAYLAND_VERSION) variable instead of
$(WESTON_VERSION).

This went unnoticed for now, as we were using the same version for
wayland and weston. But that's not always the case, since we have,
for example: wayland-1.2.1 and weston-1.2.2, and no wayland-1.2.2.

Fix this by using the correct variable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6f7703e..5d2c829 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -6,7 +6,7 @@
 
 WESTON_VERSION = 1.1.0
 WESTON_SITE = http://wayland.freedesktop.org/releases/
-WESTON_SOURCE = weston-$(WAYLAND_VERSION).tar.xz
+WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-- 
1.8.1.2
