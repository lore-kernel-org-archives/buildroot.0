From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue,  5 Sep 2017 10:39:17 +0200
Subject: [Buildroot] [PATCH] package/netplug: init script create needed lock
	directory
Message-ID: <20170905083917.8625-1-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Init script use /var/lock/subsys/netplugd but directory
/var/lock/subsys can be missing.

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/netplug/S29netplug | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index 88f933d556..fe63c1b79a 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -11,6 +11,9 @@
 
 # Copyright 2003 Key Research, Inc.
 
+# Create needed directories
+[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
+
 # Source function library.
 if [ -f /etc/init.d/functions ]; then
 	. /etc/init.d/functions
-- 
2.11.0
