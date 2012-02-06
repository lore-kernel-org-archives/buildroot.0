From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 6 Feb 2012 16:04:24 +0100
Subject: [Buildroot] kernel boot problem
Message-ID: <7E2C5DAB2B124E0C900A527EE0EF019C@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I receive this on the console when my system boots:

When i build the same kernel (same version ,same patches and same kernel config )
With 2011.11 : panic !
With 2010.02 : ok 

Kernel 2.6.31.9 ,build with gcc 4.5.3 

Any idea (both are build in OABI but EABI yields same problem)?

snip
.... 
sd 0:0:0:0: [sda] Assuming drive cache: write through
 sda: sda1 < sda5 > sda2
sd 0:0:0:0: [sda] Assuming drive cache: write through
sd 0:0:0:0: [sda] Attached SCSI removable disk
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem) on device 8:5.
Freeing init memory: 112K
BUG: Bad page state in process init  pfn:204b6
page:c04086c0 flags:00000400 count:1 mapcount:0 mapping:(null) index:0
[<c002a748>] (unwind_backtrace+0x0/0xd0) from [<c006b5fc>] (bad_page+0x104/0x138)
[<c006b5fc>] (bad_page+0x104/0x138) from [<c006d1c4>] (get_page_from_freelist+0x344/0x470)
[<c006d1c4>] (get_page_from_freelist+0x344/0x470) from [<c006d3d8>] (__alloc_pages_nodemask+0xe8/0x518)
[<c006d3d8>] (__alloc_pages_nodemask+0xe8/0x518) from [<c006fa08>] (__do_page_cache_readahead+0x114/0x260)[<c006fa08>]
(__do_page_cache_readahead+0x114/0x260) from [<c006fdbc>] (ra_submit+0x20/0x24)
[<c006fdbc>] (ra_submit+0x20/0x24) from [<c0067e8c>] (filemap_fault+0x1f0/0x434)
 
[<c0067e8c>] (filemap_fault+0x1f0/0x434) from [<c007a128>] (__do_fault+0x50/0x404)
 
This is from the one build in 2010.02 and is OK

Snip
...
sd 0:0:0:0: [sda] Assuming drive cache: write through
 sda: sda1 < sda5 > sda2
sd 0:0:0:0: [sda] Assuming drive cache: write through
sd 0:0:0:0: [sda] Attached SCSI removable disk
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem) on device 8:5.
Freeing init memory: 120K
init started: BusyBox v1.15.3 (2010-04-30 12:24:59 CEST)
UBIFS error (pid 348): ubifs_get_sb: cannot open "ubi0:data", error -19
starting pid 352, tty '': '/etc/init.d/rcS'
Populating /dev using udev: done
Starting portmap: done
Initializing random number generator... done.
Starting network...
ifconfig: SIOCGIFFLAGS: No such device
Starting dropbear sshd: OK
Starting inetd : OK
sucses 0 adding beeper0
doing timer start
Major =251
sucses 0 adding oled0
OLED: Loaded
....
 


Sagaert Johan
