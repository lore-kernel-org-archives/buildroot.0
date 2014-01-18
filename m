From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:41:41 +0100
Subject: [Buildroot] [PATCH v2 5/6] pkg-cmake.mk: add PATH in the configure
	command environment
In-Reply-To: <1390074102-15686-1-git-send-email-s.martin49@gmail.com>
References: <1390074102-15686-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390074102-15686-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- remove explicit PATH=... in configure commands in pkg-autotools.mk
  because it is already added via *_CONFIGURE_OPTS (ThomasP), and
  reword the commit message.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 463cd63..36d8648 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -61,6 +61,7 @@ ifeq ($(5),target)
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
+	PATH=$(BR2_PATH) \
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
@@ -73,6 +74,7 @@ else
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
+	PATH=$(BR2_PATH) \
 	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
-- 
1.8.5.3
