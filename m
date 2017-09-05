From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:29:59 +0200
Subject: [Buildroot] [git commit] package/netplug: init script create needed
	lock directory
Message-ID: <20170905192240.47ADE801E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c81c6d8f3d5bdf1825acaa27428c9e25def48593
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Init script use /var/lock/subsys/netplugd but directory
/var/lock/subsys can be missing.

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netplug/S29netplug | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index 88f933d..d3df9dd 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -11,6 +11,9 @@
 
 # Copyright 2003 Key Research, Inc.
 
+# Create needed directories
+mkdir -p /var/lock/subsys
+
 # Source function library.
 if [ -f /etc/init.d/functions ]; then
 	. /etc/init.d/functions
