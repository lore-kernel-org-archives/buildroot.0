From: Mahanteshwari Hiremath <Mahanteshwari.Hiremath@lnties.com>
Date: Tue, 3 Jan 2012 05:02:58 +0000
Subject: [Buildroot] Different runlevels support
In-Reply-To: <CALR4fEKNQp=Ee=V0WQAqeYjE_L5E9Rr=QALLtuUuUhz=wFKEnA@mail.gmail.com>
References: <1F383CDA589639468828C7E2B75EDE9D096DE3C1@POCITMSEXMB03.LntUniverse.com>,
 <CALR4fEKNQp=Ee=V0WQAqeYjE_L5E9Rr=QALLtuUuUhz=wFKEnA@mail.gmail.com>
Message-ID: <1F383CDA589639468828C7E2B75EDE9D096DE461@POCITMSEXMB03.LntUniverse.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>Busybox's init does not support run levels. All scripts are executed always.

>>Are you sure you are running sysv init and not busybox?

Hi,
Yes I am using sysv init not busy box, I have completely disabled init utilities in busybox and enabled sysvinit.
 And the contets of the sysvinit generated inittab are like this,


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


can u tell what else to do next to get all other runlevels.



Regards,
Mahanteshwari.


Larsen & Toubro Limited

www.larsentoubro.com

This Email may contain confidential or privileged information for the intended recipient (s) If you are not the intended recipient, please do not use or disseminate the information, notify the sender and delete it from your system.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120103/214fbfe7/attachment.html>
