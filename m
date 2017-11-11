From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:22:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: fix fenv build failure
 on ARCv2 with glibc
In-Reply-To: <20171111162242.15110-2-bernd.kuhls@t-online.de>
References: <20171111162242.15110-1-bernd.kuhls@t-online.de>
 <20171111162242.15110-2-bernd.kuhls@t-online.de>
Message-ID: <20171111232242.7e90bd33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Nov 2017 17:22:42 +0100, Bernd Kuhls wrote:

> +	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
> +	depends on !BR2_archs38 || !BR2_TOOLCHAIN_USES_GLIBC

I've changed this to:

	depends on !(BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC)

which IMO is easier to read as it match the human way of expressingthe
dependency: "not available on ARC HS38 with glibc".

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
