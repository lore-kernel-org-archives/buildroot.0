From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:22 +0100
Subject: [Buildroot] [PATCH 53/84 RFC] package/erlang: include Erlang
	libraries from erlang's Config.in
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <9f6da20c8f02cd0cb9c12bf828837a86ffcf87fd.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

erlang now has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in        | 16 ----------------
 package/erlang/Config.in | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3edbf49..14c3c2b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -458,22 +458,6 @@ endmenu
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
 	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 0ec01bb..f6da256 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -3,7 +3,7 @@ comment "erlang needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_ERLANG
+menuconfig BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
@@ -37,4 +37,19 @@ config BR2_PACKAGE_ERLANG_MEGACO
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
1.9.1
