From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:36 +0200
Subject: [Buildroot] [git commit] dhcpcd: don't test if the binary exists in
 the init script
Message-ID: <20180416053717.A288580F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48e688ac16c03a313e7446be4f9ac7b57ab6caf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcpcd/S41dhcpcd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
index a2e87ca054..3e5c22f715 100755
--- a/package/dhcpcd/S41dhcpcd
+++ b/package/dhcpcd/S41dhcpcd
@@ -7,7 +7,6 @@ DAEMON=/sbin/dhcpcd
 CONFIG=/etc/dhcpcd.conf
 PIDFILE=/var/run/dhcpcd.pid
 
-[ -x $DAEMON ] || exit 0
 [ -f $CONFIG ] || exit 0
 
 case "$1" in
