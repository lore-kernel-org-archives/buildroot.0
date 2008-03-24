From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 24 Mar 2008 07:25:39 +0000
Subject: [Buildroot] rpm & buildroot
Message-ID: <1206343539.3605.1.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

I'm working on adding rpm to buildroot and after 3 days of working and
hacking rpm to be uclibc compatible I've got this problem...

Is it obvious what I"m doing wrong or something I can do to track this
issue further?

# rpm
argc=1 argv=0xbff8dc74 envp=0xbff8dc7c
ELF header=0xb7f90000
First Dynamic section entry=0xb7f9aefc
Scanning DYNAMIC section
Done scanning DYNAMIC section
About to do library loader relocations
Done relocating ldso; we can now use globals and make function calls!
_dl_get_ready_to_run:169: Cool, ldso survived making function calls
_dl_get_ready_to_run:261: Position Independent Executable:
app_tpnt->loadaddr=0x80000000
_dl_malloc:892: mmapping more memory
_dl_get_ready_to_run:340: Lib Loader: (0xb7f90000) /lib/ld-uClibc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7f1e000) /usr/lib/librpm-4.4.so
_dl_get_ready_to_run:609: Loading: (0xb7dd4000) /usr/lib/librpmdb-4.4.so
_dl_get_ready_to_run:609: Loading: (0xb7d4b000) /usr/lib/librpmio-4.4.so
_dl_get_ready_to_run:609: Loading: (0xb7d45000) /usr/lib/libpopt.so.0
_dl_get_ready_to_run:609: Loading:
(0xb7d10000) /usr/lib/libbeecrypt.so.6
_dl_get_ready_to_run:609: Loading: (0xb7cfb000) /usr/lib/libneon.so.25
_dl_get_ready_to_run:609: Loading: (0xb7cda000) /usr/lib/libexpat.so.1
_dl_get_ready_to_run:609: Loading: (0xb7cc9000) /lib/libm.so.0
_dl_get_ready_to_run:609: Loading: (0xb7cc4000) /lib/libdl.so.0
_dl_get_ready_to_run:609: Loading: (0xb7cb4000) /usr/lib/libz.so.1
_dl_get_ready_to_run:609: Loading: (0xb7c9e000) /lib/libpthread.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7dd4000) /usr/lib/librpmdb-4.4.so
_dl_get_ready_to_run:609: Loading: (0xb7d4b000) /usr/lib/librpmio-4.4.so
_dl_get_ready_to_run:609: Loading: (0xb7d45000) /usr/lib/libpopt.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7d4b000) /usr/lib/librpmio-4.4.so
_dl_get_ready_to_run:609: Loading: (0xb7d45000) /usr/lib/libpopt.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c9e000) /lib/libpthread.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading:
(0xb7d10000) /usr/lib/libbeecrypt.so.6
_dl_get_ready_to_run:609: Loading: (0xb7cfb000) /usr/lib/libneon.so.25
_dl_get_ready_to_run:609: Loading: (0xb7cc9000) /lib/libm.so.0
_dl_get_ready_to_run:609: Loading: (0xb7cc4000) /lib/libdl.so.0
_dl_get_ready_to_run:609: Loading: (0xb7cb4000) /usr/lib/libz.so.1
_dl_get_ready_to_run:609: Loading: (0xb7c9e000) /lib/libpthread.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c9e000) /lib/libpthread.so.0
_dl_get_ready_to_run:609: Loading: (0xb7cc4000) /lib/libdl.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7cb4000) /usr/lib/libz.so.1
_dl_get_ready_to_run:609: Loading: (0xb7cda000) /usr/lib/libexpat.so.1
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:609: Loading: (0xb7c39000) /lib/libc.so.0
_dl_get_ready_to_run:736: Beginning relocation fixups
Segmentation fault

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080324/b43c367a/attachment.pgp 
