From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:16 +0100
Subject: [Buildroot] [git commit] erlang-p1-xml: new package.
Message-ID: <20150203092417.B300D80E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3adcfadd95a663462320ddb2cb9ca71210dfe08d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fixup license, it is GPLv2+ and not GPLv2.]

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/erlang-p1-xml/Config.in        |    7 +++++++
 package/erlang-p1-xml/erlang-p1-xml.mk |   16 ++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4344de8..9eb2087 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
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
index 0000000..3bcac66
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
+ERLANG_P1_XML_LICENSE = GPLv2+
+ERLANG_P1_XML_LICENSE_FILES = COPYING
+ERLANG_P1_XML_DEPENDENCIES = expat
+ERLANG_P1_XML_INSTALL_STAGING = YES
+
+ERLANG_P1_XML_USE_AUTOCONF = YES
+
+$(eval $(rebar-package))
