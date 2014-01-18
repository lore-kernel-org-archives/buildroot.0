From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:41 +0100
Subject: [Buildroot] [PATCH 04/10] pkg-cmake.mk: build shared library when
	!BR2_PREFER_STATIC_LIB
In-Reply-To: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390073027-14239-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 463cd63..aedd1fc 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -64,6 +64,7 @@ define $(2)_CONFIGURE_CMDS
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
-- 
1.8.5.3
