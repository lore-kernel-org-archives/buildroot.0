From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun,  3 Nov 2013 09:30:53 +0000
Subject: [Buildroot] [PATCH] dropwatch: fix avr32 build failure
Message-ID: <1383471053-8243-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

On avr32, dropwatch needs libiberty to avoid build failures such as

  http://autobuild.buildroot.net/results/cd5/cd5e22fb5c9b0fc5d396bc85a5e253a1a65054da/

Also test built on ARM.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/dropwatch/dropwatch-04-avr32-build.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/dropwatch/dropwatch-04-avr32-build.patch

diff --git a/package/dropwatch/dropwatch-04-avr32-build.patch b/package/dropwatch/dropwatch-04-avr32-build.patch
new file mode 100644
index 0000000..e83e405
--- /dev/null
+++ b/package/dropwatch/dropwatch-04-avr32-build.patch
@@ -0,0 +1,17 @@
+On avr32, dropwatch needs libiberty to avoid build failures such as
+
+  http://autobuild.buildroot.net/results/cd5/cd5e22fb5c9b0fc5d396bc85a5e253a1a65054da/
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/src/Makefile b/src/Makefile
+--- a/src/Makefile	2013-11-03 09:22:16.713210025 +0000
++++ b/src/Makefile	2013-11-03 09:22:59.465126490 +0000
+@@ -1,6 +1,6 @@
+ all: dropwatch
+ CFLAGS+=-c -g -D_GNU_SOURCE -Wall `pkg-config --cflags libnl-3.0`
+-LDFLAGS=-lbfd -lreadline -lnl-3 -lnl-genl-3
++LDFLAGS=-lbfd -liberty -lreadline -lnl-3 -lnl-genl-3
+ OBJFILES := main.o lookup.o\
+ 	 lookup_bfd.o lookup_kas.o
+ 
-- 
1.8.3.2
