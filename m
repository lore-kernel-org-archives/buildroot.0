From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:52:06 +0200
Subject: [Buildroot] [PATCH 11/16] erlang-p1-xml: bump to version 1.1.22
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-12-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .../0001-remove-dependencies-from-rebar-config.patch   | 18 ++++++++++++++++++
 package/erlang-p1-xml/erlang-p1-xml.hash               |  2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk                 |  5 +++--
 3 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch

diff --git a/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
new file mode 100644
index 0000000000..9b0a53502c
--- /dev/null
+++ b/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
@@ -0,0 +1,18 @@
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+
+Signed-off-by: Christophe Romain <cromain@process-one.net>
+
+diff --git a/rebar.config b/rebar.config
+index 3e20029..a47f1ff 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -31,8 +31,6 @@
+ {port_specs, [{"priv/lib/fxml.so", ["c_src/fxml.c"]},
+               {"priv/lib/fxml_stream.so", ["c_src/fxml_stream.c"]}]}.
+
+-{deps, [{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-
+ {clean_files, ["c_src/fxml.gcda", "c_src/fxml.gcno", "c_src/fxml_stream.gcda", "c_src/fxml_stream.gcno"]}.
+
+ {cover_enabled, true}.
diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index 8e4a79fee1..00b90b52ec 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 4c163c5b9572baa93eb97e03544db57dc751c7995a5279081a0d56f5fdaa2521 erlang-p1-xml-1.1.1.tar.gz
+sha256 0163e7bd11b6705732fd7281209925e39534c9ea123887574218422c34762d7c erlang-p1-xml-1.1.22.tar.gz
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 31bab2311d..1e43400fc1 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 1.1.1
-ERLANG_P1_XML_SITE = $(call github,processone,xml,$(ERLANG_P1_XML_VERSION))
+ERLANG_P1_XML_VERSION = 1.1.22
+ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
@@ -14,3 +14,4 @@ ERLANG_P1_XML_INSTALL_STAGING = YES
 ERLANG_P1_XML_USE_AUTOCONF = YES
 
 $(eval $(rebar-package))
+$(eval $(host-rebar-package))
-- 
2.11.0
