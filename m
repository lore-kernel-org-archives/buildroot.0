From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 19 Dec 2015 15:33:34 +0100
Subject: [Buildroot] [PATCH] openal: Don't build utilities
Message-ID: <56756ABE.2010208@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fixes:
http://autobuild.buildroot.net/results/be8df2bcb1af6dc553b5d4e31a926baf9f942249/
http://autobuild.buildroot.net/results/a1fd410ef06441e69e508ec42fad35bde1513582/
http://autobuild.buildroot.net/results/1f1306b2139efc940a0b0e4829ab6b5aaafc8823/

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/openal/openal.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index b2e02c8..42871fb 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -11,6 +11,9 @@ OPENAL_LICENSE = LGPLv2+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
 
+# We don't need the utilities, Distros don't ship them either
+OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 OPENAL_DEPENDENCIES += alsa-lib
 OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=ON
-- 
1.9.1
