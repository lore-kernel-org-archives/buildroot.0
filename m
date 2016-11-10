From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 11:00:02 +0100
Subject: [Buildroot] [PATCH v2 0/4] configs: atmel: update of old boards
In-Reply-To: <20161110070538.7193-1-ludovic.desroches@atmel.com>
References: <20161110070538.7193-1-ludovic.desroches@atmel.com>
Message-ID: <20161110110002.7551f857@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 08:05:34 +0100, Ludovic Desroches wrote:

> Ludovic Desroches (4):
>   configs: atmel: at91sam9260eknf: update defconfig
>   configs: atmel: at91sam9rlek: update defconfig
>   configs: atmel: at91sam9g20dfc: update defconfig
>   configs: atmel: at91sam9g45m10ek: update defconfig

Thanks a lot, I've applied all four patches to master. Two things were
missing (but I fixed them when applying):

 1. A line BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y that tells that
    the kernel headers series is 4.8. This was working because 4.8 is
    our default kernel header series, but it would have started
    breaking when bumping the default kernel header series to 4.9.

 2. A note in the commit log that says it's needed to fix the build to
    gcc 5.x, which is the reason for committing those bumps to master
    (while normally we don't accept bumps in master once -rc1 is
    released).

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
