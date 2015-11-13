From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Nov 2015 22:48:52 +0100
Subject: [Buildroot] [PATCH 6/6] core/pkg-infrastructures: remove
	LD_LIBRARY_PATH from the environment
In-Reply-To: <cover.1447449754.git.yann.morin.1998@free.fr>
References: <cover.1447449754.git.yann.morin.1998@free.fr>
Message-ID: <0a14a9ff7f39c78d2a39f8ccde40a9f7a6d020b2.1447449754.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ben Boeckel <mathstuf@gmail.com>

If system tools are selected, the host's lib/ directory may shadow
libraries from the system which are configured differently and do not
have all of the symbols required by the system tool.

Since buildroot now uses rpath everywhere, LD_LIBRARY_PATH should not
be necessary anyways.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Makefile.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ca34660..85008bb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -296,12 +296,10 @@ HOST_CONFIGURE_OPTS = \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
 	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 	INTLTOOL_PERL=$(PERL)
 
 HOST_MAKE_ENV = \
 	PATH=$(BR_PATH) \
-	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	PKG_CONFIG_SYSROOT_DIR="/" \
 	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
-- 
1.9.1
