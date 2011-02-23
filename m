From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Wed, 23 Feb 2011 18:03:40 +0100
Subject: [Buildroot] Changing from NFS root filesystem to embedded within
	kernel
Message-ID: <201102231803.41162.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
It's probably a simple question, but I'm a bit confused by what I found 
searching this question.
I have a buildroot system which currently boots remotely via DHCP+NFS.
The following is both in the dts file and as the kernel parameter line:
console=ttyUL0,115200 rw root=/dev/nfs ip=bootp

Now I would like to package the kernel with the filesystem embedded in it. 
That's what initramfs is for, right ?

In buildroot, I generated a CPIO filesystem, and in the kernel compile options 
I told it to use that file as an initramfs.

Now all I need is to change the kernel parameter line, right ? What's the 
syntax ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/Antarctica/
