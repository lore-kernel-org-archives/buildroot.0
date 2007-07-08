From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 17:01:12 +0200 (CEST)
Subject: [Buildroot] package/gettext trouble
Message-ID: <0707081654290.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm stuck :(

gettext fails on me, whatever I try.  It shows me this:

make[4]: Entering directory `buildroot/build_i486/gettext-0.16.1/gettext-runtime/intl'
sed -e '/IN_LIBGLOCALE/d' \
            -e 's,@''HAVE_POSIX_PRINTF''@,1,g' \
            -e 's,@''HAVE_ASPRINTF''@,1,g' \
            -e 's,@''HAVE_SNPRINTF''@,1,g' \
            -e 's,@''HAVE_WPRINTF''@,0,g' \
          < ./libgnuintl.h.in \
        | if test 'no' = yes; then \
            sed -e 's/extern \([^()]*\);/extern __declspec (dllimport) \1;/'; \
          else \
            cat; \
          fi \
        | sed -e 's/extern \([^"]\)/extern LIBINTL_DLL_EXPORTED \1/' \
              -e "/#define _LIBINTL_H/r ./export.h" \
        | sed -e 's,@''HAVE_VISIBILITY''@,1,g' \
          > libgnuintl.h
sed -e '/IN_LIBGLOCALE/d' \
            -e 's,@''HAVE_POSIX_PRINTF''@,1,g' \
            -e 's,@''HAVE_ASPRINTF''@,1,g' \
            -e 's,@''HAVE_SNPRINTF''@,1,g' \
            -e 's,@''HAVE_WPRINTF''@,0,g' \
          < ./libgnuintl.h.in > libintl.h
/bin/sh ./config.charset 'i486-pc-linux-gnu' > t-charset.alias
sed -e '/^#/d' -e 's/@''PACKAGE''@/gettext-runtime/g' ./ref-add.sin > t-ref-add.sed
mv t-ref-add.sed ref-add.sed
sed -e '/^#/d' -e 's/@''PACKAGE''@/gettext-runtime/g' ./ref-del.sin > t-ref-del.sed
mv t-ref-del.sed ref-del.sed
/bin/sh ../libtool --mode=compile buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -c -DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\" -DLIBDIR=\"/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL -DIN_LIBINTL -DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/lib\" -DNO_XMALLOC -Dset_relocation_prefix=libintl_set_relocation_prefix -Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I. -I..  -g -O2 -fvisibility=hidden  ./bindtextdom.c
mv t-charset.alias charset.alias
/bin/sh ../libtool --mode=compile buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -c -DLOCALEDIR=\"/usr/share/locale\" -DLOCALE_ALIAS_PATH=\"/usr/share/locale\" -DLIBDIR=\"/lib\" -DBUILDING_LIBINTL -DBUILDING_DLL -DIN_LIBINTL -DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/lib\" -DNO_XMALLOC -Dset_relocation_prefix=libintl_set_relocation_prefix -Drelocate=libintl_relocate -DDEPENDS_ON_LIBICONV=1 -DHAVE_CONFIG_H -I. -I. -I..  -g -O2 -fvisibility=hidden  ./dcgettext.c
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[4]: *** [bindtextdom.lo] Error 1
make[4]: *** Waiting for unfinished jobs....
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[4]: *** [dcgettext.lo] Error 1
make[4]: Leaving directory `buildroot/build_i486/gettext-0.16.1/gettext-runtime/intl'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `buildroot/build_i486/gettext-0.16.1/gettext-runtime'
make[2]: *** [all] Error 2
make[2]: Leaving directory `buildroot/build_i486/gettext-0.16.1/gettext-runtime'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `buildroot/build_i486/gettext-0.16.1'
make: *** [buildroot/build_i486/gettext-0.16.1/gettext-runtime/src/gettext] Error 2

Can anyone put me on the right track?


-- 
Cristian
