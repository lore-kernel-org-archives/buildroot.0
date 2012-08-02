From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:14 -0000
Subject: [Buildroot] [git commit branch/next] portaudio: bump to version
	v19_20111121
Message-ID: <20120802195238.811AC96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=922fdbcdda7a71447307f648e3c51f42232ddbbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/portaudio/portaudio.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index a824735..b0340f7 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-PORTAUDIO_VERSION = V19
+PORTAUDIO_VERSION = v19_20111121
 PORTAUDIO_SITE = http://www.portaudio.com/archives
-PORTAUDIO_SOURCE = pa_stable_v19_20110326.tgz
+PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
 PORTAUDIO_MAKE = $(MAKE1)
 
 PORTAUDIO_DEPENDENCIES = \
-       $(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
+	$(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
 
 PORTAUDIO_CONF_OPT = \
-       $(if $(BR2_PACKAGE_PORTAUDIO_ALSA),--with-alsa,--without-alsa) \
-       $(if $(BR2_PACKAGE_PORTAUDIO_OSS),--with-oss,--without-oss) \
-       $(if $(BR2_PACKAGE_PORTAUDIO_CXX),--enable-cxx,--disable-cxx)
+	$(if $(BR2_PACKAGE_PORTAUDIO_ALSA),--with-alsa,--without-alsa) \
+	$(if $(BR2_PACKAGE_PORTAUDIO_OSS),--with-oss,--without-oss) \
+	$(if $(BR2_PACKAGE_PORTAUDIO_CXX),--enable-cxx,--disable-cxx)
 
 $(eval $(call AUTOTARGETS))
