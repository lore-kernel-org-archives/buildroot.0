From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 23:01:37 +0200
Subject: [Buildroot] [git commit] package/mplayer: disable optional libcdio
	support
Message-ID: <20150408212257.EE2B480406@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=780879e950ee8bc775a7d22bdbd33e57ac36565f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 2ddc0fc..be9c656 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -99,6 +99,11 @@ else
 MPLAYER_CONF_OPTS += --disable-bluray
 endif
 
+# cdio support is broken in buildroot atm due to missing libcdio-paranoia
+# package and this patch
+# https://github.com/pld-linux/mplayer/blob/master/mplayer-libcdio.patch
+MPLAYER_CONF_OPTS += --disable-libcdio
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
