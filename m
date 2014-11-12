From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:58 +0100
Subject: [Buildroot] [PATCH 12/24 v3] erlang-goldrush: new package.
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <3822d3b1ba910b56db518b9efbf5a124bbd99632.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Oudinet <johan.oudinet@gmail.com>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                          |  5 +++++
 package/erlang-goldrush/Config.in          |  6 ++++++
 package/erlang-goldrush/erlang-goldrush.mk | 14 ++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/erlang-goldrush/Config.in
 create mode 100644 package/erlang-goldrush/erlang-goldrush.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..b4eaf14 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -391,6 +391,11 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
+if BR2_PACKAGE_ERLANG
+menu "Erlang libraries/modules"
+	source "package/erlang-goldrush/Config.in"
+endmenu
+endif
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
 	source "package/jimtcl/Config.in"
diff --git a/package/erlang-goldrush/Config.in b/package/erlang-goldrush/Config.in
new file mode 100644
index 0000000..685a887
--- /dev/null
+++ b/package/erlang-goldrush/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_GOLDRUSH
+	bool "erlang-goldrush"
+	depends on BR2_PACKAGE_ERLANG
+	help
+	  Goldrush is a small Erlang app that provides fast event
+	  stream processing.
diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
new file mode 100644
index 0000000..7537e76
--- /dev/null
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-goldrush
+#
+################################################################################
+
+ERLANG_GOLDRUSH_VERSION = 0.1.6
+ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
+ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
+ERLANG_GOLDRUSH_DEPENDENCIES = erlang host-erlang-rebar
+ERLANG_GOLDRUSH_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
-- 
1.9.1
