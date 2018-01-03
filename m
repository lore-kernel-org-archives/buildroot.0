From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 22:31:30 +0100
Subject: [Buildroot] [git commit] cjson: add comment explaining how
 BUILD_SHARED_AND_STATIC_LIBS works
Message-ID: <20180103215303.C081383B16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=287775d241b90993de3d0da3af11e72b5c406084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was missing in commit aca8412ce27fdb216e80145933baa13c15118719
("cjson: build shared and static library").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cjson/cjson.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index aabf367..6dff7d6 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -15,6 +15,9 @@ CJSON_CONF_OPTS += \
 	-DENABLE_CJSON_TEST=OFF \
 	-DENABLE_CUSTOM_COMPILER_FLAGS=OFF
 
+# If BUILD_SHARED_AND_STATIC_LIBS is set to OFF, cjson uses the
+# standard BUILD_SHARED_LIBS option which is passed by the
+# cmake-package infrastructure.
 ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 CJSON_CONF_OPTS += -DBUILD_SHARED_AND_STATIC_LIBS=ON
 else
