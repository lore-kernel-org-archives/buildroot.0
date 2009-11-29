From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 19:49:42 -0600
Subject: [Buildroot] Build failure - sysstat-9.0.5
Message-ID: <200911281949.45336.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This one might be fixable since the mentioned missing
items are supposed to be built -

make[1]: *** [mpstat] Error 1
sadc.o: In function `p_write_error':
sadc.c:(.text+0x120): undefined reference to `libintl_gettext'
sadc.o: In function `usage':
sadc.c:(.text+0x1a0): undefined reference to `libintl_gettext'
sadc.c:(.text+0x1dc): undefined reference to `libintl_gettext'
sadc.o: In function `setup_file_hdr':
sadc.c:(.text+0x1000): undefined reference to `libintl_gettext'
sadc.o: In function `create_sa_file':
sadc.c:(.text+0x1230): undefined reference to `libintl_gettext'
sadc.o:sadc.c:(.text+0x15d0): more undefined references to `libintl_gettext' follow
libsyscom.a(common.o): In function `init_nls':
common.c:(.text+0x994): undefined reference to `libintl_bindtextdomain'
common.c:(.text+0x9ac): undefined reference to `libintl_textdomain'
libsyscom.a(common.o): In function `print_version':
common.c:(.text+0x12b8): undefined reference to `libintl_gettext'
libsyscom.a(ioconf.o): In function `transform_devmapname':
ioconf.c:(.text+0x1f0): undefined reference to `libintl_gettext'
collect2: ld returned 1 exit status
make[1]: *** [sadc] Error 1
iostat.o: In function `usage':
iostat.c:(.text+0x16fc): undefined reference to `libintl_gettext'
iostat.c:(.text+0x1738): undefined reference to `libintl_gettext'
iostat.o: In function `read_proc_stat':
iostat.c:(.text+0x3120): undefined reference to `libintl_gettext'
librdstats.a(rd_stats.o): In function `get_proc_cpu_nr':
rd_stats.c:(.text+0x37d8): undefined reference to `libintl_gettext'
librdstats.a(rd_stats.o): In function `read_stat_cpu':
rd_stats.c:(.text+0x3cbc): undefined reference to `libintl_gettext'
librdstats.a(rd_stats.o):rd_stats.c:(.text+0x3f44): more undefined references to `libintl_gettext' follow
libsyscom.a(common.o): In function `init_nls':
common.c:(.text+0x994): undefined reference to `libintl_bindtextdomain'
common.c:(.text+0x9ac): undefined reference to `libintl_textdomain'
libsyscom.a(common.o): In function `print_version':
common.c:(.text+0x12b8): undefined reference to `libintl_gettext'
libsyscom.a(ioconf.o): In function `transform_devmapname':
ioconf.c:(.text+0x1f0): undefined reference to `libintl_gettext'
collect2: ld returned 1 exit status
make[1]: *** [iostat] Error 1
make: *** [/Builds/BLDRT/br-head/output/build/sysstat-9.0.5/.stamp_built] Error 2
