From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:26 -0300
Subject: [Buildroot] [PATCH 08/26] modem-manager: don't test if the binary
 exists in the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-9-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Drop the MODEMMANAGER_BIN variable, which was never initialized.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/modem-manager/S44modem-manager | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/modem-manager/S44modem-manager b/package/modem-manager/S44modem-manager
index cf6d89601d..a3f5003aa1 100755
--- a/package/modem-manager/S44modem-manager
+++ b/package/modem-manager/S44modem-manager
@@ -5,8 +5,6 @@
 
 PIDFILE=/var/run/ModemManager.pid
 
-[ -x $MODEMMANAGER_BIN ] || exit 0
-
 start() {
 	printf "Starting ModemManager: "
 	umask 077
-- 
2.14.3
