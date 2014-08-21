From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Aug 2014 22:45:17 +0200
Subject: [Buildroot] [PATCH v2 2/5] package/pkg-cmake.mk: set the {C, CXX,
	LD}FLAGS for host packages
In-Reply-To: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408653920-18954-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- no change
---
 package/pkg-cmake.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f5aefae..3655751 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -86,6 +86,9 @@ define $(2)_CONFIGURE_CMDS
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
+		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
+		-DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
 		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
-- 
2.1.0
