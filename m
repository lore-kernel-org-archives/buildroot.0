From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 16:34:13 +0100
Subject: [Buildroot] [git commit] package/wayland: drop non-existing
	configure option
Message-ID: <20170305153505.E83618012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed207dbc1c8d8e4dfef0deaabfb3c875378ffda4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-scanner was removed back in 2015, so drop it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
