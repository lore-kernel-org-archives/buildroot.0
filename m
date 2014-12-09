From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  9 Dec 2014 15:34:14 +0100
Subject: [Buildroot] [PATCH v4 09/17] erlang-p1-xml: new package.
In-Reply-To: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1418135662-773-10-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                      |  1 +
 package/erlang-p1-xml/Config.in        |  6 ++++++
 package/erlang-p1-xml/erlang-p1-xml.mk | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/erlang-p1-xml/Config.in
 create mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk

diff --git a/package/Config.in b/package/Config.in
index 9096211..f9503ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
diff --git a/package/erlang-p1-xml/Config.in b/package/erlang-p1-xml/Config.in
new file mode 100644
index 0000000..85fe02f
--- /dev/null
+++ b/package/erlang-p1-xml/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_XML
+	bool "erlang-p1-xml"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_EXPAT
+	help
+	  XML utilities for Erlang
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
new file mode 100644
index 0000000..ac5ff53
--- /dev/null
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# erlang-p1-xml
+#
+################################################################################
+
+ERLANG_P1_XML_VERSION = b530983
+ERLANG_P1_XML_SITE = $(call github,processone,xml,$(ERLANG_P1_XML_VERSION))
+ERLANG_P1_XML_LICENSE = GPLv2
+ERLANG_P1_XML_LICENSE_FILES = COPYING
+ERLANG_P1_XML_DEPENDENCIES = erlang expat
+ERLANG_P1_XML_INSTALL_STAGING = YES
+
+ERLANG_P1_XML_CONFIGURE = YES
+
+$(eval $(rebar-package))
-- 
2.1.0
