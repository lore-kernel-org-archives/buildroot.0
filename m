From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 15:28:45 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix mips64 compile
In-Reply-To: <20181108230814.4773-1-ps.report@gmx.net>
References: <20181108230814.4773-1-ps.report@gmx.net>
Message-ID: <20181128152845.7b9d1904@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Nov 2018 00:08:14 +0100, Peter Seiderer wrote:

> diff --git a/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch b/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
> new file mode 100644
> index 0000000000..75874fe7fd
> --- /dev/null
> +++ b/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
> @@ -0,0 +1,58 @@
> +From a4584ead274388b91b05b94bad2452a5f0ad3530 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Thu, 8 Nov 2018 23:55:30 +0100
> +Subject: [PATCH] configure.ac: disable gcc march mips64r2 detection
> +
> +Disable gcc march mips64r2 detection, compile flags already
> +set by buildroot, fixes [1]:
> +
> +  error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor
> +
> +[1] http://autobuild.buildroot.net/results/34f6e2352f1559f98c724fe5394db0035b42ddb1
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + configure.ac | 24 ++++++++++++------------
> + 1 file changed, 12 insertions(+), 12 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index c18ae5f2a..70bfe1bb6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1769,21 +1769,21 @@ case "${host_cpu}" in
> + 
> + 
> +         # does this compiler support -march=mips64r2 (mips64r2 default) ?
> +-        AC_MSG_CHECKING([if gcc accepts -march=mips64r2 -mabi=64])
> ++        #AC_MSG_CHECKING([if gcc accepts -march=mips64r2 -mabi=64])

Commenting out code in a patch is not very useful, removing it is
easier/simpler, so I changed this to just remove the problematic code.

>  VALGRIND_INSTALL_STAGING = YES
> +# Patch 0001-configure.ac-disable-gcc-march-mips64r2-detection.patch

Actually it's patch 0003, so I fixed that as well.

Applied to master with those minor issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
