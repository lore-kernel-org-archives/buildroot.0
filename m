From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Aug 2014 16:49:51 +0200
Subject: [Buildroot] [git commit] package/mpd: opus plugin needs libogg as
	well
Message-ID: <20140827145027.6E3BD9D547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e6b7159d76852a8f3789e751f45aa4e49d5df77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/492/4924194292a428a295ded2f7aa0b9a3f81ed1b4a/

The opus decoder plugin depends on libopus and libogg.

[Peter: reworded commit message]
Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in |    1 +
 package/mpd/mpd.mk    |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index b8a56b7..108b2b1 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -145,6 +145,7 @@ config BR2_PACKAGE_MPD_MUSEPACK
 config BR2_PACKAGE_MPD_OPUS
 	bool "opus"
 	select BR2_PACKAGE_OPUS
+	select BR2_PACKAGE_LIBOGG
 	help
 	  Enable opus input support.
 	  Select this if you want to play back OPUS encoded files.
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index df94035..f84c6d0 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -97,7 +97,7 @@ MPD_CONF_OPT += --disable-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
-MPD_DEPENDENCIES += opus
+MPD_DEPENDENCIES += opus libogg
 MPD_CONF_OPT += --enable-opus
 else
 MPD_CONF_OPT += --disable-opus
