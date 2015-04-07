From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:52:16 +0200
Subject: [Buildroot] [git commit] package/mplayer: add optional samba support
Message-ID: <20150407212927.8FB2F818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25aee69c9a2ba67cc58a30fb51c8493c881d5f1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 06cddf6..d87ff20 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -54,6 +54,13 @@ else
 MPLAYER_CONF_OPTS += --disable-termcap
 endif
 
+ifeq ($(BR2_PACKAGE_SAMBA_SMBCLIENT),y)
+MPLAYER_CONF_OPTS += --enable-smb
+MPLAYER_DEPENDENCIES += samba
+else
+MPLAYER_CONF_OPTS += --disable-smb
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 MPLAYER_CONF_OPTS +=  \
 	--enable-dvdread \
