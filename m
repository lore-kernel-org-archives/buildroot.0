From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2014 15:15:44 +0100
Subject: [Buildroot] [git commit] mpd: fix vorbis build failure
Message-ID: <20140207142114.CFC539C721@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52ec2e54e6f397901fb11e47afa47e0d1be9a5a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forcibly disable the vorbis encoder support when the vorbis option isn't
enabled to avoid autodetection.
Said autodetection has a build bug that it won't properly set libvorbis
build options when the decoder is disabled. Fixes:
http://autobuild.buildroot.net/results/a46/a46b4c97fe126b23a96051a8bf1243a7f4935434/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4a7926c..6bdb149 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -91,7 +91,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
 else
-MPD_CONF_OPT += --disable-vorbis
+MPD_CONF_OPT += --disable-vorbis --disable-vorbis-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
