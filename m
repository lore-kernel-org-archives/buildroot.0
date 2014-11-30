From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 21:39:54 +0100
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
	libunwind support is broken on mips64
Message-ID: <20141130221326.234227FFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93d0c5e0aa4a0bda5957a35acc407fdb778a25aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/e8f/e8f68163802f31359cee15fa3ca52547e06d1f27/
http://autobuild.buildroot.net/results/994/9947222da8682a358f81f8ac924c12596fd09ee8/
http://autobuild.buildroot.net/results/df9/df92d9b682976b77d9e1e4c39afca52b7512d847/

[Peter: use official bugtracker URL, fix check]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f118ef2..f8037b4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -144,7 +144,9 @@ ifeq ($(BR2_PACKAGE_FREETYPE),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += freetype
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+# libunwind support is broken on mips64
+# https://bugs.freedesktop.org/show_bug.cgi?id=79939
+ifeq ($(BR2_PACKAGE_LIBUNWIND)-$(BR2_mips64el),y-)
 XSERVER_XORG_SERVER_DEPENDENCIES += libunwind
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-libunwind
