From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 13:37:40 +0100
Subject: [Buildroot] [git commit] xserver_xorg-server: libunwind support is
	broken on MIPS64 n32
Message-ID: <20141201123831.B807E7FFE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=789fc2dc3293a6fd7b8d2374ef71c11f1adfc820
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Amend the former commit and disable xorg-server with libunwind support
only for MIPS64 n32, as stated in the bug report:

https://bugs.freedesktop.org/show_bug.cgi?id=79939

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4e06d5f..4164ccf 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -144,9 +144,9 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += freetype
 endif
 
-# libunwind support is broken on mips64
+# libunwind support is broken on MIPS64 n32
 # https://bugs.freedesktop.org/show_bug.cgi?id=79939
-ifeq ($(BR2_PACKAGE_LIBUNWIND)-$(BR2_mips64el),y-)
+ifeq ($(BR2_PACKAGE_LIBUNWIND)-$(BR2_MIPS_NABI32),y-)
 XSERVER_XORG_SERVER_DEPENDENCIES += libunwind
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-libunwind
