From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:53:37 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional libbluray
	support
Message-ID: <20150407212927.9B0E77FF84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db11bd32f2554cf2dbfc1a6f252be2b790e14c8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index d87ff20..b685a38 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -61,6 +61,13 @@ else
 MPLAYER_CONF_OPTS += --disable-smb
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
+MPLAYER_CONF_OPTS += --enable-bluray
+MPLAYER_DEPENDENCIES += libbluray
+else
+MPLAYER_CONF_OPTS += --disable-bluray
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
