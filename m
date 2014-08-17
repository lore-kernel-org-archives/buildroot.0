From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:25:54 +0200
Subject: [Buildroot] [git commit] mpd: Add missing config option for plugin
	MAD
Message-ID: <20140817192609.F183D9CE21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec68345fabfdfceb35702417de1b478d83ac528
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 2c2f74f..df94035 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -110,6 +110,13 @@ else
 MPD_CONF_OPT += --disable-vorbis --disable-vorbis-encoder
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_MAD),y)
+MPD_DEPENDENCIES += libid3tag libmad
+MPD_CONF_OPT += --enable-mad
+else
+MPD_CONF_OPT += --disable-mad
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
 MPD_DEPENDENCIES += libid3tag mpg123
 MPD_CONF_OPT += --enable-mpg123
