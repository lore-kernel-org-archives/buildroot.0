From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Mar 2017 20:54:54 +0100
Subject: [Buildroot] [PATCH v2 1/2] libxkbcommon: disable wayland support
Message-ID: <20170310195455.16117-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable wayland support (only needed for the interactive-wayland
test program). This fixes a compile failure in case wayland
support is autodetected:

    GEN      xdg-shell-unstable-v5-protocol.c
  /bin/sh: /usr/bin/wayland-scanner: No such file or directory
  Makefile:2426: recipe for target 'xdg-shell-unstable-v5-protocol.c' failed
  make[3]: *** [xdg-shell-unstable-v5-protocol.c] Error 127
  make[3]: *** Waiting for unfinished jobs....
    GEN      xdg-shell-unstable-v5-client-protocol.h
  /bin/sh: /usr/bin/wayland-scanner: No such file or directory
  Makefile:2428: recipe for target 'xdg-shell-unstable-v5-client-protocol.h' failed
  make[3]: *** [xdg-shell-unstable-v5-client-protocol.h] Error 127

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2:
  - split out the disable-wayland fix
---
 package/libxkbcommon/libxkbcommon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index c39a7c0c5..601181446 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -11,6 +11,7 @@ LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
+LIBXKBCOMMON_CONF_OPTS = --disable-wayland
 # uses C99 features
 LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
-- 
2.11.0
