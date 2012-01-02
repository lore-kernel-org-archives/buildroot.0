From: Mahanteshwari Hiremath <Mahanteshwari.Hiremath@lnties.com>
Date: Mon, 2 Jan 2012 11:02:24 +0000
Subject: [Buildroot] Different runlevels support
Message-ID: <1F383CDA589639468828C7E2B75EDE9D096DE3C1@POCITMSEXMB03.LntUniverse.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    Can anyone tell me buildrrot sysvinit inittab supports for how many runlevels?
as I can only able to see runlevel1 in the inittab provided by sysvinit and works fine. If it supports for all, tell me what are the necessary changes or selections i have to do to get all runlevels, as i want to enable full multiuser mode with x11 login(runlevel 5). This is my generated inittab after selecting and building for sysvinit.






# /etc/inittab
#
# This inittab is a basic inittab sample for sysvinit, which mimics
# Buildroot's default inittab for Busybox.
id:1:initdefault:

proc::sysinit:/bin/mount -t proc proc /proc
rwmo::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
dpts::sysinit:/bin/mkdir -p /dev/pts
moun::sysinit:/bin/mount -a
host::sysinit:/bin/hostname -F /etc/hostname
init::sysinit:/etc/init.d/rcS

1:1:respawn:/sbin/getty 38400 tty1
2:1:respawn:/sbin/getty 38400 tty2

S0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

# Logging junk
mess::sysinit:/bin/touch /var/log/messages
sysl:1:respawn:/sbin/syslogd -n -m 0
klog:1:respawn:/sbin/klogd -n

# Stuff to do for the 3-finger salute
rebo::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
sklo:6:wait:/usr/bin/killall klogd
ssys:6:wait:/usr/bin/killall syslogd
umou:6:wait:/bin/umount -a -r
swap:6:wait:/sbin/swapoff -a
~







Regards,
Mahanteshwari Hiremath.


Larsen & Toubro Limited

www.larsentoubro.com

This Email may contain confidential or privileged information for the intended recipient (s) If you are not the intended recipient, please do not use or disseminate the information, notify the sender and delete it from your system.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120102/28f3d8c5/attachment-0001.html>
