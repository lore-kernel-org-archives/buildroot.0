From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:52:09 +0200
Subject: [Buildroot] [PATCH 14/16] erlang-p1-oauth: New package
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-15-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OAuth2 library for Erlang
https://github.com/processone/p1_oauth2

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                            |  1 +
 package/erlang-p1-oauth/Config.in            |  6 ++++++
 package/erlang-p1-oauth/erlang-p1-oauth.hash |  2 ++
 package/erlang-p1-oauth/erlang-p1-oauth.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/erlang-p1-oauth/Config.in
 create mode 100644 package/erlang-p1-oauth/erlang-p1-oauth.hash
 create mode 100644 package/erlang-p1-oauth/erlang-p1-oauth.mk

diff --git a/package/Config.in b/package/Config.in
index 2b53add300..580974a02d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -514,6 +514,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
+	source "package/erlang-p1-oauth/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
diff --git a/package/erlang-p1-oauth/Config.in b/package/erlang-p1-oauth/Config.in
new file mode 100644
index 0000000000..3ac410b933
--- /dev/null
+++ b/package/erlang-p1-oauth/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_OAUTH
+	bool "erlang-p1-oauth"
+	help
+	  OAuth2 library for Erlang
+
+	  https://github.com/processone/p1_oauth2
diff --git a/package/erlang-p1-oauth/erlang-p1-oauth.hash b/package/erlang-p1-oauth/erlang-p1-oauth.hash
new file mode 100644
index 0000000000..34e518bf1a
--- /dev/null
+++ b/package/erlang-p1-oauth/erlang-p1-oauth.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9b43e025b923221cfe6a6efc76790d97b1c233e3e2db37fc804294d847bcfaa3 erlang-p1-oauth-0.6.1.tar.gz
diff --git a/package/erlang-p1-oauth/erlang-p1-oauth.mk b/package/erlang-p1-oauth/erlang-p1-oauth.mk
new file mode 100644
index 0000000000..02a83fdb9f
--- /dev/null
+++ b/package/erlang-p1-oauth/erlang-p1-oauth.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-oauth
+#
+################################################################################
+
+ERLANG_P1_OAUTH_VERSION = 0.6.1
+ERLANG_P1_OAUTH_SITE = $(call github,processone,p1_oauth,$(ERLANG_P1_OAUTH_VERSION))
+ERLANG_P1_OAUTH_LICENSE = MIT
+ERLANG_P1_OAUTH_LICENSE_FILES = LICENSE
+ERLANG_P1_OAUTH_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
2.11.0
