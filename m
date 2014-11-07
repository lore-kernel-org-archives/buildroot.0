From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri,  7 Nov 2014 14:28:40 +0100
Subject: [Buildroot] [PATCH v2 04/15] erlang-lager: new package.
In-Reply-To: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1415366931-6870-5-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                    |  1 +
 package/erlang-lager/Config.in       | 12 ++++++++++++
 package/erlang-lager/erlang-lager.mk | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/erlang-lager/Config.in
 create mode 100644 package/erlang-lager/erlang-lager.mk

diff --git a/package/Config.in b/package/Config.in
index b4eaf14..c2c0381 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ menu "Interpreter languages and scripting"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
+	source "package/erlang-lager/Config.in"
 endmenu
 endif
 	source "package/haserl/Config.in"
diff --git a/package/erlang-lager/Config.in b/package/erlang-lager/Config.in
new file mode 100644
index 0000000..f83239e
--- /dev/null
+++ b/package/erlang-lager/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ERLANG_LAGER
+	bool "erlang-lager"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_ERLANG_GOLDRUSH
+	help
+	  Logging framework for Erlang.
+	  
+	  Lager (as in the beer) is a logging framework for
+	  Erlang. Its purpose is to provide a more traditional way to
+	  perform logging in an erlang application that plays nicely
+	  with traditional UNIX logging tools like logrotate and
+	  syslog.
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
new file mode 100644
index 0000000..b530c8e
--- /dev/null
+++ b/package/erlang-lager/erlang-lager.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-lager
+#
+################################################################################
+
+ERLANG_LAGER_VERSION = 2.0.3
+ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
+ERLANG_LAGER_LICENSE = Apache-2.0
+ERLANG_LAGER_LICENSE_FILES = LICENSE
+ERLANG_LAGER_DEPENDENCIES = erlang erlang-goldrush
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
-- 
2.1.0
