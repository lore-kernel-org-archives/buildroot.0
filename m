From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 21:32:39 +0200
Subject: [Buildroot] [git commit] package/wipe: fix musl build
In-Reply-To: <BL2PR15MB1057981B9884F25A08130568ED160@BL2PR15MB1057.namprd15.prod.outlook.com>
References: <20160207140049.D9B227FEE6@busybox.osuosl.org>
 <BL2PR15MB1057981B9884F25A08130568ED160@BL2PR15MB1057.namprd15.prod.outlook.com>
Message-ID: <5f0dd89e-ffd6-f010-bc37-7a9958cfc023@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/09/18 12:29, Tony Fuller wrote:
> Hi Thomas,
> 
> I am using Buildroot 2018.08 to build the "wipe" package for 32-bit
> PowerPC
> 464 architecture (For the Western Digital MyBookLive). Also I am using
> glibc
> not muslc. This change seems to be highly correlated to the error I am
> seeing: 
> http://buildroot-busybox.2317881.n4.nabble.com/git-commit-package-wipe-fix-musl-build-td125204.html
> 
> I'm not sure how to modify the patch from this thread to my advantage.

 I don't think the patch is really related.

 I can successfully compile wipe with a glibc toolchain. Can you share your
arch/toolchain config (make savedefconfig and post the first part of the
generated defconfig file).

 Regards,
 Arnout

> Any ideas how to move forward aside from not compiling wipe :)?
> 
> Please forgive me for adding in the full error details below:
> 
> user at hostname:/media/user/4665efb0-0b1b-4c63-8392-
> d695e8e1cd6e/user/buildroot-2018.08$
> make
>>>> wipe 2.3.1 Building
> 
> PATH="/media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/host/bin:/media/user/4665efb0-0b1b-4c63-8392-
> d695e8e1cd6e/user/buildroot-
> 2018.08/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/
> bin:/sbin:/bin:/usr/games:/usr/local/games" 
> /usr/bin/make -j5  -C
> /media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/build/wipe-2.3.1/
> make[1]: Entering directory
> '/media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/build/wipe-2.3.1'
> /media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/host/bin/powerpc-buildroot-linux-gnu-gcc
> -pipe -O2   -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I. -DLINUX    -
> c -o
> main.o main.c
> /media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/host/bin/powerpc-buildroot-linux-gnu-gcc
> -pipe -O2   -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I. -DLINUX    -
> c -o
> wipe.o wipe.c
> /media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/host/bin/powerpc-buildroot-linux-gnu-gcc
> -pipe -O2   -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I. -DLINUX    -
> c -o
> rand.o rand.c
> /media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/host/bin/powerpc-buildroot-linux-gnu-gcc
> -pipe -O2   -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I. -DLINUX    -
> c -o
> file.o file.c
> /media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/host/bin/powerpc-buildroot-linux-gnu-gcc
> -pipe -O2   -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I. -DLINUX    -
> c -o
> blkdev.o blkdev.c
> In file included from wipe.c:56:0:
> rand.h:27:21: error: unknown type name ?uint32_t?
>  #  define u_int32_t uint32_t
>                      ^
> rand.h:30:9: note: in expansion of macro ?u_int32_t?
>  typedef u_int32_t u_rand_t;
>          ^~~~~~~~~
> In file included from main.c:46:0:
> rand.h:27:21: error: unknown type name ?uint32_t?
>  #  define u_int32_t uint32_t
>                      ^
> rand.h:30:9: note: in expansion of macro ?u_int32_t?
>  typedef u_int32_t u_rand_t;
>          ^~~~~~~~~
> <builtin>: recipe for target 'wipe.o' failed
> make[1]: *** [wipe.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> <builtin>: recipe for target 'main.o' failed
> make[1]: *** [main.o] Error 1
> In file included from file.c:42:0:
> rand.h:27:21: error: unknown type name ?uint32_t?
>  #  define u_int32_t uint32_t
>                      ^
> rand.h:30:9: note: in expansion of macro ?u_int32_t?
>  typedef u_int32_t u_rand_t;
>          ^~~~~~~~~
> <builtin>: recipe for target 'file.o' failed
> make[1]: *** [file.o] Error 1
> In file included from rand.c:36:0:
> rand.h:27:21: error: unknown type name ?uint32_t?
>  #  define u_int32_t uint32_t
>                      ^
> rand.h:30:9: note: in expansion of macro ?u_int32_t?
>  typedef u_int32_t u_rand_t;
>          ^~~~~~~~~
> <builtin>: recipe for target 'rand.o' failed
> make[1]: *** [rand.o] Error 1
> make[1]: Leaving directory
> '/media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/build/wipe-2.3.1'
> package/pkg-generic.mk:229: recipe for target
> '/media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/build/wipe-2.3.1/.stamp_built'
> failed
> make: ***
> [/media/user/4665efb0-0b1b-4c63-8392-d695e8e1cd6e/user/buildroot-
> 2018.08/output/build/wipe-2.3.1/.stamp_built]
> Error 2
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
