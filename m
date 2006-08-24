From: =?gb2312?B?u8bH7A==?= <hqin@21cn.com>
Date: Thu, 24 Aug 2006 21:54:09 +0800
Subject: [Buildroot] about buildroot init
Message-ID: <IIEAIBGJEBPAKHDPCEENKEMJCKAA.hqin@21cn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
  I use buildroot for ixp425 & MPC8280,I get some troubles.
  I make rootfs.powerpc.ext2.gz,and use it for ixp425 & mpc8280 ramdisk.
  When linux uncompress ramdisk.gz,exec init,then system halt

if del /sbin/init ,then I can direct enter bash ,so I think that is init's promble.

 buybox default configure
 Init Utilities  ---> 
  x x [*] init                                                            x x   
  x x [*]   debugging aid                                                 x x   
  x x [*]   Support reading an inittab file                               x x   
  x x [ ]   Support running commands with a controlling-tty               x x   
  x x [ ]   Be _extra_ quiet on boot                                      x x   
  x x [ ]   Support dumping core for child processes (debugging only)     x x   
  x x [ ]   Support running init from within an initrd (not initramfs)    x x   
  x x [*] poweroff, halt, and reboot                                      x x   
  x x [ ] mesg    

.....
Freeing unused kernel memory: 64k init
init started:  BusyBox v1.2.0 (2006.08.23-09:44+0000) multi-call binary
command='/bin/mount -o remount,rw /' action='1' terminal='/dev/null'
Initializing random number generator... done.
Starting network...
/etc/init.d/dhcp-relay not yet configured! - Aborting... 

Then system is halt!


I try to this confiure
 buybox configure
 Init Utilities  ---> 
  x x [*] init                                                            
  x x [*]   debugging aid                                                 
  x x [ ]   Support reading an inittab file             // I unselect this item
  x x [ ]   Support running commands with a controlling-tty              
  x x [ ]   Be _extra_ quiet on boot                                      
  x x [ ]   Support dumping core for child processes (debugging only)     
  x x [ ]   Support running init from within an initrd (not initramfs)    
  x x [*] poweroff, halt, and reboot                                      
  x x [ ] mesg    
.....
Freeing unused kernel memory: 64k init
init started:  BusyBox v1.2.0 (2006.08.23-09:44+0000) multi-call binary
command='/bin/mount -o remount,rw /' action='1' terminal='/dev/null'
Initializing random number generator... done.
Starting network...
/etc/init.d/dhcp-relay not yet configured! - Aborting...
Please press Enter to activate this console.
#

my environment
1) MPC8280 & IXP425  hardware is OK
2)if mpc8280 use MontaVista's rootfs ,it work OK,and if ixp425 use snapgear build ramdisk.gz ,It work ok,too.
3)buildroot version is 2006-8-17 snapshot,gcc is 4.0.3,linux-kernel include 2.4.31,binutils 2.16.1,uClibc & busybox is snapshot 2006-08-17
4)mpc8280 zImage: linux kernel version is 2.4.26 ,IXP425 zImage:linux kernel version 2.4.27

  so please guide me how to resolve this issue

Thanks

Ken Huang
