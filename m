From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jan 2015 10:32:19 +0100
Subject: [Buildroot] [PATCH v6 15/16] erlang-p1-cache-tab: new package.
In-Reply-To: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1421055140-5092-16-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                                  |  1 +
 package/erlang-p1-cache-tab/Config.in              |  7 +++++++
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk | 13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/erlang-p1-cache-tab/Config.in
 create mode 100644 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk

diff --git a/package/Config.in b/package/Config.in
index 8a7f723..48c3c4a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
diff --git a/package/erlang-p1-cache-tab/Config.in b/package/erlang-p1-cache-tab/Config.in
new file mode 100644
index 0000000..eed2676
--- /dev/null
+++ b/package/erlang-p1-cache-tab/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_CACHE_TAB
+	bool "erlang-p1-cache-tab"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	help
+	  Erlang library implementing cache tables
+
+	  https://github.com/processone/cache_tab
diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
new file mode 100644
index 0000000..f651b06
--- /dev/null
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-cache-tab
+#
+################################################################################
+
+ERLANG_P1_CACHE_TAB_VERSION = 7b89d6a
+ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
+ERLANG_P1_CACHE_TAB_LICENSE = GPLv2+
+ERLANG_P1_CACHE_TAB_LICENSE_FILES = COPYING
+ERLANG_P1_CACHE_TAB_DEPENDENCIES = erlang-p1-utils
+
+$(eval $(rebar-package))
-- 
2.1.0
