From: Stefan Feilmeier <stefan@deeproot.co.in>
Date: Wed, 14 Mar 2007 08:34:59 +0530
Subject: [Buildroot] hardware detection
Message-ID: <1173841499.5844.11.camel@stefan-nb.feilmeier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

First of all buildroot is a really useful tool and we use it to build
the initial system for our install cd. The only problem is that I am
stuck on hardware detection. I am trying to store my kernel modules on
the cd and mount it during boot process to keep my initrd small. Modules
for the cdrom drive are compiled into the kernel. This is what I do
currently: 

1. Boot initrd
2. /etc/init.d/S10udev starts udev and populates /dev
3. Mount cdrom(s) on /mnt/cdrom/
4. Mount --bind /lib/modules

Till here everything works just fine and the modules are accessible
in /lib/modules. Now I try to run `udevtrigger` but it doesn't detect my
network card. Loading the module manually with `modprobe pcnet32` works
fine. I am trying this in a VMware virtual machine.

Does anybody have a hint for me?

Regards,
Stefan
DeepRoot Linux
