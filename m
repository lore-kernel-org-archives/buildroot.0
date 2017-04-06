From: Semyon Kolganov <semenak94@mail.ru>
Date: Thu,  6 Apr 2017 15:02:03 +0300
Subject: [Buildroot] [PATCHv2] fmt: new package PATCHv2
In-Reply-To: <fmt: new package>
References: <fmt: new package>
Message-ID: <1491480123-15013-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
 package/Config.in     | 2 +-
 package/fmt/Config.in | 5 ++++-
 package/fmt/fmt.mk    | 5 -----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6f3399f..2bd55ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1433,8 +1433,8 @@ endmenu
 menu "Text and terminal handling"
 	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
-	source "package/icu/Config.in"
 	source "package/fmt/Config.in"
+	source "package/icu/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libedit/Config.in"
 	source "package/libenca/Config.in"
diff --git a/package/fmt/Config.in b/package/fmt/Config.in
index 9ce2874..e829f1f 100644
--- a/package/fmt/Config.in
+++ b/package/fmt/Config.in
@@ -3,4 +3,7 @@ config BR2_PACKAGE_FMT
 	help
 	  fmt is an open-source formatting library for C++. It can be used
 	  as a safe alternative to printf or as a fast alternative to
-	  IOStreams.
\ No newline at end of file
+	  IOStreams.
+
+comment "fmt needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 47a332d..b7e3db0 100755
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -15,9 +15,4 @@ FMT_CONF_OPTS = \
 	-DFMT_INSTALL=ON \
 	-DFMT_TEST=OFF
 
-define FMT_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/include/fmt
-	cp -dpfr $(@D)/fmt/*.h $(STAGING_DIR)/usr/include/fmt
-endef
-
 $(eval $(cmake-package))
-- 
2.7.4
