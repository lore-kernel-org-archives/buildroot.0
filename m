From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:26:02 +0100
Subject: [Buildroot] [PATCH 16/24 v3] erlang-p1-xml: new package.
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <d4d83bc422863e3ad464cf0bd8f2381f05a4b556.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Oudinet <johan.oudinet@gmail.com>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                      |  1 +
 package/erlang-p1-xml/Config.in        |  6 ++++++
 package/erlang-p1-xml/erlang-p1-xml.mk | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/erlang-p1-xml/Config.in
 create mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk

diff --git a/package/Config.in b/package/Config.in
index bd82388..da13e8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ if BR2_PACKAGE_ERLANG
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
index 0000000..5f43ccb
--- /dev/null
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -0,0 +1,14 @@
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
+$(eval $(rebar-package))
-- 
1.9.1
