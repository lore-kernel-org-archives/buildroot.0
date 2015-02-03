From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:05 +0100
Subject: [Buildroot] [git commit] erlang-goldrush: new package.
Message-ID: <20150203092417.9110680E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=730a94203c5eae7dbafcecde22a12c94bb2a07aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    5 +++++
 package/erlang-goldrush/Config.in          |    7 +++++++
 package/erlang-goldrush/erlang-goldrush.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 41544c7..df09860 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,11 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
+if BR2_PACKAGE_ERLANG
+menu "Erlang libraries/modules"
+	source "package/erlang-goldrush/Config.in"
+endmenu
+endif
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/erlang-goldrush/Config.in b/package/erlang-goldrush/Config.in
new file mode 100644
index 0000000..2ee579a
--- /dev/null
+++ b/package/erlang-goldrush/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_GOLDRUSH
+	bool "erlang-goldrush"
+	help
+	  Goldrush is a small Erlang app that provides fast event
+	  stream processing.
+
+	  https://github.com/DeadZen/goldrush
diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
new file mode 100644
index 0000000..b18a8ec
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
+ERLANG_GOLDRUSH_LICENSE = ISC
+ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
+ERLANG_GOLDRUSH_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
