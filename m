From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 21 Feb 2020 14:43:13 -0800
Subject: [Buildroot] [PATCH 3/3] package/meson: add gobject-introspection
 tools to cross-compilation.conf.in
In-Reply-To: <20200221224313.854089-1-aduskett@gmail.com>
References: <20200221224313.854089-1-aduskett@gmail.com>
Message-ID: <20200221224313.854089-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

These paths are hardcoded by default to the host directory; however, because
Buildroot is using wrappers for gobject-introspection, the sysroot paths to
these tools must be explicitly called instead.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/meson/cross-compilation.conf.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 369e225b3e..565ea67240 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -9,6 +9,8 @@ cpp = '@TARGET_CROSS at g++'
 ar = '@TARGET_CROSS at ar'
 strip = '@TARGET_CROSS at strip'
 pkgconfig = '@HOST_DIR@/bin/pkgconf'
+g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
+g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 
 [properties]
 needs_exe_wrapper = true
-- 
2.24.1
