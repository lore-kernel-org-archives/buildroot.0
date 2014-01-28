From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 23:04:05 +0100
Subject: [Buildroot] [git commit] package/pkg-cmake: disable colouring the
	output
Message-ID: <20140128221058.E64859C6AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d46789550173eaf1b355b3fd1d7b9b38ec204d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmake is the only build-system we support that does colour its output,

Also, since parallel builds generates intermixed output lines, it makes
for ugly-looking output.

Just disable cmake colouring globally.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index aedd1fc..13be557 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -64,6 +64,7 @@ define $(2)_CONFIGURE_CMDS
 	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
 		$$($$(PKG)_CONF_OPT) \
 	)
