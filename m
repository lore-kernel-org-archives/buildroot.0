From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Dec 2019 21:52:24 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/pango: needs libfribidi
In-Reply-To: <20191209205224.2762-1-ps.report@gmx.net>
References: <20191209205224.2762-1-ps.report@gmx.net>
Message-ID: <20191209205224.2762-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/f16fda910da23dfe5f8ac1cb51f9dbcec444b516

  subprocess.CalledProcessError: Command '['git', 'clone', 'https://github.com/fribidi/fribidi.git', 'fribidi']' returned non-zero exit status 128.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pango/Config.in | 1 +
 package/pango/pango.mk  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/pango/Config.in b/package/pango/Config.in
index cdf8b54171..e810598eef 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_FONTCONFIG
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 33e7825896..48edd18b05 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -19,6 +19,7 @@ PANGO_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	libglib2 \
+	libfribidi \
 	cairo \
 	harfbuzz \
 	fontconfig \
@@ -26,6 +27,7 @@ PANGO_DEPENDENCIES = \
 HOST_PANGO_DEPENDENCIES = \
 	host-pkgconf \
 	host-libglib2 \
+	host-libfribidi \
 	host-cairo \
 	host-harfbuzz \
 	host-fontconfig \
-- 
2.24.0
