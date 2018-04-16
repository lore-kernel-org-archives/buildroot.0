From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 23:29:20 -0300
Subject: [Buildroot] [PATCH 02/26] dbus: don't test if the binary exists in
 the init script
In-Reply-To: <20180416022944.13644-1-casantos@datacom.ind.br>
References: <20180416022944.13644-1-casantos@datacom.ind.br>
Message-ID: <20180416022944.13644-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/dbus/S30dbus | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
index b4bcf9c7aa..52646cea2f 100644
--- a/package/dbus/S30dbus
+++ b/package/dbus/S30dbus
@@ -10,9 +10,6 @@
 # pidfile: /var/run/messagebus.pid
 #
 
-# Sanity checks.
-[ -x /usr/bin/dbus-daemon ] || exit 0
-
 # Create needed directories.
 [ -d /var/run/dbus ] || mkdir -p /var/run/dbus
 [ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
-- 
2.14.3
