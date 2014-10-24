From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:20:54 +0200
Subject: [Buildroot] [git commit] freerdp: alsa support needs mixer as well
Message-ID: <20141024232206.E74F5B0BC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=818fea6e6c9082f50e060f04474a52ddebc7ef48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5ed/5edaa6654b90299ead5255d1cbdf79eb8b40fc6f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 84c2d81..cb745ec 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -26,7 +26,7 @@ else
 FREERDP_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER),y)
 FREERDP_CONF_OPTS += -DWITH_ALSA=ON
 FREERDP_DEPENDENCIES += alsa-lib
 else
