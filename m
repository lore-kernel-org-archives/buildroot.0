From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 09:58:37 +0200
Subject: [Buildroot] [git commit] netplug: look for init script
 configurations in /etc/default/
Message-ID: <20180605075721.F2D0280404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4adaa581b27dc27298eb7cc421ee8f530f88e18e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are working to make all sysvinit scripts conformant to a pattern and
/etc/default/ seems to be a good choice, since 34 packages already get
optional configurations from files at that directory.

netplug still installs an init script at /etc/rc.d/init.d/.  This will
be fixed in a future patch that will refactor the init scripts.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netplug/S29netplug | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index 03422499d6..04cac9f07c 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -22,8 +22,8 @@ elif [ -f /etc/rc.d/init.d/functions ]; then
 fi
 
 # Source networking configuration.
-if [ -f /etc/sysconfig/network ]; then
-	. /etc/sysconfig/network
+if [ -f /etc/default/network ]; then
+	. /etc/default/network
 
 	# Check that networking is up.
 	[ ${NETWORKING} = "no" ] && exit 0
@@ -32,8 +32,8 @@ elif [ ! -f /etc/network/interfaces ]; then
 	exit 0
 fi
 
-if [ -f /etc/sysconfig/netplugd ]; then
-    . /etc/sysconfig/netplugd
+if [ -f /etc/default/netplugd ]; then
+    . /etc/default/netplugd
 fi
 
 # See how we were called.
