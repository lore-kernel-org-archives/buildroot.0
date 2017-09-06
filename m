From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 14:51:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/netplug: init
	script create needed lock directory
Message-ID: <20170906124611.0F8A17FD51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6a90941032547c102b37add8f6cdfb3835086fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Init script use /var/lock/subsys/netplugd but directory
/var/lock/subsys can be missing.

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c81c6d8f3d5bdf1825acaa27428c9e25def48593)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
