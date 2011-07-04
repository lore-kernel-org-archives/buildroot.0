From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jul 2011 21:44:28 +0200
Subject: [Buildroot] [git commit] skeleton: inittab: remove
	/var/log/messages log on tty3
Message-ID: <20110704194605.A1CE988D79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=348e07c88d4c79e78b26dab3745f75da2c2d6b9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hardcodes policy, is not critical, and people might not have tty3
(E.G. virtual consoles) available.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/inittab |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index 191c525..4f3bb96 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -26,10 +26,6 @@ null::sysinit:/bin/hostname -F /etc/hostname
 # Put a getty on the serial port
 #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
-# Logging junk
-null::sysinit:/bin/touch /var/log/messages
-tty3::respawn:/usr/bin/tail -f /var/log/messages
-
 # Stuff to do for the 3-finger salute
 ::ctrlaltdel:/sbin/reboot
 
-- 
1.7.3.4
