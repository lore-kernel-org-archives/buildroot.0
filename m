From: Alex B <alexbaldwinmusic@gmail.com>
Date: Sun, 25 Feb 2018 15:40:33 +0100
Subject: [Buildroot] [PATCH 1/2] Liblo : Disable werror
Message-ID: <1519569634-9096-1-git-send-email-alexbaldwinmusic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex <alexbaldwinmusic@gmail.com>

Fixes :
http://autobuild.buildroot.net/results/61ab7e23d2ef62f055efc74a998e3c108a3cdb43

Signed-off-by: Alex <alexbaldwinmusic@gmail.com>
---
 package/liblo/liblo.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 14b0527..c7d163d 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -12,6 +12,9 @@ LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
 # IPv6 support broken, issue known upstream
-LIBLO_CONF_OPTS = --disable-ipv6
+# werror - not needed for release.
+LIBLO_CONF_OPTS += \
+	--disable-ipv6 \
+	--disable-werror
 
 $(eval $(autotools-package))
-- 
2.7.4
