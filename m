From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:46 +0200
Subject: [Buildroot] [git commit] netplug: don't test if the binary exists
 in the init script
Message-ID: <20180416053718.4828288325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b77c9d265ed678ec6c0ad9c1e1e5c6ada7206ced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netplug/S29netplug | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
index d3df9ddff5..03422499d6 100755
--- a/package/netplug/S29netplug
+++ b/package/netplug/S29netplug
@@ -32,8 +32,6 @@ elif [ ! -f /etc/network/interfaces ]; then
 	exit 0
 fi
 
-[ -x /sbin/netplugd ] || exit 0
-
 if [ -f /etc/sysconfig/netplugd ]; then
     . /etc/sysconfig/netplugd
 fi
