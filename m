From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:24:53 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libxkbcommon: disable
	wayland support
Message-ID: <20170331071605.DEF11826C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c1b702a466023f8826cfb6a386e9b4683880875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7665b5870995ef059d1654c35557b53c04a71d1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxkbcommon/libxkbcommon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index c39a7c0..6011814 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -11,6 +11,7 @@ LIBXKBCOMMON_LICENSE = MIT/X11
 LIBXKBCOMMON_LICENSE_FILES = LICENSE
 LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
+LIBXKBCOMMON_CONF_OPTS = --disable-wayland
 # uses C99 features
 LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
