From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:53:28 +0200
Subject: [Buildroot] [git commit] eventlog: new package
Message-ID: <20151013215344.59D7F81D8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a2ba9941d3df2e49f18bffcfa105fc704aa5e50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

eventlog is a library for creating structured events from
applications, and is the workhorse behind syslog-ng's own messages.

[Thomas:
 - fix alphabetic ordering in package/Config.in, as noticed by
   Vicente.
 - rewrap Config.in help text and add some URL as a reference (though
   the eventlog project doesn't seem to have a real web page)
 - remove useless slash at the end of EVENTLOG_SITE
 - make the license info more specific: it's a BSD-3c license
 - add a hash file.]

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/eventlog/Config.in     |    8 ++++++++
 package/eventlog/eventlog.hash |    2 ++
 package/eventlog/eventlog.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f686f13..8e3c64a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -943,6 +943,7 @@ menu "JSON/XML"
 endmenu
 
 menu "Logging"
+	source "package/eventlog/Config.in"
 	source "package/glog/Config.in"
 	source "package/liblog4c-localtime/Config.in"
 	source "package/liblogging/Config.in"
diff --git a/package/eventlog/Config.in b/package/eventlog/Config.in
new file mode 100644
index 0000000..f9442f6
--- /dev/null
+++ b/package/eventlog/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_EVENTLOG
+	bool "eventlog"
+	help
+	  eventlog is a library for creating structured events from
+	  applications, and is the workhorse behind syslog-ng's own
+	  messages.
+
+	  https://my.balabit.com/downloads/eventlog/
diff --git a/package/eventlog/eventlog.hash b/package/eventlog/eventlog.hash
new file mode 100644
index 0000000..b8f2ec6
--- /dev/null
+++ b/package/eventlog/eventlog.hash
@@ -0,0 +1,2 @@
+# From https://my.balabit.com/downloads/eventlog/0.2/eventlog_0.2.12.dsc
+sha256 494dac8e01dc5ce323df2ad554d94874938dab51aa025987677b2bc6906a9c66 eventlog_0.2.12.tar.gz
diff --git a/package/eventlog/eventlog.mk b/package/eventlog/eventlog.mk
new file mode 100644
index 0000000..c4e5fd9
--- /dev/null
+++ b/package/eventlog/eventlog.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# eventlog
+#
+################################################################################
+
+EVENTLOG_VERSION = 0.2.12
+EVENTLOG_SOURCE = eventlog_$(EVENTLOG_VERSION).tar.gz
+EVENTLOG_SITE = https://my.balabit.com/downloads/eventlog/0.2
+EVENTLOG_LICENSE = BSD-3c
+EVENTLOG_LICENSE_FILES = COPYING
+EVENTLOG_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
