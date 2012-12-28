From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 23:35:37 +0100
Subject: [Buildroot] [git commit] libplayer: propagate 'depends on' from
	mplayer
Message-ID: <20121228223735.000CA9A4E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6904b0ea954c22f3efb9619dc4a7b793fe985547
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_LIBPLAYER_MPLAYER should not select BR2_PACKAGE_MPLAYER
without having the 'depends on' that BR2_PACKAGE_MPLAYER has.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libplayer/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index fe851ac..5391b8b 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -11,6 +11,10 @@ config BR2_PACKAGE_LIBPLAYER
 if BR2_PACKAGE_LIBPLAYER
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
+	# mplayer
+	depends on !BR2_sh4a && !BR2_sh4aeb && !BR2_microblaze && !BR2_aarch64
+	# mplayer
+	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
