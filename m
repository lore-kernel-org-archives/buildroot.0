From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 13 Dec 2015 23:23:15 +0100
Subject: [Buildroot] [PATCH 2/2] openal: Add jack2 dependency
Message-ID: <566DEFD3.8020301@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/openal/openal.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 0580526..b2e02c8 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -18,6 +18,13 @@ else
 OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_JACK2),y)
+OPENAL_DEPENDENCIES += jack2
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_JACK=ON
+else
+OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_JACK=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
 OPENAL_DEPENDENCIES += portaudio
 OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_PORTAUDIO=ON
-- 
1.9.1
