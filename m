From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 25 May 2021 22:24:06 +0200
Subject: [Buildroot] [git commit] package/webkitgtk: disable gamepad support
Message-ID: <20210525195455.D6CCB8A4CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97b2511edb75ff885140f2ea3253d1a862c2cc58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass -DENABLE_GAMEPAD=OFF to CMake in order to disable support for the
gamepad API, which requires libmanette, a library that is not yet
available in Buildroot.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 1720ffc7d6..f1c0560498 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -18,6 +18,7 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
+	-DENABLE_GAMEPAD=OFF \
 	-DENABLE_GEOLOCATION=OFF \
 	-DENABLE_GTKDOC=OFF \
 	-DENABLE_INTROSPECTION=OFF \
