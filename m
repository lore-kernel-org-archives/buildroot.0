From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jun 2010 13:38:58 +0200
Subject: [Buildroot] [git commit master 1/1] skeleton: remove loopback
	interface configuration from inittab
Message-ID: <20100609113925.0C3E87FEB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8dad77bac4a027ede5ea95400dbf5c8131bbf635
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The lo interface is marked auto in /etc/network/interfaces, so the
configuration of the loopback network interface is part of the
S40network init script. This causes the "RTNETLINK answers: File exists" error
message to appear at startup time.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../Atmel/root/target_busybox_skeleton/etc/inittab |    2 --
 .../device/Atmel/root/target_skeleton/etc/inittab  |    2 --
 target/device/xtensa/skeleton-patch/etc/inittab    |    2 --
 target/generic/target_busybox_skeleton/etc/inittab |    2 --
 target/generic/target_skeleton/etc/inittab         |    2 --
 5 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/target/device/Atmel/root/target_busybox_skeleton/etc/inittab b/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
index bb18305..b394548 100644
--- a/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
+++ b/target/device/Atmel/root/target_busybox_skeleton/etc/inittab
@@ -24,8 +24,6 @@
 ::sysinit:/bin/mount -o remount,rw /
 ::sysinit:/bin/mount -a
 ::sysinit:/bin/hostname -F /etc/hostname
-::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
diff --git a/target/device/Atmel/root/target_skeleton/etc/inittab b/target/device/Atmel/root/target_skeleton/etc/inittab
index 69e4df1..2e3b9a4 100644
--- a/target/device/Atmel/root/target_skeleton/etc/inittab
+++ b/target/device/Atmel/root/target_skeleton/etc/inittab
@@ -18,8 +18,6 @@ null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
-null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
diff --git a/target/device/xtensa/skeleton-patch/etc/inittab b/target/device/xtensa/skeleton-patch/etc/inittab
index b336ff6..de3ce70 100644
--- a/target/device/xtensa/skeleton-patch/etc/inittab
+++ b/target/device/xtensa/skeleton-patch/etc/inittab
@@ -18,8 +18,6 @@ null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mount -o remount,rw /
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
-null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
diff --git a/target/generic/target_busybox_skeleton/etc/inittab b/target/generic/target_busybox_skeleton/etc/inittab
index 7c7bf7a..bd3912b 100644
--- a/target/generic/target_busybox_skeleton/etc/inittab
+++ b/target/generic/target_busybox_skeleton/etc/inittab
@@ -24,8 +24,6 @@
 ::sysinit:/bin/mount -o remount,rw /
 ::sysinit:/bin/mount -a
 ::sysinit:/bin/hostname -F /etc/hostname
-::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
diff --git a/target/generic/target_skeleton/etc/inittab b/target/generic/target_skeleton/etc/inittab
index 2949c91..4be14b8 100644
--- a/target/generic/target_skeleton/etc/inittab
+++ b/target/generic/target_skeleton/etc/inittab
@@ -19,8 +19,6 @@ null::sysinit:/bin/mount -t proc proc /proc
 null::sysinit:/bin/mkdir -p /dev/pts
 null::sysinit:/bin/mount -a
 null::sysinit:/bin/hostname -F /etc/hostname
-null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
-null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
-- 
1.7.1
