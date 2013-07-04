From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jul 2013 13:18:32 -0300
Subject: [Buildroot] [PATCH] classpath: fix alsa-related build failure
Message-ID: <1372954712-30134-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Classpath requires sequencer support besides pcm support. Fixes:
http://autobuild.buildroot.org/results/2bd/2bd39ffa821bc02d64998bc9e8fe178d3741a1d8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/classpath/classpath.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.8.1.5
