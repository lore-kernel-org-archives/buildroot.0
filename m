From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 May 2018 09:49:59 +0200
Subject: [Buildroot] [PATCH 1/4] protobuf,
 python-protobuf: bump to v3.5.1
In-Reply-To: <20180521050550.11898-1-charles.hardin@storagecraft.com>
References: <20180521050550.11898-1-charles.hardin@storagecraft.com>
Message-ID: <20180521094959.64e1a59f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 May 2018 22:05:47 -0700, charles.hardin at storagecraft.com
wrote:
> From: Charles Hardin <charles.hardin@storagecraft.com>
> 
> Also, add a patch to compile for mips big endian
> in addition to mips little endian.
> 
> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>

This bump is already in the next branch:
https://git.buildroot.org/buildroot/commit/?h=next&id=454aa2da5e79ec8627f1d66ac640ec7bb04025dc.

> diff --git a/package/protobuf/0001-convert-mipsel-to-mips.patch b/package/protobuf/0001-convert-mipsel-to-mips.patch
> new file mode 100644
> index 0000000000..005d818d9d
> --- /dev/null
> +++ b/package/protobuf/0001-convert-mipsel-to-mips.patch
> @@ -0,0 +1,12 @@
> +diff -Naur protobuf-3.5.1.orig/src/google/protobuf/stubs/platform_macros.h protobuf-3.5.1/src/google/protobuf/stubs/platform_macros.h
> +--- protobuf-3.5.1.orig/src/google/protobuf/stubs/platform_macros.h	2017-12-20 23:07:13.000000000 +0000
> ++++ protobuf-3.5.1/src/google/protobuf/stubs/platform_macros.h	2018-05-21 03:46:58.580000399 +0000
> +@@ -56,7 +56,7 @@
> + #elif defined(__aarch64__)
> + #define GOOGLE_PROTOBUF_ARCH_AARCH64 1
> + #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
> +-#elif defined(__MIPSEL__)
> ++#elif defined(__mips__)
> + #if defined(__LP64__)
> + #define GOOGLE_PROTOBUF_ARCH_MIPS64 1
> + #define GOOGLE_PROTOBUF_ARCH_64_BIT 1

All patches require a description and Signed-off-by. Since upstream
uses Git as its version control system, the patch should be generated
using "git format-patch".

>  # When bumping this package, make sure to also verify if the
>  # python-protobuf package still works, as they share the same
>  # version/site variables.

While doing the bump, you missed this comment. No a big deal since the
bump has already been done, but I thought I should point this out.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
