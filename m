From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:04 +0200
Subject: [Buildroot] [PATCH 35/69] wayland: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-36-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/wayland/wayland.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index e219624687be..d4b4664ff861 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -11,6 +11,7 @@ WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
 WAYLAND_INSTALL_STAGING = YES
 WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
+HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
 
 # wayland-scanner is only needed for building, not on the target
 WAYLAND_CONF_OPTS = --disable-scanner --with-host-scanner
-- 
2.1.0
