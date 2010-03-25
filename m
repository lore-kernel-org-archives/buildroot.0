From: sunr2007 <ravilinux4u@gmail.com>
Date: Thu, 25 Mar 2010 11:11:36 -0700 (PDT)
Subject: [Buildroot]  unable to login to buildroot
Message-ID: <28032853.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,
i built a jffs2 filesystem by using make at91sam9261ek_config for
buildroot.2010.02 . everything went fine 
but im unable to login on to my target board :(

when i type root and press enter 
it is redirecting me back to the login

 and when i press any other name , it asks for password but again come back
to login when i press enter 



"Welcome to Buildroot

buildroot login: root


Welcome to Buildroot

buildroot login: ravi
Password: 


Welcome to Buildroot

buildroot login: "


below is my /etc/inittab file  any idea what might be wrong?

# /etc/inittab
#
# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
#
# Note: BusyBox init doesn't support runlevels.  The runlevels field is
# completely ignored by BusyBox init. If you want runlevels, use
# sysvinit.
#
# Format for each entry: <id>:<runlevels>:<action>:<process>
#
# id        == tty to run on, or empty for /dev/console
# runlevels == ignored
# action    == one of sysinit, respawn, askfirst, wait, and once
# process   == program to run

# Startup the system
null::sysinit:/bin/mount -o remount,rw /
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mount -a
null::sysinit:/bin/hostname -F /etc/hostname
null::sysinit:/sbin/ifconfig lo 127.0.0.1 up
null::sysinit:/sbin/route add -net 127.0.0.0 netmask 255.0.0.0 lo
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Set up a couple of getty's
#tty1::respawn:/sbin/getty 38400 tty1
#tty2::respawn:/sbin/getty 38400 tty2

# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100


# Logging junk
null::sysinit:/bin/touch /var/log/messages
null::respawn:/sbin/syslogd -n -m 0
null::respawn:/sbin/klogd -n
tty3::respawn:/usr/bin/tail -f /var/log/messages

# Stuff to do for the 3-finger salute
::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
null::shutdown:/usr/bin/killall klogd
null::shutdown:/usr/bin/killall syslogd
null::shutdown:/bin/umount -a -r
null::shutdown:/sbin/swapoff -a

any idea what is wrong ? how to debug this?
warm regards,
Ravi Kulkarni.

-- 
View this message in context: http://old.nabble.com/unable-to-login-to-buildroot-tp28032853p28032853.html
Sent from the BuildRoot mailing list archive at Nabble.com.
