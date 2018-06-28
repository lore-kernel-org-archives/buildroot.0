From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:22:42 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] pixiewps: fix static linking with uclibc-ng
In-Reply-To: <20180610181104.19619-1-fontaine.fabrice@gmail.com>
References: <20180610181104.19619-1-fontaine.fabrice@gmail.com>
Message-ID: <20180628222242.6877ba7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 20:11:04 +0200, Fabrice Fontaine wrote:
> Fixes following linking error with uClibc-ng:
> /home/peko/autobuild/instance-0/output/host/lib/gcc/powerpc-buildroot-linux-uclibc/7.3.0/libgcc.a(unwind-dw2-fde-dip.o):
> In function `_Unwind_Find_FDE':
> /home/peko/autobuild/instance-0/output/build/host-gcc-final-7.3.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469:
> undefined reference to `dl_iterate_phdr'
> collect2: error: ld returned 1 exit status
> 
> Since uClibc-ng 1.0.18 a circular dependency between libc and libgcc
> exist, when static linking is used. It can be resolved by the compiler
> when -static is correctly passed in the linking step.
> 
> So use TARGET_CONFIGURE_OPTS to pass CC as well as LDFLAGS to make
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d9f0311538c8db1196839e36af3f6ef4e403be2b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Remove PIXIEWPS_MAKE_OPTS to use directly TARGET_CONFIGURE_OPTS

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
