From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu,  9 Apr 2015 20:48:27 +0900
Subject: [Buildroot] [PATCH] pkg-*.mk: add comment about argument 1 of
	inner-*-package
Message-ID: <1428580107-15674-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 package/pkg-autotools.mk | 3 ++-
 package/pkg-generic.mk   | 3 ++-
 package/pkg-kconfig.mk   | 3 ++-
 package/pkg-luarocks.mk  | 3 ++-
 package/pkg-perl.mk      | 3 ++-
 package/pkg-python.mk    | 3 ++-
 package/pkg-rebar.mk     | 3 ++-
 package/pkg-virtual.mk   | 3 ++-
 8 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 2ecf7d8..d094023 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -101,7 +101,8 @@ endef
 # calls the generic package infrastructure to generate the necessary
 # make targets
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f77aab2..d561dc0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -273,7 +273,8 @@ endef
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index fd9f19d..32193b7 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -15,7 +15,8 @@
 # inner-kconfig-package -- generates the make targets needed to support a
 # kconfig package
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 83f338e..36c2883 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -23,7 +23,8 @@
 # tune the build process and calls the generic package infrastructure to
 # generate the necessary make targets
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 6577588..4c191b5 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -29,7 +29,8 @@ PERL_RUN = PERL5LIB= $(HOST_DIR)/usr/bin/perl
 # calls the generic package infrastructure to generate the necessary
 # make targets
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 426301a..11c6d2e 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -81,7 +81,8 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 # few hooks to tune the build process and calls the generic package
 # infrastructure to generate the necessary make targets
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 75facd5..d7cc175 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -101,7 +101,8 @@ endef
 # calls the generic package infrastructure to generate the necessary
 # make targets.
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 2889ef9..d6367d9 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -18,7 +18,8 @@
 # inner-virtual-package -- defines the dependency rules of the virtual
 # package against its provider.
 #
-#  argument 1 is the lowercase package name
+#  argument 1 is the lowercase package name, including a host_ prefix
+#             for host packages
 #  argument 2 is the uppercase package name, including a HOST_ prefix
 #             for host packages
 #  argument 3 is the uppercase package name, without the HOST_ prefix
-- 
1.9.1
