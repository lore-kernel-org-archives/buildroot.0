From: Chris Packham <judge.packham@gmail.com>
Date: Mon,  9 Sep 2019 21:54:32 +1200
Subject: [Buildroot] [PATCH 2/2] eventlog: remove package
In-Reply-To: <20190909095432.3935-1-judge.packham@gmail.com>
References: <20190909095432.3935-1-judge.packham@gmail.com>
Message-ID: <20190909095432.3935-2-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since syslog-ng 3.11.1 eventlog has been bundled with the sources.
Remove the separate package.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 DEVELOPERS                     |  1 -
 package/Config.in              |  1 -
 package/eventlog/Config.in     |  8 --------
 package/eventlog/eventlog.hash |  2 --
 package/eventlog/eventlog.mk   | 15 ---------------
 package/syslog-ng/syslog-ng.mk |  2 +-
 6 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 package/eventlog/Config.in
 delete mode 100644 package/eventlog/eventlog.hash
 delete mode 100644 package/eventlog/eventlog.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5784843e33..bdf3565f65 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -490,7 +490,6 @@ F:	configs/olimex_a13_olinuxino_defconfig
 F:	configs/orangepi_plus_defconfig
 
 N:	Chris Packham <judge.packham@gmail.com>
-F:	package/eventlog/
 F:	package/gstreamer1/gst1-shark/
 F:	package/micropython/
 F:	package/micropython-lib/
diff --git a/package/Config.in b/package/Config.in
index 9336261c5d..ee17778c45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1489,7 +1489,6 @@ menu "JSON/XML"
 endmenu
 
 menu "Logging"
-	source "package/eventlog/Config.in"
 	source "package/glog/Config.in"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
diff --git a/package/eventlog/Config.in b/package/eventlog/Config.in
deleted file mode 100644
index f9442f6187..0000000000
--- a/package/eventlog/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_EVENTLOG
-	bool "eventlog"
-	help
-	  eventlog is a library for creating structured events from
-	  applications, and is the workhorse behind syslog-ng's own
-	  messages.
-
-	  https://my.balabit.com/downloads/eventlog/
diff --git a/package/eventlog/eventlog.hash b/package/eventlog/eventlog.hash
deleted file mode 100644
index b8f2ec6141..0000000000
--- a/package/eventlog/eventlog.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://my.balabit.com/downloads/eventlog/0.2/eventlog_0.2.12.dsc
-sha256 494dac8e01dc5ce323df2ad554d94874938dab51aa025987677b2bc6906a9c66 eventlog_0.2.12.tar.gz
diff --git a/package/eventlog/eventlog.mk b/package/eventlog/eventlog.mk
deleted file mode 100644
index 7253657165..0000000000
--- a/package/eventlog/eventlog.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# eventlog
-#
-################################################################################
-
-EVENTLOG_VERSION_MAJOR = 0.2
-EVENTLOG_VERSION = $(EVENTLOG_VERSION_MAJOR).12
-EVENTLOG_SOURCE = eventlog_$(EVENTLOG_VERSION).tar.gz
-EVENTLOG_SITE = https://my.balabit.com/downloads/eventlog/$(EVENTLOG_VERSION_MAJOR)
-EVENTLOG_LICENSE = BSD-3-Clause
-EVENTLOG_LICENSE_FILES = COPYING
-EVENTLOG_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 05ccd751e4..3885f0b942 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -11,7 +11,7 @@ SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-n
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
-	eventlog libglib2 openssl pcre
+	libglib2 openssl pcre
 # We're patching configure.ac
 SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
-- 
2.23.0
