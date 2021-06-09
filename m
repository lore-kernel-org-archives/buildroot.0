From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jun 2021 22:53:39 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/webkitgtk:
 disable gamepad support
Message-ID: <20210609202608.AFDBA8141E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9970bbca52dbc9bb44ca041d3e6559d7c06e9595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Pass -DENABLE_GAMEPAD=OFF to CMake in order to disable support for the
gamepad API, which requires libmanette, a library that is not yet
available in Buildroot.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 97b2511edb75ff885140f2ea3253d1a862c2cc58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
