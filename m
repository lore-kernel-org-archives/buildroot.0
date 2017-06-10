From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:08:43 +0200
Subject: [Buildroot] [PATCH 4/4] package/qt5/qt5webkit: needs host gcc
 >= 4.8 for icu support
In-Reply-To: <20170610091513.29031-2-bernd.kuhls@t-online.de>
References: <20170610091513.29031-1-bernd.kuhls@t-online.de>
 <20170610091513.29031-2-bernd.kuhls@t-online.de>
Message-ID: <20170610230843.0ce76b59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Jun 2017 11:15:13 +0200, Bernd Kuhls wrote:
> +	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> +		!BR2_HOST_GCC_AT_LEAST_4_8

You forgot to add a || here, so this patch causes a clear failure when
running "make menuconfig". I've fixed that before pushing of course,
but it would be nice if you could at least test your Config.in changes
by running "make menuconfig" :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
