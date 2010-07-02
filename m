From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Jul 2010 09:59:56 +0000 (UTC)
Subject: [Buildroot] [Bug 1741] external toolchain linking error
In-Reply-To: <bug-1741-163@https.bugs.busybox.net/>
References: <bug-1741-163@https.bugs.busybox.net/>
Message-ID: <20100702095956.3AC378222A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1741

--- Comment #14 from Matthias Brugger <mensch0815@gmail.com>  ---
Hi,

today I had the error once again, but this time I don't even have root
privileges to apply the mentioned patch.
I've already added the two config files (the both from 2010-07-02)...

and here the output:
/bin/sh ../libtool --mode=compile
/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/bin/avr32-linux-gcc
-Os -pipe -Os  -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 --sysroot
/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/staging_dir/
-c -DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\"
-DLIBDIR=\"/usr/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL -DIN_LIBINTL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libintl_set_relocation_prefix
-Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I.
-I..  -g -O2 -fvisibility=hidden  ./intl-compat.c

/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/bin/avr32-linux-gcc
-Os -pipe -Os -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 --sysroot
/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/staging_dir/
-c -DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\"
-DLIBDIR=\"/usr/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL -DIN_LIBINTL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libintl_set_relocation_prefix
-Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I.
-I.. -g -O2 -fvisibility=hidden ./intl-compat.c  -fPIC -DPIC -o
.libs/intl-compat.o

/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/bin/avr32-linux-gcc
-Os -pipe -Os -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 --sysroot
/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/staging_dir/
-c -DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\"
-DLIBDIR=\"/usr/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL -DIN_LIBINTL
-DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/usr/lib\" -DNO_XMALLOC
-Dset_relocation_prefix=libintl_set_relocation_prefix
-Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I.
-I.. -g -O2 -fvisibility=hidden ./intl-compat.c -o intl-compat.o >/dev/null
2>&1
/bin/sh ../libtool --mode=link \
     
/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/bin/avr32-linux-gcc
-Os -pipe -Os  -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 --sysroot
/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/staging_dir/
 -g -O2 -fvisibility=hidden   -o libintl.la \
      bindtextdom.lo dcgettext.lo dgettext.lo gettext.lo finddomain.lo
hash-string.lo loadmsgcat.lo localealias.lo textdomain.lo l10nflist.lo
explodename.lo dcigettext.lo dcngettext.lo dngettext.lo ngettext.lo plural.lo
plural-exp.lo localcharset.lo lock.lo relocatable.lo langprefs.lo localename.lo
log.lo printf.lo version.lo osdep.lo intl-compat.lo -liconv    -lc \
      -version-info 8:1:0 \
      -rpath /usr/lib \
      -no-undefined
/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/bin/avr32-linux-gcc
-Os -pipe -Os  -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 --sysroot
/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/staging_dir/
-shared  .libs/bindtextdom.o .libs/dcgettext.o .libs/dgettext.o .libs/gettext.o
.libs/finddomain.o .libs/hash-string.o .libs/loadmsgcat.o .libs/localealias.o
.libs/textdomain.o .libs/l10nflist.o .libs/explodename.o .libs/dcigettext.o
.libs/dcngettext.o .libs/dngettext.o .libs/ngettext.o .libs/plural.o
.libs/plural-exp.o .libs/localcharset.o .libs/lock.o .libs/relocatable.o
.libs/langprefs.o .libs/localename.o .libs/log.o .libs/printf.o .libs/version.o
.libs/osdep.o .libs/intl-compat.o  -Wl,--rpath
-Wl,/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/lib
-Wl,--rpath
-Wl,/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/lib
/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/lib/libiconv.so
-L/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/lib
-L/home/hf/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/lib
-lc  -msoft-float -Wl,-soname -Wl,libintl.so.8 -o .libs/libintl.so.8.0.1
/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/all/buildroot-2010.05-dont-touch/output/build/staging_dir/usr/bin/../lib/gcc/avr32-unknown-linux-uclibc/4.2.2/../../../../avr32-unknown-linux-uclibc/bin/ld:
cannot find /lib//libc.so.0
collect2: ld returned 1 exit status
make[4]: *** [libintl.la] Fehler 1
make[4]: Leaving directory
`/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/gettext-0.16.1/gettext-runtime/intl'
make[3]: *** [all-recursive] Fehler 1
make[3]: Leaving directory
`/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/gettext-0.16.1/gettext-runtime'
make[2]: *** [all] Fehler 2
make[2]: Leaving directory
`/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/gettext-0.16.1/gettext-runtime'
make[1]: *** [all-recursive] Fehler 1
make[1]: Leaving directory
`/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/gettext-0.16.1'
make: ***
[/home/hfprojn1/projekte/aktuell/Adaptive_Antennen/usr/bgg/buildroot-2010.05/output/build/gettext-0.16.1/gettext-runtime/src/gettext]
Fehler 2

cheers,
matthias

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
