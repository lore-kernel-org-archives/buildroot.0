From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue,  6 Feb 2018 15:39:52 +0100
Subject: [Buildroot] [PATCH 4/4] openjdk size optimization: compress JAR
 files
In-Reply-To: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180206143952.12332-5-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will have some impact on startup time, to be investigated if this is
acceptable.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/openjdk/openjdk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 1dac44ede5..7bd75d76eb 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -66,6 +66,7 @@ endif
 OPENJDK_MAKE_OPTS += BUILD_HEADLESS_ONLY=1 BUILD_HEADLESS=true \
 		     BUILD_SOUNDLESS_ONLY=1 X11_NOT_NEEDED=1 \
 		     CUPS_NOT_NEEDED=1 ALSA_NOT_NEEDED=1 PULSE_NOT_NEEDED=1 \
+		     COMPRESS_JARS=true
 
 OPENJDK_MAKE_ENV += X11_NOT_NEEDED=yes CUPS_NOT_NEEDED=yes ALSA_NOT_NEEDED=yes \
 		    PULSE_NOT_NEEDED=yes \
-- 
2.13.6
