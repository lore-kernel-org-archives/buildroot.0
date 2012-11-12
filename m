From: Joe Lorenz <joe.lorenz@plexxi.com>
Date: Mon, 12 Nov 2012 17:45:21 -0500
Subject: [Buildroot] grub problems since upgrading build host to CentOS 6.3
Message-ID: <50A17C01.1010109@plexxi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We updated our build host to CentOS 6.3 which apparently has a newer host gcc.

Our crosstools are set for x86_64 target, and we know about grub not being 
supported for 64-bit compiler (Bug 5024). This newer gcc and/or binutils might 
be to blame.

The problem shows when we try to install it - we see this:

grub> device (hd0) /dev/sdb
grub>     root (hd0,1)
  Filesystem type is ext2fs, partition type 0x83
grub>     setup (hd0)
  Checking if "/boot/grub/stage1" exists... no
  Checking if "/grub/stage1" exists... no

Error 15: File not found
grub>

But 'stage1' and all the others are indeed present on the root partition at 
/boot/grub/.

It's important to us to be able to build grub as needed in case we have to 
modify any networking hardware support, so falling back to using older binaries 
is not optimal. We're wondering if anyone else has gotten around this in a 
CentOS 6.3 build environment.

	-Joe
