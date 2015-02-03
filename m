From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:09 +0100
Subject: [Buildroot] [git commit] erlang-lager: new package.
Message-ID: <20150203092417.9948380E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a32f6bf2b3b7e3a426538226e4d19098328a7df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: minor adjustement to Config.in help text]

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/erlang-lager/Config.in       |   11 +++++++++++
 package/erlang-lager/erlang-lager.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index df09860..691af64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -400,6 +400,7 @@ menu "Interpreter languages and scripting"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
+	source "package/erlang-lager/Config.in"
 endmenu
 endif
 	source "package/guile/Config.in"
diff --git a/package/erlang-lager/Config.in b/package/erlang-lager/Config.in
new file mode 100644
index 0000000..d088821
--- /dev/null
+++ b/package/erlang-lager/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ERLANG_LAGER
+	bool "erlang-lager"
+	select BR2_PACKAGE_ERLANG_GOLDRUSH
+	help
+	  Lager (as in the beer) is a logging framework for
+	  Erlang. Its purpose is to provide a more traditional way to
+	  perform logging in an erlang application that plays nicely
+	  with traditional UNIX logging tools like logrotate and
+	  syslog.
+
+	  https://github.com/basho/lager
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
new file mode 100644
index 0000000..b725bfd
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
+ERLANG_LAGER_DEPENDENCIES = erlang-goldrush
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
