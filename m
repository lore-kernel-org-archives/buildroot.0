From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri,  6 Mar 2015 12:35:55 -0500
Subject: [Buildroot] [PATCH 5/7] lttng-babeltrace: update Config.in's help
In-Reply-To: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <1425663357-22541-6-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/lttng-babeltrace/Config.in | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 3fe1b3a..c5eb5e0 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -9,12 +9,15 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC # posix_fallocate
 	help
-	  Babeltrace is part of the LTTng 2.x project.
+	  The Babeltrace project provides trace read and write libraries,
+	  as well as a trace converter application. Plugins can be created
+	  for any trace format to allow its conversion to/from another
+	  trace format.
 
-	  This project provides trace read and write libraries, as
-	  well as a trace converter. A plugin can be created for any
-	  trace format to allow its conversion to/from another trace
-	  format.
+	  Babeltrace is the reference implementation of the Common
+	  Trace Format (see <http://diamon.org/docs/ctf/>). Babeltrace
+	  can decode and display LTTng traces, since the latter
+	  are written using the CTF format.
 
 	  Having this tool on the target is not mandatory. You can
 	  transfer the binary trace output from the target to your
@@ -23,7 +26,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	  $(O)/host/usr/bin/babeltrace as a dependency of the
 	  lttng-tools package.
 
-	  http://lttng.org
+	  http://www.efficios.com/babeltrace
 
 comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar, threads, largefile"
 	depends on BR2_USE_MMU
-- 
2.2.1
