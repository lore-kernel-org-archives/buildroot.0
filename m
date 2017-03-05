From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Mar 2017 11:56:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/wayland: drop non-existing
	configure option
In-Reply-To: <cover.1488711390.git.yann.morin.1998@free.fr>
References: <cover.1488711390.git.yann.morin.1998@free.fr>
Message-ID: <2450068b8a4272d6f47d3fec39d0893910e4c955.1488711390.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-scanner was removed back in 2015, so drop it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland/wayland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 286871e..11fbce3 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -14,7 +14,7 @@ WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
 HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
 
 # wayland-scanner is only needed for building, not on the target
-WAYLAND_CONF_OPTS = --disable-scanner --with-host-scanner
+WAYLAND_CONF_OPTS = --with-host-scanner
 
 # Remove the DTD from the target, it's not needed at runtime
 define WAYLAND_TARGET_CLEANUP
-- 
2.7.4
