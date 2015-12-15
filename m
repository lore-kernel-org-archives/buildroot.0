From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 13:38:15 +0100
Subject: [Buildroot] [git commit] mplayer: use autodetection for dvdnav
Message-ID: <20151215123828.0E2BC81D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25f1a0d16ac62f223de8ce8e727202300df2e818
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/mplayer.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index ad2d9dd..3051afa 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -125,9 +125,10 @@ MPLAYER_CONF_OPTS +=  \
 MPLAYER_DEPENDENCIES += libdvdread
 endif
 
+# We intentionally don't pass --enable-dvdnav to let the autodetection
+# find which library to link with.
 ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
 MPLAYER_CONF_OPTS +=  \
-	--enable-dvdnav \
 	--with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
 MPLAYER_DEPENDENCIES += libdvdnav
 endif
