From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:59:03 +0100
Subject: [Buildroot] [PATCH 1/3] libsigrok: bump version to 0.5.1
In-Reply-To: <20181230101641.GD14286@scaer>
References: <20181117141203.19695-1-brgl@bgdev.pl>
 <20181230101641.GD14286@scaer>
Message-ID: <20181231155903.07e4ae51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 11:16:41 +0100, Yann E. MORIN wrote:

> You forgot to propagate this new dependency to at least sigrock-cli,
> which selects libsigrok:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBSIGROK
>   Depends on [n]: BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_ENABLE_LOCALE [=n] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_SIGROK_CLI [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y]

Thanks for the report, I fixed that in sigrok-cli and pulseview. I
guess we don't have a toolchain that has all these features, but not
locale support in our autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
