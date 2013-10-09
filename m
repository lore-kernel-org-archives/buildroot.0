From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:06:48 +0200
Subject: [Buildroot] [git commit] package/weston: fix variable name
Message-ID: <20131009210741.6DA749AF8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=516246ddf2d7c2569ee6c0ffa4cfc80ff4ecc203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The weston package uses the $(WAYLAND_VERSION) variable instead of
$(WESTON_VERSION).

This went unnoticed for now, as we were using the same version for
wayland and weston. But that's not always the case, since we have,
for example: wayland-1.2.1 and weston-1.2.2, and no wayland-1.2.2.

Fix this by using the correct variable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
