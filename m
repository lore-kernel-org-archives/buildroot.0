From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 23 Jun 2007 22:31:09 +0200
Subject: [Buildroot] gettext breakage on ia32 [was: Re:
	buildroot-20070620.tar.bz2 snapshot issue]
In-Reply-To: <5d75f4610706230553h7ea29972nd07670adf70cc23a@mail.gmail.com>
References: <5d75f4610706200238ud163a2jbe00525e00b274a9@mail.gmail.com>
	<1182333923.5719.30.camel@shadow.muzakdomain.imagesound.co.uk>
	<20070620121339.GB28828@aon.at>
	<5d75f4610706230553h7ea29972nd07670adf70cc23a@mail.gmail.com>
Message-ID: <20070623203109.GQ4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 23, 2007 at 07:53:02PM +0700, BuraphaLinux Server wrote:

>/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
>-DLOCALEDIR=\"/usr/share/locale\"
>-DBISON_LOCALEDIR=\"/usr/share/locale\"
>-DLOCALE_ALIAS_PATH=\"/usr/share/locale\" -DUSEJEXE=0
>-DGETTEXTJEXEDIR=\"/lib/gettext\"
>-DGETTEXTJAR=\"/usr/share/gettext/gettext.jar\" -DLIBDIR=\"/lib\"
>-DGETTEXTDATADIR=\"/usr/share/gettext\"
>-DPROJECTSDIR=\"/usr/share/gettext/projects\" -DHAVE_CONFIG_H -I. -I..
>-I. -I. -I.. -I.. -I../libgrep -I../libuniname -I../gnulib-lib
>-I../gnulib-lib -I../intl -I../../gettext-runtime/intl -Os -pipe
>-I/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/include
>--sysroot=/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/
>-isysroot 
>/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir
>-c plural-eval.c  -fPIC -DPIC -o .libs/plural-eval.o
>In file included from plural-eval.c:36:
>../../gettext-runtime/intl/eval-plural.h:28: error: conflicting types
>for 'plural_eval'
>../../gettext-runtime/intl/plural-exp.h:115: error: previous
>declaration of 'plural_eval' was here

uclibc.org/~aldot/uClibc/uClibc-0.9.29-fix-internal_function-definition.patch

for uClibc-0.9.29, keep the name.
for trunk, name it uClibc.fix-internal_function-definition.patch
so it gets applied to the corresponding version(s).
