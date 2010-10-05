From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  5 Oct 2010 04:11:24 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20101005041124.EA18B8B621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759

S?rgio <sergio@sergiomb.no-ip.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |

--- Comment #6 from S?rgio <sergio@sergiomb.no-ip.org>  ---
If I may reopen this bug, I mean serious, if you don't approve this reopen ,
please close it and please left a note on what I should do.  

I have a similar compile error but I have intl enabled, my Makefile misses a
"-lintl" . I use builroot from git on fedora13.x86_64 and try build to mipsel
arch. 

>>> sysstat 9.0.5 Building
PATH="/home/sergio/hardware/moviecube/buildroot/output/host/bin:/home/sergio/hardware/moviecube/buildroot/output/host/usr/bin:/home/sergio/hardware/moviecube/buildroot/output/host/usr/sbin/:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/local/sbin:/usr/sbin:/sbin:/home/sergio/bin"
PERLLIB="/home/sergio/hardware/moviecube/buildroot/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/home/sergio/hardware/moviecube/buildroot/output/build/sysstat-9.0.5/
make[1]: Entering directory
`/home/sergio/hardware/moviecube/buildroot/output/build/sysstat-9.0.5'
/home/sergio/hardware/moviecube/buildroot/output/staging/usr/bin/mipsel-unknown-linux-uclibc-gcc
--sysroot=/home/sergio/hardware/moviecube/buildroot/output/staging -o sadc -Os
-pipe -Os  -mtune=mips32r2 -mabi=32 -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/sergio/hardware/moviecube/buildroot/output/staging/usr/include
-I/home/sergio/hardware/moviecube/buildroot/output/staging/include -Wall
-Wstrict-prototypes -pipe -O2 sadc.o act_sadc.o sa_wrap.o sa_common.o
librdstats.a libsyscom.a -s
/home/sergio/hardware/moviecube/buildroot/output/staging/usr/bin/mipsel-unknown-linux-uclibc-gcc
--sysroot=/home/sergio/hardware/moviecube/buildroot/output/staging -o sar -Os
-pipe -Os  -mtune=mips32r2 -mabi=32 -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/sergio/hardware/moviecube/buildroot/output/staging/usr/include
-I/home/sergio/hardware/moviecube/buildroot/output/staging/include -Wall
-Wstrict-prototypes -pipe -O2 sar.o act_sar.o sa_common.o pr_stats.o
libsyscom.a -s
sadc.o: In function `p_write_error':
sadc.c:(.text+0x13c): undefined reference to `libintl_gettext'
sadc.o: In function `usage':
sadc.c:(.text+0x1dc): undefined reference to `libintl_gettext'
sadc.c:(.text+0x218): undefined reference to `libintl_gettext'
sadc.o: In function `setup_file_hdr':
sadc.c:(.text+0x1184): undefined reference to `libintl_gettext'
sadc.o: In function `create_sa_file':
sadc.c:(.text+0x13f4): undefined reference to `libintl_gettext'
sadc.o:sadc.c:(.text+0x17e8): more undefined references to `libintl_gettext'
follow
libsyscom.a(common.o): In function `init_nls':
common.c:(.text+0xabc): undefined reference to `libintl_bindtextdomain'
common.c:(.text+0xad8): undefined reference to `libintl_textdomain'
libsyscom.a(common.o): In function `print_version':
common.c:(.text+0x139c): undefined reference to `libintl_gettext'
libsyscom.a(ioconf.o): In function `transform_devmapname':
ioconf.c:(.text+0x214): undefined reference to `libintl_gettext'
collect2: ld returned 1 exit status
make[1]: *** [sadc] Error 1
make[1]: *** Waiting for unfinished jobs....
sar.o: In function `print_usage_title':
sar.c:(.text+0xc8): undefined reference to `libintl_gettext'
sar.o: In function `print_read_error':
sar.c:(.text+0x124): undefined reference to `libintl_gettext'
sar.o: In function `display_help':
sar.c:(.text+0x19c): undefined reference to `libintl_gettext'
sar.c:(.text+0x1cc): undefined reference to `libintl_gettext'
sar.c:(.text+0x1fc): undefined reference to `libintl_gettext'
sar.o:sar.c:(.text+0x22c): more undefined references to `libintl_gettext'
follow
libsyscom.a(common.o): In function `init_nls':
common.c:(.text+0xabc): undefined reference to `libintl_bindtextdomain'
common.c:(.text+0xad8): undefined reference to `libintl_textdomain'
libsyscom.a(common.o): In function `print_version':
common.c:(.text+0x139c): undefined reference to `libintl_gettext'
libsyscom.a(ioconf.o): In function `transform_devmapname':
ioconf.c:(.text+0x214): undefined reference to `libintl_gettext'
collect2: ld returned 1 exit status
make[1]: *** [sar] Error 1
make[1]: Leaving directory
`/home/sergio/hardware/moviecube/buildroot/output/build/sysstat-9.0.5'
make: ***
[/home/sergio/hardware/moviecube/buildroot/output/build/sysstat-9.0.5/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
