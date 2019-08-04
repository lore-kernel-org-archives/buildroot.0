From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:06:38 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/json-glib: set
 -Dintrospection=false
Message-ID: <20190804201459.AFA4C89098@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=506a426ce8ac7b76629cf604d51a4f953245ae47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

When -Dintrospection=false is not passed, the meson script
auto-detects the host g-ir-scanner, which is not usable in a
cross-compile environment.

Signed-off-by: Alex Xu <alex_y_xu@yahoo.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6afc3edd41017c615d6f32ad97447938b63cbf78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-glib/json-glib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index a312198bba..5c1fca3fd9 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -17,6 +17,8 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2
 
+JSON_GLIB_CONF_OPTS = -Dintrospection=false
+
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
