From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:36 +0100
Subject: [Buildroot] [git commit] erlang-p1-cache-tab: new package.
Message-ID: <20150203092418.128827FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=527aaf08cca0e9b74cb3c13ce87802a603010793
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/erlang-p1-cache-tab/Config.in              |    7 +++++++
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e9cabfa..aa46590 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
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
