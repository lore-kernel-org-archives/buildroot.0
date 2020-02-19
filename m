From: Whitney, Scott <scwhitn@amazon.com>
Date: Wed, 19 Feb 2020 14:25:17 +0000
Subject: [Buildroot] Overlay not using a merged /usr?
Message-ID: <1582122316810.2357@amazon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildroot community,


I am working with a TI AM6548 SoC, and need to add some firmware (.elf) files so that they will end up in /lib/firmware/ti-pruss.  These files get loaded into some special cores within the SoC to create additional Ethernet ports.


I am using a Buildroot overlay with BR2_EXTERNAL, and tried to add the files under rootfs-overlay/lib/firmware/ti-pruss, i.e.:


scwhitn at ud9a5a686d6f756:~/Projects/AR_Reflex3_Buildroot/overlay/board/control-carrier/rootfs-overlay$ ls lib/firmware/ti-pruss
am65x-pru0-prueth-fw.elf  am65x-rtu0-prueth-fw.elf
am65x-pru1-prueth-fw.elf  am65x-rtu1-prueth-fw.elf


However, when I run make, I get the following error, and I'm not sure how to resolve it:


>>>   Sanity check in overlay /home/local/ANT/scwhitn/Projects/AR_Reflex3_Buildroot/overlay/board/control-carrier/rootfs-overlay
ERROR: The overlay in /home/local/ANT/scwhitn/Projects/AR_Reflex3_Buildroot/overlay/board/control-carrier/rootfs-overlay is not using a merged /usr for the following directories: /lib
Makefile:738: recipe for target 'target-finalize' failed
make: *** [target-finalize] Error 1


I'm not even sure what this message means, or how to fix it.  At the moment, the only "user" we really have is root.


Can someone explain how to add these files so that they will show up in /lib/firmware/ti-pruss/*.elf without errors?


I'm using buildroot-2019.02.6.  This is _urgent_; it's the last peripheral that we need to support before the project can be handed over to out client as complete.


Thanks for your help and understanding


Scott Whitney

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200219/d4303543/attachment.html>
