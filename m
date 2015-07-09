From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu,  9 Jul 2015 18:21:58 +0200
Subject: [Buildroot] [PATCH 4/7 v2] pkg-cmake: add PKG_CONFIG_* variables to
	help cmake find host packages
In-Reply-To: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1436458921-4199-5-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index f17a883..a757a2b 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -111,6 +111,8 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
+	PKG_CONFIG_PATH='$$(HOST_DIR)/usr/lib/pkgconfig' \
+	PKG_CONFIG_SYSROOT_DIR='$$(HOST_DIR)' \
 	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
-- 
1.9.1
