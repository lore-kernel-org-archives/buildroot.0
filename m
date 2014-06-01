From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:43:44 +0200
Subject: [Buildroot] [PATCH 13/21] package/wayland: bump version
In-Reply-To: <cover.1401658972.git.yann.morin.1998@free.fr>
References: <cover.1401658972.git.yann.morin.1998@free.fr>
Message-ID: <f02ec2fef80258e901ba1337cb6c347539ec0445.1401658972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump to the recently-released 1.5.0.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/wayland/wayland.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 3ab94ca..cfa770d 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.4.0
+WAYLAND_VERSION = 1.5.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases/
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
@@ -19,7 +19,7 @@ WAYLAND_CONF_OPT = --disable-scanner
 # We must provide a specialy-crafted wayland-scanner .pc file
 # which we vampirise and adapt from the host-wayland copy
 define WAYLAND_SCANNER_PC
-	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/share/pkgconfig/wayland-scanner.pc \
+	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/lib/pkgconfig/wayland-scanner.pc \
 	              $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
 	$(SED) 's:^prefix=.*:prefix=/usr:' \
 	    -e 's:^wayland_scanner=.*:wayland_scanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
-- 
1.8.3.2
