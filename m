From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 20:29:25 +0100
Subject: [Buildroot] [git commit] busybox: udhcpc script: create resolv.conf
Message-ID: <20140115200932.5B8C99C4EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f70de3485947f290926b0ce8e6de648a4259bcc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Eliminate the following error message on every boot:

grep: /etc/resolv.conf: No such file or directory

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 43742fb..9e08dad 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -5,6 +5,7 @@
 [ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
 
 RESOLV_CONF="/etc/resolv.conf"
+[ -e $RESOLV_CONF ] || touch $RESOLV_CONF
 [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
 [ -n "$subnet" ] && NETMASK="netmask $subnet"
 
