From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Thu, 3 Jun 2010 22:08:17 +0000 (GMT)
Subject: [Buildroot] buildroot and sh4
Message-ID: <618052.82706.qm@web23107.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I've done a little doc about building an image for sh4 with buildroot and run it 
with qemu. As you could see, it's quite trivial, except the option for the compiler, 
and option for qemu.

1) get builroot source
git clone git://git.buildroot.net/buildroot

2) go in buildroot directory
cd buildroot

3) configure builroot
run : make menuconfig 
and set :
Target Architecture => superh
Target Architecure variant => sh4
Target options => nothing to change
Build options => nothing to change
Toolchain => 
??? GCC compiler Version => 4.4.x
??? Additionnal gcc options => --with-multilib-list=m4,m4-nofpu
??? Enable multilib support => yes
Package Section for the target => nothing to change
Target filesystem options => nothing to change
Bootloader => no
Kernel =>
??? Kernel type => linux (advanced configuration)
??? Linux kernel version => The latest stable Linux kernel (2.6.33.4)
??? Patches => nothing to change
??? Linux Kernel Configuration => nothing to change
??? kernel binary format => zImage
??? Destination for linux kernel binaries => nothing to change

4) compile buildroot
make all

as kernel config file, use this one :
config_2_6_33_4_sh.txt

5) run qemu

qemu-system-sh4 -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide,format=raw -append root=/dev/sda console=tty0 console=ttySC1,115200 noiotrap 


the config file can be found here : http://www.zarb.org/~trem/sh/
there are 2 files :
- install_br_sh4.txt : this little doc
- config_2_6_33_4_sh.txt : configuration for a kernel 2.6.33.4 on sh4


I hope this little doc will be usefull, and I'll be pleased to get feedback,
trem





      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100603/5154f468/attachment.html>
