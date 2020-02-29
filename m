From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 19:26:38 +0100
Subject: [Buildroot] [git commit] package/qpdf: needs wchar
Message-ID: <20200229181728.2FBF88EF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f9bcc01b3ef94c8f138b6dccc861d9e222de5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream was not too keen [0] on applying fixes for toolchains without
wchar, so just require that.

The sole user selecting qpdf already depends on wchar, so update the
comment accordingly.

[0] https://github.com/qpdf/qpdf/pull/405#issuecomment-592971907

Fixes:
 - http://autobuild.buildroot.org/results/99c82d4775ed44bd04d0a48188ff590dcba73d69

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: drop the patch, add the dependency]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cups-filters/Config.in | 2 +-
 package/qpdf/Config.in         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 5badf0e1f1..9e4e37ca6b 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP # qpdf
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_WCHAR # libglib2, qpdf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index 7550e1547a..6f586f651a 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QPDF
 	bool "qpdf"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
