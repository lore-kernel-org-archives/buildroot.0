From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:24:40 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] netplug: don't test if
 the binary exists in the init script
Message-ID: <20180617155626.42D7281070@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e357711fa74b62a8c5f0e46cc6cc133ef4955633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b77c9d265ed678ec6c0ad9c1e1e5c6ada7206ced)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
