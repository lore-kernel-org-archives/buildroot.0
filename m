From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Mar 2014 21:06:40 +0100
Subject: [Buildroot] [git commit] pulseaudio: bump version
Message-ID: <20140316205026.19F719BF67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71f51da0c955cbc981e1fadbcf13ea69e1981ca2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 6a9e369..98e49bd 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 4.0
+PULSEAUDIO_VERSION = 5.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 PULSEAUDIO_INSTALL_STAGING = YES
@@ -41,6 +41,13 @@ else
 PULSEAUDIO_CONF_OPT += --disable-orc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+PULSEAUDIO_DEPENDENCIES += libcap
+PULSEAUDIO_CONF_OPT += --with-caps
+else
+PULSEAUDIO_CONF_OPT += --without-caps
+endif
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # The optional webrtc echo canceller is written in C++, causing auto* to want
 # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
