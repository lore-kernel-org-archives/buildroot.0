From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:29:30 +0100
Subject: [Buildroot] [git commit] vlc: add support for libdvbpsi
Message-ID: <20151230222934.08C2482748@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c7239e36f2dc76fa8d3c79a3135f648110b7579
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ca1f09c..ee21c16 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -179,6 +179,13 @@ else
 VLC_CONF_OPTS += --disable-libass
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVBPSI),y)
+VLC_CONF_OPTS += --enable-dvbpsi
+VLC_DEPENDENCIES += libdvbpsi
+else
+VLC_CONF_OPTS += --disable-dvbpsi
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 VLC_CONF_OPTS += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
