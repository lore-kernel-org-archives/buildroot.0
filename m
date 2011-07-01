From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  1 Jul 2011 09:38:51 +0200
Subject: [Buildroot] [PATCH] fs/skeleton: remove useless logging from inittab
Message-ID: <1309505931-31799-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the default inittab launches a "tail -f /var/log/messages" that
remains active during the entire target uptime.
For most embedded systems this is a useless waste of resources, so remove it.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 fs/skeleton/etc/inittab |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index b1e5c16..3d0fa5e 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -29,7 +29,6 @@ null::sysinit:/bin/hostname -F /etc/hostname
 null::sysinit:/bin/touch /var/log/messages
 null::respawn:/sbin/syslogd -n -m 0
 null::respawn:/sbin/klogd -n
-tty3::respawn:/usr/bin/tail -f /var/log/messages
 
 # Stuff to do for the 3-finger salute
 ::ctrlaltdel:/sbin/reboot
-- 
1.7.4.1
