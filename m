From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:22 +0100
Subject: [Buildroot] [PATCH 30/80 v1] docs/manual: add example about
	sub-options
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <788d2ea458c8ba66e8d16d9634629cce1284533c.1452983019.git.yann.morin.1998@free.fr>
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
index b9596a2..9df8d25 100644
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
1.9.1
