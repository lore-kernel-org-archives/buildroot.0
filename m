From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:40:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/spice: depend on libglib2
Message-ID: <1456076407-20364-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package selects BR2_PACKAGE_LIBGLIB2 but did not depend on it.

The buildsystem treats libglib2 as a hard-dependency:
https://cgit.freedesktop.org/spice/spice/tree/configure.ac?h=0.12#n117

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/spice/spice.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index a31d78d..61a9772 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -14,6 +14,7 @@ SPICE_DEPENDENCIES =        \
 	alsa-lib            \
 	celt051             \
 	jpeg                \
+	libglib2            \
 	openssl             \
 	pixman              \
 	python-pyparsing    \
-- 
2.7.0
