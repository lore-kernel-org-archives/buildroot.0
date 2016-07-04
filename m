From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:37 +0200
Subject: [Buildroot] [PATCH 26/83 v2] docs/manual: add example about
	sub-options
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <7c092c340e985ccd41ca5a113db402fd23322d3f.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1:
  - wrap example at 72-chars  (Arnout)
---
 docs/manual/adding-packages-directory.txt | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index dc66f00..0ff9eda 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -54,6 +54,31 @@ examples in other packages. The syntax of the +Config.in+ file is the same
 as the one for the kernel Kconfig file. The documentation for this syntax is
 available at http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
 
+For example:
+
+---------------------------
+config BR2_PACKAGE_LIBFOO
+	bool "libfoo"
+	help
+	  This is a comment that explains what libfoo is.
+
+	  http://foosoftware.org/libfoo/
+
+if BR2_PACKAGE_LIBFOO
+
+config BR2_PACKAGE_LIBFOO_BAR
+	bool "bar support"
+	help
+	  This is a comment that briefly explains what bar support is,
+	  if it's not obvious.
+
+endif # BR2_PACKAGE_LIBFOO
+---------------------------
+
+The sub-options will be cleanly indented below the main symbol when it
+is enabled, and will be properly hidden when the symbol is disabled.
+
+
 Finally you have to add your new +libfoo/Config.in+ to
 +package/Config.in+ (or in a category subdirectory if you decided to
 put your package in one of the existing categories). The files
-- 
2.7.4
