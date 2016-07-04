From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:49 +0200
Subject: [Buildroot] [PATCH 38/83 v2] package/erlang: include Erlang
	libraries from erlang's Config.in
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <65fc8783dfc2b79a93e0d05500b2fd7771befac5.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

erlang now has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in        | 16 ----------------
 package/erlang/Config.in | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ebc8f6f..0e52f54 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -491,22 +491,6 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
-if BR2_PACKAGE_ERLANG
-menu "Erlang libraries/modules"
-	source "package/erlang-goldrush/Config.in"
-	source "package/erlang-lager/Config.in"
-	source "package/erlang-p1-cache-tab/Config.in"
-	source "package/erlang-p1-iconv/Config.in"
-	source "package/erlang-p1-sip/Config.in"
-	source "package/erlang-p1-stringprep/Config.in"
-	source "package/erlang-p1-stun/Config.in"
-	source "package/erlang-p1-tls/Config.in"
-	source "package/erlang-p1-utils/Config.in"
-	source "package/erlang-p1-xml/Config.in"
-	source "package/erlang-p1-yaml/Config.in"
-	source "package/erlang-p1-zlib/Config.in"
-endmenu
-endif
 	source "package/ficl/Config.in"
 	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 11407db..b4bb7e0 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -10,7 +10,7 @@ comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_ERLANG
+menuconfig BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
@@ -43,4 +43,19 @@ config BR2_PACKAGE_ERLANG_MEGACO
 	  size so if you do not need it then it is recommended not to
 	  enable it.
 
+comment "Erlang libraries/modules"
+
+source "package/erlang-goldrush/Config.in"
+source "package/erlang-lager/Config.in"
+source "package/erlang-p1-cache-tab/Config.in"
+source "package/erlang-p1-iconv/Config.in"
+source "package/erlang-p1-sip/Config.in"
+source "package/erlang-p1-stringprep/Config.in"
+source "package/erlang-p1-stun/Config.in"
+source "package/erlang-p1-tls/Config.in"
+source "package/erlang-p1-utils/Config.in"
+source "package/erlang-p1-xml/Config.in"
+source "package/erlang-p1-yaml/Config.in"
+source "package/erlang-p1-zlib/Config.in"
+
 endif # BR2_PACKAGE_ERLANG
-- 
2.7.4
