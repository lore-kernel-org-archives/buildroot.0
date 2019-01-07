From: David Picard <dplamp@gmx.com>
Date: Mon, 7 Jan 2019 10:36:15 +0100
Subject: [Buildroot] Grub2 can't find /dev/sda1
Message-ID: <702b67a9-8725-8fd8-5642-8a6d896e388a@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Platform : i386 with BIOS, PC/104, CompactFlash card

I generated an image to boot with Grub2. I used the genimage config in 
buildroot/board/pc. I could test it successfully with QEMU (I just 
change /dev/sda1 to /dev/vda1 at boot prompt).

However, I can't boot on the real board. The boot process hang with 
"Waiting for root device /dev/sda1". When I type "set" in the grub 
shell, I get (among other things) :
grub_cpu=i386
grub_platform=pc
prefix=(hd0,msdos1)/boot/grub
root=hd0,msdos1

Any idea ?
