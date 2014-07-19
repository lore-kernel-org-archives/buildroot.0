From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jul 2014 01:16:05 +0200
Subject: [Buildroot] [PATCH 2/4] perl-gd: new package
In-Reply-To: <20140719195816.GK3593@free.fr>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
 <1405691019-10397-2-git-send-email-francois.perrad@gadz.org>
 <20140719195816.GK3593@free.fr>
Message-ID: <20140719231604.GP3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-19 21:58 +0200, Yann E. MORIN spake thusly:
> On 2014-07-18 15:43 +0200, Francois Perrad spake thusly:
> [--SNIP--]
> > diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
> > new file mode 100644
> > index 0000000..7c85cfc
> > --- /dev/null
> > +++ b/package/perl-gd/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_PERL_GD
> > +	bool "perl-gd"
> > +	depends on !BR2_PREFER_STATIC_LIB
> > +	select BR2_PACKAGE_ZLIB
> > +	select BR2_PACKAGE_LIBPNG
> > +	select BR2_PACKAGE_FREETYPE
> > +	select BR2_PACKAGE_GD
> 
> It looks like there are still issues with search paths, which include
> path to the host system libraries:
>     http://autobuild.buildroot.org/results/336/33633a683227ebce620cb4b4561cfe7d7cbf4ba8/build-end.log
> 
> Extract of a failed build log:
> 
>     LD_RUN_PATH="/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib"
>     /scratch/peko/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
>     -shared  GD.o  -o blib/arch/auto/GD/GD.so       \
>     -L/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
>     -L/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
>     -L/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
>     -L/usr/lib -L/usr/lib -lXpm -lX11 -ljpeg -lfontconfig -lfreetype -lpng12
>     -lz -lm -lgd
> 
>     /usr/lib/libXpm.so: file not recognized: File format not recognized
> 
> Notice how it is looking for libs in -L/usr/lib -L/usr/lib.

I was not able to reproduce this buildfailure. The only occurences are
on Peter's machine, so maybe there is a peculirity with his setup.

Which only reinforces my stance on having our own host-perl.

Anyway, care to have a look at this issue, please? If not for a fix, at
least for an explanation. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
