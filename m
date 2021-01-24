From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Sun, 24 Jan 2021 11:57:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xcb-proto: use host-python3
 instead of host-python(2)
In-Reply-To: <20210124105736.33533-1-titouanchristophe@gmail.com>
References: <20210124105736.33533-1-titouanchristophe@gmail.com>
Message-ID: <20210124105736.33533-2-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/x11r7/xcb-proto/xcb-proto.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 8bfe24f848..15da4be915 100644
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
+HOST_XCB_PROTO_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
+XCB_PROTO_CONF_OPTS += ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.3
