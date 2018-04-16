From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:41 -0300
Subject: [Buildroot] [PATCH 23/26] transmission: don't test if the binary
 exists in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-24-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/transmission/S92transmission | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
index e5976b0cfb..29d7cd5863 100644
--- a/package/transmission/S92transmission
+++ b/package/transmission/S92transmission
@@ -51,9 +51,6 @@ DAEMON=$(which $NAME)
 PIDFILE=/var/run/$NAME.pid
 SCRIPTNAME=/etc/init.d/$NAME
 
-# Exit if the package is not installed
-[ -x "$DAEMON" ] || exit 0
-
 # Read configuration variable file if it is present
 [ -r /etc/default/$NAME ] && . /etc/default/$NAME
 
-- 
2.14.3
