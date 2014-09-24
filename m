From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 24 Sep 2014 08:43:03 +0200
Subject: [Buildroot] [PATCH 2/4] lttng-tools: bump to version 2.5.0
In-Reply-To: <1411540985-22792-1-git-send-email-jezz@sysmic.org>
References: <1411540985-22792-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411540985-22792-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libxml2 is now necessary

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/lttng-tools/Config.in      | 1 +
 package/lttng-tools/lttng-tools.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index cde9baf..ea969a5 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
 	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 8d44600..62cc038 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.4.1
+LTTNG_TOOLS_VERSION = 2.5.0
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
+LTTNG_TOOLS_CONF_OPT += --with-xml-prefix=$(STAGING_DIR)/usr
 
 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
 # host is very useful, since those tools allow to convert the binary
 # trace format into an human readable format.
-LTTNG_TOOLS_DEPENDENCIES = liburcu popt host-lttng-babeltrace util-linux
+LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux
 
 LTTNG_AUTORECONF = YES
 
-- 
1.9.1
