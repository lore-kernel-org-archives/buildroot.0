From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:21 +0100
Subject: [Buildroot] [git commit] erlang-p1-tls: new package.
Message-ID: <20150203092417.CA70780E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73eab34485ba9832f8d1221f65547a19aeffd03a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/erlang-p1-tls/Config.in        |    6 ++++++
 package/erlang-p1-tls/erlang-p1-tls.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c0512fe..851cc24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
new file mode 100644
index 0000000..42c6a3e
--- /dev/null
+++ b/package/erlang-p1-tls/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_TLS
+	bool "erlang-p1-tls"
+	help
+	  Erlang interface to OpenSSL
+
+	  https://github.com/processone/tls
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
new file mode 100644
index 0000000..d6e5801
--- /dev/null
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-tls
+#
+################################################################################
+
+ERLANG_P1_TLS_VERSION = 53f0478
+ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
+ERLANG_P1_TLS_LICENSE = GPLv2+
+ERLANG_P1_TLS_LICENSE_FILES = COPYING
+ERLANG_P1_TLS_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
