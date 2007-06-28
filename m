From: Tom <fivemiletom@gmail.com>
Date: Thu, 28 Jun 2007 11:17:05 -0700
Subject: [Buildroot] Compilation of buildroot on cygwin gives problem
In-Reply-To: <b85b23590706272341n15bc030bjccfe446f4049215@mail.gmail.com>
References: <b85b23590706272341n15bc030bjccfe446f4049215@mail.gmail.com>
Message-ID: <4683FB21.6080408@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Harshal,

no worries that the cross gcc is not there at that point, that is fine. 
To solve your problem, try the patch which is in the attached email to 
this group.



harshal shete wrote:
> Hi group,
> 
> This is my first mail so please forgive me if i am unknowingly broke 
> some rules.
> actually i am trying to compile buildroot on windows with the help of 
> cygwin.
> 
> i have deselected rootfs and busybox options from make menuconfig.
> and selected appropriate processor (arm) and variant (arm920t).
> gcc and gdb (host) version is also selected.
> 
> uclibc option is selected as daily snapshot but while compilation i get 
> the error
> + make -C /cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc 
> PREFIX=/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc_dev/ 
> DEVEL_PREFIX=/usr/ 
> RUNTIME_PREFIX=/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc_dev/ 
> HOSTCC=gcc pregen install_dev
> /bin/sh: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> No such file or directory
> make[1]: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> Command not found
> make[1]: Entering directory 
> `/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc'
> make[1]: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> Command not found
> make[1]: Entering directory 
> `/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc'
> /bin/sh: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> No such file or directory
> make[2]: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> Command not found
> make[2]: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> Command not found
> /bin/sh: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> No such file or directory
> make[2]: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> Command not found
> make[2]: 
> /cygdrive/e/buildroot/buildroot/build_arm/staging_dir/bin/arm-linux-uclibc-gcc: 
> Command not found
> conf.o:conf.c:(.text+0xb2): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0xc6): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0xda): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0xf2c): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0x10c5): undefined reference to `_libintl_gettext'
> conf.o:conf.c:(.text+0x116f): more undefined references to 
> `_libintl_gettext' follow
> collect2: ld returned 1 exit status
> make[2]: *** [conf] Error 1
> make[1]: *** [extra/config/conf] Error 2
> make: *** 
> [/cygdrive/e/buildroot/buildroot/toolchain_build_arm/uClibc/.configured] 
> Error 2
> 
> So if anyone has faced the same situation then please tell me the 
> workaround..
> do i need to change some Makefiles?
> because i tink it is demanding for arm-linux-uclibc-gcc before creating it.
> Please help me out of this.
> 
> Thanks and regards
> Harshal shete
> 
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An embedded message was scrubbed...
From: Tom <fivemiletom@gmail.com>
Subject: Re: [Buildroot] mpfr error on cygwin for arm
Date: Fri, 01 Jun 2007 13:32:06 -0700
Size: 4179
Url: http://busybox.net/lists/buildroot/attachments/20070628/0288bf9b/attachment-0001.eml 
