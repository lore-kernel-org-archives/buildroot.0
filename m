From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 09:25:10 +0200
Subject: [Buildroot] [PATCH] parted: fix minor()/major() build failure
 due to glibc 2.28
In-Reply-To: <20180909172917.55169-1-giulio.benetti@micronovasrl.com>
References: <20180909172917.55169-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180910092510.66b51de5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 19:29:17 +0200, Giulio Benetti wrote:

> diff --git a/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch b/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch
> new file mode 100644
> index 0000000000..63dda4c4ff
> --- /dev/null
> +++ b/package/parted/0005-libparted-include-sys-sysmacros.h-to-compile-with-gl.patch
> @@ -0,0 +1,33 @@
> +From 715e3e937536326af272c45a86cc3765f00297f7 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Sun, 9 Sep 2018 19:19:19 +0200
> +Subject: [PATCH] libparted: include <sys/sysmacros.h> to compile with
> + glibc-2.28
> +
> +glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> +and therefore <sys/sysmacros.h> must be included explicitly when
> +major()/minor() are used.
> +
> +Include <sys/sysmacros.h> into libparted/arch/linux.c where minor() and
> +major() macros are used.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Please backport upstream commit
ba5e0451b51c983e40afd123b6e0d3eddb55e610 instead of coming up with your
one fix. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
