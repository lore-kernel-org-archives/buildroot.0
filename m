From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Jul 2013 00:15:55 +0200
Subject: [Buildroot] [git commit] classpath: fix alsa-related build failure
Message-ID: <20130707221908.37E229A3FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf62ec1c4e6fc098dcd9b963a94a2a41c381f145
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Classpath requires sequencer support besides pcm support. Fixes:
http://autobuild.buildroot.org/results/2bd/2bd39ffa821bc02d64998bc9e8fe178d3741a1d8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/classpath/classpath.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index c305178..fbf80f0 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -22,7 +22,9 @@ CLASSPATH_AUTORECONF = YES
 CLASSPATH_LICENSE = GPLv2+ with exception
 CLASSPATH_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+# Needs ALSA pcm and sequencer (midi) support
+# pcm is always on for alsa-lib
+ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
 CLASSPATH_CONF_OPT += --enable-alsa
 CLASSPATH_DEPENDENCIES += alsa-lib
 else
