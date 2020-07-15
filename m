From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:36:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/zstd: fix build without st_mtime
In-Reply-To: <20200715192905.34773-1-fontaine.fabrice@gmail.com>
References: <20200715192905.34773-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715233656.13ce44a5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 21:29:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/be902c5d110f37bce622a2215191f155b7d3e7e0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied because the patch was merged upstream. However, I have one
suggestion below.

> diff --git a/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch b/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch
> new file mode 100644
> index 0000000000..0f735b8843
> --- /dev/null
> +++ b/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch
> @@ -0,0 +1,40 @@
> +From 26d01bdb26f1c7487ad4ba0151221dfe28cd878d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 15 Jul 2020 21:19:14 +0200
> +Subject: [PATCH] programs/util.c: fix build without st_mtime
> +
> +Since version 1.4.5 and commit
> +5af8cb7aea8d890b4801e50e5274371510f2cf33, if st_mtime is not defined,
> +programs/util.c uses utime without including utime.h which will raise
> +the following build failure on some of the buildroot autobuilders:

I don't think "on some of the buildroot autobuilders" is a very good
justification/explanation. Instead, the explanation should be "fails
with the musl C library", "fails on architecture XYZ because it defines
ABC differently".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
