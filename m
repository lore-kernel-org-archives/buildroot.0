From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 16 Jan 2018 15:06:39 +0100
Subject: [Buildroot] [PATCH 04/14] erlang-p1-xml: Bump to version 1.1.25
In-Reply-To: <20180116140649.7381-1-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
Message-ID: <20180116140649.7381-5-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also adjust the patch that removes rebar dependencies to reflect
version changes.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .../erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch  | 6 +++---
 package/erlang-p1-xml/erlang-p1-xml.hash                            | 2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk                              | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
index 9b0a53502c..b58db3f2c5 100644
--- a/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
+++ b/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
@@ -4,14 +4,14 @@ by rebar at build time.
 Signed-off-by: Christophe Romain <cromain@process-one.net>
 
 diff --git a/rebar.config b/rebar.config
-index 3e20029..a47f1ff 100644
+index 99f5047..ac2f3b2 100644
 --- a/rebar.config
 +++ b/rebar.config
-@@ -31,8 +31,6 @@
+@@ -32,8 +32,6 @@
  {port_specs, [{"priv/lib/fxml.so", ["c_src/fxml.c"]},
                {"priv/lib/fxml_stream.so", ["c_src/fxml_stream.c"]}]}.
 
--{deps, [{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-{deps, [{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
 -
  {clean_files, ["c_src/fxml.gcda", "c_src/fxml.gcno", "c_src/fxml_stream.gcda", "c_src/fxml_stream.gcno"]}.
 
diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index 00b90b52ec..ae3f3241c6 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0163e7bd11b6705732fd7281209925e39534c9ea123887574218422c34762d7c erlang-p1-xml-1.1.22.tar.gz
+sha256 aeda4051c08b78e2f036d82705433a667d03736f07ff0054862e82105435e285 erlang-p1-xml-1.1.25.tar.gz
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 58ba3cbdeb..ff9999834d 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 1.1.22
+ERLANG_P1_XML_VERSION = 1.1.25
 ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-- 
2.14.1
