From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:54:01 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python3: add optional
 dependency to gettext
In-Reply-To: <20200405142823.836514-1-bernd.kuhls@t-online.de>
References: <20200405142823.836514-1-bernd.kuhls@t-online.de>
Message-ID: <20200411105401.758cde33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Apr 2020 16:28:22 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Tested using this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_SYSTEM_ENABLE_NLS=y
> BR2_PACKAGE_PYTHON3=y
> 
> Without this patch:
> $ readelf -a output/target/usr/lib/libpython3.8.so.1.0 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> With this patch:
> $ readelf -a output/target/usr/lib/libpython3.8.so.1.0 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: unchanged, added to series

I was hesitating between applying this, and using
TARGET_NLS_DEPENDENCIES. But after looking a bit deeper, Python doesn't
really use a standard NLS support, it really checks specifically for
libintl, so I've applied your patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
