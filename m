From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:19 -0300
Subject: [Buildroot] [PATCH 01/26] bind: don't test if the binary exists in
 the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/bind/S81named | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bind/S81named b/package/bind/S81named
index bc4bb0f246..1da3008ae2 100644
--- a/package/bind/S81named
+++ b/package/bind/S81named
@@ -3,7 +3,6 @@
 CONFIG=/etc/bind/named.conf
 DAEMON=/usr/sbin/named
 
-[ -x $DAEMON ] || exit 0
 [ -f $CONFIG ] || exit 0
 
 case "$1" in
-- 
2.14.3
