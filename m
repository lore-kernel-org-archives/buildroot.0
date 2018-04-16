From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:21 -0300
Subject: [Buildroot] [PATCH 03/26] dhcpcd: don't test if the binary exists
 in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-4-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
-- 
2.14.3
