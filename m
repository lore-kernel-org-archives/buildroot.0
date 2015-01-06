From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:03:06 +0100
Subject: [Buildroot] [PATCH v5 08/16] erlang-p1-xml: new package.
In-Reply-To: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1420552994-657-9-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                      |  1 +
 package/erlang-p1-xml/Config.in        |  7 +++++++
 package/erlang-p1-xml/erlang-p1-xml.mk | 16 ++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/erlang-p1-xml/Config.in
 create mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk

diff --git a/package/Config.in b/package/Config.in
index ca26408..da4330c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,6 +399,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
diff --git a/package/erlang-p1-xml/Config.in b/package/erlang-p1-xml/Config.in
new file mode 100644
index 0000000..a6f4bd7
--- /dev/null
+++ b/package/erlang-p1-xml/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_XML
+	bool "erlang-p1-xml"
+	select BR2_PACKAGE_EXPAT
+	help
+	  XML utilities for Erlang
+
+	  https://github.com/processone/xml
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
new file mode 100644
index 0000000..ea5d058
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
+ERLANG_P1_XML_DEPENDENCIES = expat
+ERLANG_P1_XML_INSTALL_STAGING = YES
+
+ERLANG_P1_XML_USE_AUTOCONF = YES
+
+$(eval $(rebar-package))
-- 
2.1.0
