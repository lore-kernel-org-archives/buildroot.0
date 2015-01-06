From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:03:12 +0100
Subject: [Buildroot] [PATCH v5 14/16] erlang-p1-iconv: new package.
In-Reply-To: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1420552994-657-15-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                          |  1 +
 package/erlang-p1-iconv/Config.in          |  7 +++++++
 package/erlang-p1-iconv/erlang-p1-iconv.mk | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/erlang-p1-iconv/Config.in
 create mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.mk

diff --git a/package/Config.in b/package/Config.in
index 471de41..04ea232 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,6 +399,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
diff --git a/package/erlang-p1-iconv/Config.in b/package/erlang-p1-iconv/Config.in
new file mode 100644
index 0000000..98efb21
--- /dev/null
+++ b/package/erlang-p1-iconv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_ICONV
+	bool "erlang-p1-iconv"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Erlang interface to libiconv
+
+	  https://github.com/processone/eiconv
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
new file mode 100644
index 0000000..2189f01
--- /dev/null
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# erlang-p1-iconv
+#
+################################################################################
+
+ERLANG_P1_ICONV_VERSION = dff5ee5
+ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
+ERLANG_P1_ICONV_LICENSE = GPLv2+
+ERLANG_P1_ICONV_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+ERLANG_P1_ICONV_DEPENDENCIES += libiconv
+endif
+
+ERLANG_P1_ICONV_USE_AUTOCONF = YES
+
+$(eval $(rebar-package))
-- 
2.1.0
