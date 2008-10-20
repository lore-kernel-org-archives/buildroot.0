From: Daniel Laird <danieljlaird@hotmail.com>
Date: Mon, 20 Oct 2008 14:55:11 +0100
Subject: [Buildroot] Feedback ?
In-Reply-To: <20081020154814.060a5b95@surf>
References: <20081015164737.51a662cf@surf> <20081020154814.060a5b95@surf>
Message-ID: <COL102-DS15285F90B8DFC443910CB4DC2F0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would like this patch as I have a number of packages that have this change added also (but on a package by package patch).

I am slightly afraid to just throw it into buildroot.  
If anyone has any feedback on this, that would be appreciated before I submit the change into buildroot as I think this is a good change.

Many thanks 
Daniel Laird

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Thomas Petazzoni
Sent: 2008 Oct 20 14:48
To: buildroot at uclibc.org
Subject: [Buildroot] Feedback ?

Le Wed, 15 Oct 2008 16:47:37 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Make sure libraries are visible when building packages
> 
> This patch adds an LDFLAGS variable before calling the configure
> script of any package, in order to fix two problems :
> 
>  * Some configure scripts were not able to compile the test programs
>    used to test whether zlib was properly installed. The configure
>    scripts are properly using -lz, but the
>    -L/path/to/staging_dir/usr/lib option was not present, leading to
>    build failure.
> 
>  * While linking applications, for example the applications included
> in the fontconfig package, I had build failures like :
> 
> /usr/local/uclibc-0.9.28-2/arm/lib/gcc/arm-linux-uclibc/3.4.5/../../../../arm-linux-uclibc/bin/ld.real:
> warning: libfreetype.so.6, needed by ../src/.libs/libfontconfig.so,
> not found (try using -rpath or -rpath-link)
> 
>     this is due to the fact that ld is not able to find the other
>     already installed shared libraries.

May I have some feedback on this patch ? Without this, Buildroot is
just unusable here.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
