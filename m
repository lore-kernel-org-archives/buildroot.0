From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 28 Mar 2018 09:57:57 +0200
Subject: [Buildroot] [V3 1/2] dropbear: bump to version 2018.76
In-Reply-To: <20180326221829.656d3d2a@windsurf.home>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180326221829.656d3d2a@windsurf.home>
Message-ID: <CAB0FRsstPgEOQCPJgCWn91y-PB3umhgpX9vn0qof5J-knPPkXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-26 22:18 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Wed, 21 Mar 2018 17:03:28 +0100, Francois Perrad wrote:
> > with this new version:
> >   - "configure --enable-static" should now be used instead of
> >     "make STATIC=1"
> >   - any customised options should be put in localoptions.h
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> With this patch applied, the following defconfig:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/
> toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_DROPBEAR=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> fails to build with:
>
> >>> dropbear 2018.76 Building
> PATH="/home/thomas/projets/buildroot/output/host/bin:/
> home/thomas/projets/buildroot/output/host/sbin:/usr/local/
> bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/
> sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/
> home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5
> MULTI=1 SCPPROGRESS=1 PROGRAMS="dropbear dropbearkey dropbearconvert scp
> dbclient ssh dbclient"  -C /home/thomas/projets/buildroot/output/build/
> dropbear-2018.76/
> Creating default_options_guard.h
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -c
> -I./libtomcrypt/src/headers/ -DLOCALOPTIONS_H_EXISTS -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -W
> -Wall -Wno-pointer-sign -fno-strict-overflow -fPIE -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -DDROPBEAR_SERVER -DDROPBEAR_CLIENT -DPROGRESS_METER
> -DDBMULTI_dropbear -DDBMULTI_dropbearkey -DDBMULTI_dropbearconvert
> -DDBMULTI_scp -DDBMULTI_dbclient -DDBMULTI_ssh -DDBMULTI_dbclient
> -DDROPBEAR_MULTI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 dbmulti.c -o dbmulti.o
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -c
> -I./libtomcrypt/src/headers/ -DLOCALOPTIONS_H_EXISTS -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -W
> -Wall -Wno-pointer-sign -fno-strict-overflow -fPIE -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -DDROPBEAR_SERVER -DDROPBEAR_CLIENT -DPROGRESS_METER
> -DDBMULTI_dropbear -DDBMULTI_dropbearkey -DDBMULTI_dropbearconvert
> -DDBMULTI_scp -DDBMULTI_dbclient -DDBMULTI_ssh -DDBMULTI_dbclient
> -DDROPBEAR_MULTI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 atomicio.c -o atomicio.o
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -c
> -I./libtomcrypt/src/headers/ -DLOCALOPTIONS_H_EXISTS -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -W
> -Wall -Wno-pointer-sign -fno-strict-overflow -fPIE -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -DDROPBEAR_SERVER -DDROPBEAR_CLIENT -DPROGRESS_METER
> -DDBMULTI_dropbear -DDBMULTI_dropbearkey -DDBMULTI_dropbearconvert
> -DDBMULTI_scp -DDBMULTI_dbclient -DDBMULTI_ssh -DDBMULTI_dbclient
> -DDROPBEAR_MULTI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 bignum.c -o bignum.o
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -c
> -I./libtomcrypt/src/headers/ -DLOCALOPTIONS_H_EXISTS -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -W
> -Wall -Wno-pointer-sign -fno-strict-overflow -fPIE -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -DDROPBEAR_SERVER -DDROPBEAR_CLIENT -DPROGRESS_METER
> -DDBMULTI_dropbear -DDBMULTI_dropbearkey -DDBMULTI_dropbearconvert
> -DDBMULTI_scp -DDBMULTI_dbclient -DDBMULTI_ssh -DDBMULTI_dbclient
> -DDROPBEAR_MULTI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 buffer.c -o buffer.o
> /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc -c
> -I./libtomcrypt/src/headers/ -DLOCALOPTIONS_H_EXISTS -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -W
> -Wall -Wno-pointer-sign -fno-strict-overflow -fPIE -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -DDROPBEAR_SERVER -DDROPBEAR_CLIENT -DPROGRESS_METER
> -DDBMULTI_dropbear -DDBMULTI_dropbearkey -DDBMULTI_dropbearconvert
> -DDBMULTI_scp -DDBMULTI_dbclient -DDBMULTI_ssh -DDBMULTI_dbclient
> -DDROPBEAR_MULTI -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 circbuffer.c -o circbuffer.o
> In file included from options.h:23:0,
>                  from includes.h:29,
>                  from bignum.c:27:
> sysoptions.h:237:3: error: #error "DROPBEAR_SVR_PASSWORD_AUTH requires
> `crypt()'."
>   #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
>    ^
> In file included from options.h:23:0,
>                  from includes.h:29,
>                  from buffer.c:27:
> sysoptions.h:237:3: error: #error "DROPBEAR_SVR_PASSWORD_AUTH requires
> `crypt()'."
>   #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
>    ^
> In file included from options.h:23:0,
>                  from includes.h:29,
>                  from dbmulti.c:25:
> sysoptions.h:237:3: error: #error "DROPBEAR_SVR_PASSWORD_AUTH requires
> `crypt()'."
>   #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
>    ^
> In file included from options.h:23:0,
>                  from includes.h:29,
>                  from circbuffer.c:25:
> sysoptions.h:237:3: error: #error "DROPBEAR_SVR_PASSWORD_AUTH requires
> `crypt()'."
>   #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
>    ^
> In file included from options.h:23:0,
>                  from includes.h:29,
>                  from atomicio.c:30:
> sysoptions.h:237:3: error: #error "DROPBEAR_SVR_PASSWORD_AUTH requires
> `crypt()'."
>   #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
>    ^
> In file included from includes.h:119:0,
>                  from buffer.c:27:
> compat.h:43:7: error: conflicting types for ?__xpg_basename?
>  char *basename(const char* path);
>        ^
> /home/thomas/projets/buildroot/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/libgen.h:34:14: note:
> previous declaration of ?__xpg_basename? was here
>  extern char *__xpg_basename (char *__path) __THROW;
>               ^
> make[2]: *** [Makefile:128: buffer.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> In file included from includes.h:119:0,
>                  from circbuffer.c:25:
> compat.h:43:7: error: conflicting types for ?__xpg_basename?
>  char *basename(const char* path);
>        ^
> /home/thomas/projets/buildroot/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/libgen.h:34:14: note:
> previous declaration of ?__xpg_basename? was here
>  extern char *__xpg_basename (char *__path) __THROW;
>               ^
> make[2]: *** [Makefile:128: circbuffer.o] Error 1
> In file included from includes.h:119:0,
>                  from bignum.c:27:
> compat.h:43:7: error: conflicting types for ?__xpg_basename?
>  char *basename(const char* path);
>        ^
> /home/thomas/projets/buildroot/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/libgen.h:34:14: note:
> previous declaration of ?__xpg_basename? was here
>  extern char *__xpg_basename (char *__path) __THROW;
>               ^
> In file included from includes.h:119:0,
>                  from dbmulti.c:25:
> compat.h:43:7: error: conflicting types for ?__xpg_basename?
>  char *basename(const char* path);
>        ^
> /home/thomas/projets/buildroot/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/libgen.h:34:14: note:
> previous declaration of ?__xpg_basename? was here
>  extern char *__xpg_basename (char *__path) __THROW;
>               ^
> make[2]: *** [Makefile:128: bignum.o] Error 1
> make[2]: *** [Makefile:128: dbmulti.o] Error 1
> In file included from includes.h:119:0,
>                  from atomicio.c:30:
> compat.h:43:7: error: conflicting types for ?__xpg_basename?
>  char *basename(const char* path);
>        ^
> /home/thomas/projets/buildroot/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/libgen.h:34:14: note:
> previous declaration of ?__xpg_basename? was here
>  extern char *__xpg_basename (char *__path) __THROW;
>               ^
> make[2]: *** [Makefile:128: atomicio.o] Error 1
> make[1]: *** [package/pkg-generic.mk:224: /home/thomas/projets/
> buildroot/output/build/dropbear-2018.76/.stamp_built] Error 2
> make: *** [Makefile:79: _all] Error 2
>
> Could you have a look ?
>
>

The presence of crypt() is detected by the configure script.

in dropbear-2017-75/options.h, the logic was :
    /* This requires crypt() */
    #ifdef HAVE_CRYPT
    #define ENABLE_SVR_PASSWORD_AUTH
    #endif

in dropbear-2018-76/sysoptions.h, the logic is now :
    #if DROPBEAR_SVR_PASSWORD_AUTH && !HAVE_CRYPT
        #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
    #endif

So, without something like BR2_TOOLCHAIN_HAS_CRYPT,
we must always disable the option DROPBEAR_SVR_PASSWORD_AUTH in
localoptions.h.

Fran?ois


> Thanks!
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180328/fc34dbe1/attachment.html>
