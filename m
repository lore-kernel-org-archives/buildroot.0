From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:07:30 +0100
Subject: [Buildroot] [git commit] package/x11r7/xcb-proto: use host-python3
 instead of host-python(2)
Message-ID: <20210124154915.F36FD80467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b66b64e49c53a4ff02a075c00ece654305b25ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xcb-proto/xcb-proto.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 8bfe24f848..64190c817f 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -12,8 +12,12 @@ XCB_PROTO_LICENSE_FILES = COPYING
 
 XCB_PROTO_INSTALL_STAGING = YES
 
-XCB_PROTO_DEPENDENCIES = host-python
-HOST_XCB_PROTO_DEPENDENCIES = host-python
+XCB_PROTO_DEPENDENCIES = host-python3
+HOST_XCB_PROTO_DEPENDENCIES = host-python3
+
+# Force detection of Buildroot host-python3 over system python
+XCB_PROTO_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
+HOST_XCB_PROTO_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
