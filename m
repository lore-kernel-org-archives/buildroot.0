From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 22:56:14 +0200
Subject: [Buildroot] [git commit] package/vlc: Add libsidplay2 as optional
	dependency
Message-ID: <20150628205632.69EC780DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b59567b38ece8de4c23fb04f55ab7c6d086b1fc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vlc has a sid plugin:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a
  output/target/usr/lib/vlc/plugins/demux/libsid_plugin.so |
  grep NEEDED | grep sid
 0x00000001 (NEEDED)     Shared library: [libsidplay2.so.1]
 0x00000001 (NEEDED)     Shared library: [libresid-builder.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index bc2966e..4ef69aa 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -206,6 +206,13 @@ else
 VLC_CONF_OPTS += --disable-svg --disable-svgdec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSIDPLAY2),y)
+VLC_CONF_OPTS += --enable-sid
+VLC_DEPENDENCIES += libsidplay2
+else
+VLC_CONF_OPTS += --disable-sid
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
 VLC_CONF_OPTS += --enable-theora
 VLC_DEPENDENCIES += libtheora
