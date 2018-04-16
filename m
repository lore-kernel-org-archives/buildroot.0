From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:34 +0200
Subject: [Buildroot] [git commit] dbus: don't test if the binary exists in
 the init script
Message-ID: <20180416053717.8C0D080F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7183a0eff9d1d2190b257b5d5cdc54f4cb6b00a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits without any error if the
binary doesn't exist, which is silly.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
