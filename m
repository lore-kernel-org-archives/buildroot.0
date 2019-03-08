From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 8 Mar 2019 23:49:47 +0100
Subject: [Buildroot] issue to build elfutils due to libintl
In-Reply-To: <20190308125638.GA30079@arthur-bzh>
References: <20190308125638.GA30079@arthur-bzh>
Message-ID: <20190308234947.274e5d36@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arthur,

On Fri, 8 Mar 2019 13:56:38 +0100, Arthur LAMBERT <lambertarthur22@gmail.com> wrote:

> Hi,
> 
> I have one issue to build the package elfutils. Everything was working fine
> and after updating my ubuntu from 16.04 to 18.04 I am not able to build
> anymore the package with success.
> 
> My defconfig is for arm architecture with uclibc.

Mind to share your complete .config/defconfig file?

Did your run an complete build (make clean; make), see [1]?

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#full-rebuild

> 
> The error :
> 
> >>> elfutils 0.174 Building  
> PATH="/home/arthur/work/buildroot/master_buildroot_integration_dreem/output/host/bin:/home/arthur/work/buildroot/master_buildroot_integration_dreem/output/host/sbin:/home/arthur/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/gnat/bin:/home/g179168/middleware/tools/bin/:/usr/local/go/bin"  /usr/bin/make -j9  -C /home/arthur/work/buildroot/master_buildroot_integration_dreem/output/build/elfutils-0.174/
> make[1]: Entering directory '/home/arthur/work/buildroot/master_buildroot_integration_dreem/output/build/elfutils-0.174'
> /usr/bin/make --no-print-directory all-recursive
> Making all in config
> make[3]: Nothing to be done for 'all'.
> Making all in m4
> make[3]: Nothing to be done for 'all'.
> Making all in lib
>   CC       xstrdup.o
>   CC       xstrndup.o
>   CC       xmalloc.o
>   CC       next_prime.o
>   CC       crc32.o
>   CC       crc32_file.o
>   CC       color.o
>   CC       printversion.o
> xmalloc.c:33:10: fatal error: libintl.h: No such file or directory
>  #include <libintl.h>
>           ^~~~~~~~~~~
> compilation terminated.
> Makefile:418: recipe for target 'xmalloc.o' failed
> make[3]: *** [xmalloc.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> printversion.c:33:10: fatal error: libintl.h: No such file or directory
>  #include <libintl.h>
>           ^~~~~~~~~~~
> compilation terminated.
> Makefile:418: recipe for target 'printversion.o' failed
> make[3]: *** [printversion.o] Error 1
> color.c:35:10: fatal error: libintl.h: No such file or directory
>  #include <libintl.h>
>           ^~~~~~~~~~~
> compilation terminated.
> Makefile:418: recipe for target 'color.o' failed
> make[3]: *** [color.o] Error 1
> Makefile:487: recipe for target 'all-recursive' failed
> make[2]: *** [all-recursive] Error 1
> Makefile:403: recipe for target 'all' failed
> make[1]: *** [all] Error 2
> make[1]: Leaving directory '/home/arthur/work/buildroot/master_buildroot_integration_dreem/output/build/elfutils-0.174'
> package/pkg-generic.mk:238: recipe for target '/home/arthur/work/buildroot/master_buildroot_integration_dreem/output/build/elfutils-0.174/.stamp_built' failed
> make: *** [/home/arthur/work/buildroot/master_buildroot_integration_dreem/output/build/elfutils-0.174/.stamp_built] Error 2
> 
> The issue was present with 2017.02.2 version of buildroot and I am always able to reproduce the issue with 2019.02 release.
> Is it an error in my defconfig ? is it a real issue ?
> 
> In my opinion the issue is due to the update of my gcc version during the ubuntu upgrade. I am able to
> compile elfutils on my archlinux with gcc 5.4.0. I have the issue with gcc 7.3.0 on my ubuntu.
> 
> This patch was not supposed to fixed this kind of issues ?
> http://lists.busybox.net/pipermail/buildroot/2017-July/196484.html
> 
> Thanks,
> Arthur.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
