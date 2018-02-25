From: Alex B <alexbaldwinmusic@gmail.com>
Date: Sun, 25 Feb 2018 15:42:41 +0100
Subject: [Buildroot] [PATCH 2/2] Libo : Link libatomic
In-Reply-To: <1519569761-9319-1-git-send-email-alexbaldwinmusic@gmail.com>
References: <1519569761-9319-1-git-send-email-alexbaldwinmusic@gmail.com>
Message-ID: <1519569761-9319-2-git-send-email-alexbaldwinmusic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex <alexbaldwinmusic@gmail.com>

Fixes :
http://autobuild.buildroot.net/results/c8b/c8bed3a3fa7d2b2258f573cbfcb01af07419e0bf/

Signed-off-by: Alex Baldwin <alexbaldwinmusic@gmail.com>
---
 package/liblo/liblo.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index c7d163d..67cc02c 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -17,4 +17,10 @@ LIBLO_CONF_OPTS += \
 	--disable-ipv6 \
 	--disable-werror
 
+# Liblo uses atomics, so we need to link with
+# libatomic for the architectures who explicitly need libatomic.
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+	LIBLO_CONF_ENV += LIBS="-latomic"
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
