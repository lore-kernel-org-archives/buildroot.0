From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:46:14 +0200
Subject: [Buildroot] [PATCH] make: Include patch for gl_lstat support
In-Reply-To: <20190401002208.16062-1-sam@mendozajonas.com>
References: <20190401002208.16062-1-sam@mendozajonas.com>
Message-ID: <20190401224614.7a2e9501@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,

On Mon,  1 Apr 2019 11:22:08 +1100
Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:

> Include upstream commit 193f1e8 "glob: Do not assume glibc glob
> internals". Without this if building glibc with host-make it will fail
> with a segfault in make:
> 
> >>> glibc glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1 Building  
> PATH="/scratch/builds/host-make/host/bin:/scratch/builds/host-make/host/sbin:/home/sam/bin:/home/sam/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"  /scratch/builds/host-make/host/bin/host-make -j25  -C /scratch/builds/host-make/build/glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1/build
> /scratch/builds/host-make/host/bin/host-make -r PARALLELMFLAGS="" -C /scratch/builds/host-make/build/glibc-glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1 objdir=`pwd` all
> Segmentation fault (core dumped)
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Thanks for the patch. A minor nit on the commit title, it should be:

	package/make: include patch for gl_lstat support

i.e package/make as prefix, and start with a lower-case letter.

> diff --git a/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch b/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
> new file mode 100644
> index 0000000000..236a936d5b
> --- /dev/null
> +++ b/package/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
> @@ -0,0 +1,67 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001

Weird From value. How did you generate this patch ?

> +From: Paul Eggert <eggert@cs.ucla.edu>
> +Date: Sun, 24 Sep 2017 09:12:58 -0400
> +Subject: [PATCH] glob: Do not assume glibc glob internals.
> +
> +It has been proposed that glibc glob start using gl_lstat,
> +which the API allows it to do.  GNU 'make' should not get in
> +the way of this.  See:
> +https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
> +
> +* dir.c (local_lstat): New function, like local_stat.
> +(dir_setup_glob): Use it to initialize gl_lstat too, as the API
> +requires.

We need you to add your Signed-off-by here, as well as a pointer to the
corresponding upstream commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
