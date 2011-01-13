From: Kyle Hayes <kyle@greenmonitor.com>
Date: Thu, 13 Jan 2011 13:29:42 -0800
Subject: [Buildroot] ssh-keygen seg fault
Message-ID: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am getting a seg fault when ssh-keygen tries to run and when sshd
tries to start.  Here is my set up:

Buildroot: GIT checkout from 1/11/11
Kernel: 2.6.37
Initrd type: CPIO/gzip

machine: DMP eBox 3100 (PC-compatible x86 machine w/256MB of RAM)

I've got extlinux installed, the kernel boots fine and I get a login
prompt.  However, I see errors that ssh-keygen and sshd are seg
faulting.

This is my first attempt at using Buildroot, so I have not done any
tweaking at all to the templates.   The only changes I have made were
to the Buildroot configuration to specify the CPIO/gzip format for the
initrd and to turn off nearly everything (I want a very small build).
I am using uLibc and busybox with shared libraries.  I selected
openssh and at as new packages.  at seems to run fine.

I've configured Buildroot for i486 processors (that is close enough to
the DMP's Vortext86DX in the machine).  The tool chain appears to work
fine.

The kernel is standard or whatever Buildroot loads when you select
2.6.37.  I have turned off loadable modules and turned on devtmpfs and
selected mounting devtmpfs at boot.

When I run mdev -s manually all the right devices are created and I
can mount the CF card that the thing booted from, so I think I've got
most things working (no sign of the Ethernet device though).

I would appreciate any tips on how to debug/fix this.  Buildroot is
exactly the system I was looking for.

Best,
Kyle
