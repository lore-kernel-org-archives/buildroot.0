From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 15:22:07 +0100
Subject: [Buildroot] [git commit] vlc: add optional dependency to libmatroska
Message-ID: <20151231142257.E1EB28191E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=217171565fe7c1d8b3bdfe538da11ed190f46b28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmatroska is an optional dependency to vlc:
http://git.videolan.org/?p=vlc.git;a=blob;f=configure.ac;h=c46120d7f2a7d49d68d488d617e071148b8c5595;hb=HEAD#l2044

Add it to vlc.mk to get reproducable builds.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ee21c16..a080e3e 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -202,6 +202,13 @@ else
 VLC_CONF_OPTS += --disable-mad
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMATROSKA),y)
+VLC_CONF_OPTS += --enable-mkv
+VLC_DEPENDENCIES += libmatroska
+else
+VLC_CONF_OPTS += --disable-mkv
+endif
+
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
 VLC_CONF_OPTS += --enable-mod
 VLC_DEPENDENCIES += libmodplug
