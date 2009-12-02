From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Dec 2009 14:28:01 +0000 (UTC)
Subject: [Buildroot] [Bug 759] New: Sysstat build broken without libintl
Message-ID: <bug-759-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759

              Host: x86_64
            Target: i686
           Summary: Sysstat build broken without libintl
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: llandwerlin at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


>>> sysstat 9.0.5 Building
/usr/bin/make -j1  -C
/home/djdeath/src/buildroot/buildroot_rebase/output/build/sysstat-9.0.5/
make[1]: entrant dans le r?pertoire ?
/home/djdeath/src/buildroot/buildroot_rebase/output/build/sysstat-9.0.5 ?
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o sadc.o -c -Os
-pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -Wall
-Wstrict-prototypes -pipe -O2  -DSA_DIR=\"/var/log/sa\"
-DSADC_PATH=\"/usr/lib/sa/sadc\" -DUSE_NLS -DPACKAGE=\"sysstat\"
-DLOCALEDIR=\"/usr/share/locale\" sadc.c
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o act_sadc.o -c
-Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -Wall
-Wstrict-prototypes -pipe -O2 -DSOURCE_SADC  -DSA_DIR=\"/var/log/sa\"
-DSADC_PATH=\"/usr/lib/sa/sadc\" -DUSE_NLS -DPACKAGE=\"sysstat\"
-DLOCALEDIR=\"/usr/share/locale\" activity.c
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o sa_wrap.o -c
-Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -Wall
-Wstrict-prototypes -pipe -O2  -DSA_DIR=\"/var/log/sa\"
-DSADC_PATH=\"/usr/lib/sa/sadc\" -DUSE_NLS -DPACKAGE=\"sysstat\"
-DLOCALEDIR=\"/usr/share/locale\" sa_wrap.c
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o sa_common.o -c
-Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -Wall
-Wstrict-prototypes -pipe -O2  -DSA_DIR=\"/var/log/sa\"
-DSADC_PATH=\"/usr/lib/sa/sadc\" -DUSE_NLS -DPACKAGE=\"sysstat\"
-DLOCALEDIR=\"/usr/share/locale\" sa_common.c
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o rd_stats.o -c
-Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -Wall
-Wstrict-prototypes -pipe -O2  -DSA_DIR=\"/var/log/sa\"
-DSADC_PATH=\"/usr/lib/sa/sadc\" -DUSE_NLS -DPACKAGE=\"sysstat\"
-DLOCALEDIR=\"/usr/share/locale\" rd_stats.c
/opt/intelcm_nds//bin/i686-cm-linux-gnu-ar rv librdstats.a rd_stats.o
/home/djdeath/taff/toolchain/intelcm_nds/bin/.i686-cm-linux-gnu-ar: creating
librdstats.a
a - rd_stats.o
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o common.o -c -Os
-pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -Wall
-Wstrict-prototypes -pipe -O2  -DSA_DIR=\"/var/log/sa\"
-DSADC_PATH=\"/usr/lib/sa/sadc\" -DUSE_NLS -DPACKAGE=\"sysstat\"
-DLOCALEDIR=\"/usr/share/locale\" common.c
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o ioconf.o -c -Os
-pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -Wall
-Wstrict-prototypes -pipe -O2  -DSA_DIR=\"/var/log/sa\"
-DSADC_PATH=\"/usr/lib/sa/sadc\" -DUSE_NLS -DPACKAGE=\"sysstat\"
-DLOCALEDIR=\"/usr/share/locale\" ioconf.c
/opt/intelcm_nds//bin/i686-cm-linux-gnu-ar rvs libsyscom.a common.o ioconf.o
/home/djdeath/taff/toolchain/intelcm_nds/bin/.i686-cm-linux-gnu-ar: creating
libsyscom.a
a - common.o
a - ioconf.o
/opt/intelcm_nds//bin/i686-cm-linux-gnu-gcc -Os -pipe -O3  --sysroot
/home/djdeath/src/buildroot/buildroot_rebase/output/staging/ -o sadc -Os -pipe
-O3  --sysroot /home/djdeath/src/buildroot/buildroot_rebase/output/staging/
-Wall -Wstrict-prototypes -pipe -O2 sadc.o act_sadc.o sa_wrap.o sa_common.o
librdstats.a libsyscom.a -s
sadc.o: In function `p_write_error':
sadc.c:(.text+0xd0): undefined reference to `libintl_gettext'
sadc.o: In function `usage':
sadc.c:(.text+0x10e): undefined reference to `libintl_gettext'
sadc.c:(.text+0x132): undefined reference to `libintl_gettext'
sadc.o: In function `setup_file_hdr':
sadc.c:(.text+0xc59): undefined reference to `libintl_gettext'
sadc.o: In function `create_sa_file':
sadc.c:(.text+0xde1): undefined reference to `libintl_gettext'
sadc.o:sadc.c:(.text+0x10be): more undefined references to `libintl_gettext'
follow
libsyscom.a(common.o): In function `init_nls':
common.c:(.text+0x686): undefined reference to `libintl_bindtextdomain'
common.c:(.text+0x692): undefined reference to `libintl_textdomain'
libsyscom.a(common.o): In function `print_version':
common.c:(.text+0xc3e): undefined reference to `libintl_gettext'
libsyscom.a(ioconf.o): In function `transform_devmapname':
ioconf.c:(.text+0x19d): undefined reference to `libintl_gettext'
collect2: ld returned 1 exit status
make[1]: *** [sadc] Erreur 1


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
