From: elham abbaszade <k84.834@gmail.com>
Date: Sat, 11 May 2013 12:25:54 +0430
Subject: [Buildroot] GNU GRUB version 0.97 (0K lower / 0K upper memory)
Message-ID: <CAEiLu=Wj0wx3ZmS2jXg1yFh4=LnAjhzCR-SgUT5+e=mhD0w1+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi every body
I am new to buildroot.
I want to build a Linux with buildroot but I faced with some errors,
I have attached some needed Info-es.
(please open with Wordpad )
my problem is with grub.
first I cannot install grub on my hard, with searching in google I can
install grub on my hard with below patch:
810_all_grub-0.97-ext3_256byte_inode.patch
add-stage2-ldscripts.patch

but when I rebooting the system, grub halts and I can not do any thing,
what is showing on screen is "
GNU GRUB version 0.97 (0K lower / 0K upper memory)
[ Minimal BASH-like line editing is supported. For the first word, TAB
lists possible command completions. Anywhere else TAB lists the possible
completions of a device/filename. ]

can any one help me?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130511/1235c118/attachment-0001.html>
-------------- next part --------------
root at ubuntu:/home/ubuntu# cat /proc/meminfo 
MemTotal:         959420 kB
MemFree:           80732 kB
Buffers:           96044 kB
Cached:           479624 kB
SwapCached:            0 kB
Active:           396816 kB
Inactive:         433168 kB
Active(anon):     272172 kB
Inactive(anon):   136684 kB
Active(file):     124644 kB
Inactive(file):   296484 kB
Unevictable:           0 kB
Mlocked:               0 kB
HighTotal:         68488 kB
HighFree:            976 kB
LowTotal:         890932 kB
LowFree:           79756 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:        254352 kB
Mapped:            94064 kB
Shmem:            154524 kB
Slab:              32480 kB
SReclaimable:      21704 kB
SUnreclaim:        10776 kB
KernelStack:        2512 kB
PageTables:         6128 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      479708 kB
Committed_AS:    1941452 kB
VmallocTotal:     122880 kB
VmallocUsed:        3224 kB
VmallocChunk:      89984 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
DirectMap4k:       26616 kB
DirectMap2M:      886784 kB
root at ubuntu:/home/ubuntu# cat /proc/cpuinfo 
processor	: 0
vendor_id	: CentaurHauls
cpu family	: 6
model		: 13
model name	: VIA Eden Processor 1000MHz
stepping	: 0
cpu MHz		: 1000.000
cache size	: 128 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge cmov pat clflush acpi mmx fxsr sse sse2 tm nx up pni est tm2 xtpr rng rng_en ace ace_en ace2 ace2_en phe phe_en pmm pmm_en
bogomips	: 1994.99
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 32 bits virtual
power management:

root at ubuntu:/home/ubuntu# mount -v -t ext2 /dev/sda
sda   sda1  
root at ubuntu:/home/ubuntu# mount -v -t ext2 /dev/sda1 /mnt/buildroot
mount: mount point /mnt/buildroot does not exist
root at ubuntu:/home/ubuntu# mkdir /mnt/buildroot
root at ubuntu:/home/ubuntu# mount -v -t ext2 /dev/sda1 /mnt/buildroot
/dev/sda1 on /mnt/buildroot type ext2 (rw)
root at ubuntu:/home/ubuntu# cat /mnt/buildroot/boot/grub/menu.lst 
default=0
timeout=5
splashimage=(hd0,0)/boot/grub/splash.xpm.gz
hiddenmenu
title Buildroot
	root (hd0,0)
	kernel /boot/bzImage rw root=/dev/sda1 vga=791 
root at ubuntu:/home/ubuntu# ls /mnt/buildroot/
bin   dev  home  lib      lost+found  mnt  proc  run   sys  usr
boot  etc  init  linuxrc  media       opt  root  sbin  tmp  var
root at ubuntu:/home/ubuntu# ls /mnt/buildroot/boot/
bzImage  grub
root at ubuntu:/home/ubuntu# ls /mnt/buildroot/boot/grub/
e2fs_stage1_5     jfs_stage1_5       splash.xpm.gz  vstafs_stage1_5
fat_stage1_5      menu.lst           stage1         xfs_stage1_5
ffs_stage1_5      minix_stage1_5     stage2
iso9660_stage1_5  reiserfs_stage1_5  ufs2_stage1_5
root at ubuntu:/home/ubuntu# 
