From: Andrew Wiley <debio264@gmail.com>
Date: Tue, 30 Dec 2008 17:20:35 -0600
Subject: [Buildroot] Can't Login to New System
Message-ID: <ecbbfeda0812301520k69461096nbb27f0c5ca65c11@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying to get a linux system running on a Qwerk, which is
basically a nicely packaged Cirrus Labs EDB9302. I can use buildroot
to get a root filesystem, and use the cross compiler in buildroot's
staging directory to build a working kernel, and the system will boot,
but when I go to login, I just get another login prompt, as you can
see below:
RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 120K



Welcome to the Erik's uClibc development environment.
uclibc login: root



Welcome to the Erik's uClibc development environment.
uclibc login: default



Welcome to the Erik's uClibc development environment.
uclibc login:

As you can see, I didn't change the login message or anything. All
I've done to the root filesystem is moved /dev from an out of date
(but working) root to buildroot's root. As far as I can tell, this has
caused no problems. The lines in /etc/inittab that start the getty you
see here are:

# Put a getty on the serial port
ttyAM0::respawn:/sbin/getty -L ttyAM0 57600 vt100

ttyAM0 is a serial port.
I haven't changed /etc/passwd and /etc/shadow from the defaults that
buildroot makes. The defaults are to create a user called default and
give that user and the root user no password, right?
I'm either misinterpreting how I should log in, or something is wrong
with my system.
I'm not sure if I should post my buildroot config. I'm really
desperate to resolve this (I'm so close!), and any help would be
greatly appreciated.

Andrew Wiley
