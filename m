From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 12:05:18 +0200
Subject: [Buildroot] [PATCH] package/openal: bump to version 1.20.1
In-Reply-To: <20200411135832.20507-1-nerv@dawncrow.de>
References: <20200411135832.20507-1-nerv@dawncrow.de>
Message-ID: <20200412120518.20193925@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 15:58:32 +0200
Andr? Hentschel <nerv@dawncrow.de> wrote:

> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/openal/Config.in   | 8 +++++---
>  package/openal/openal.hash | 2 +-
>  package/openal/openal.mk   | 2 +-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/openal/Config.in b/package/openal/Config.in
> index a564156555..d129906d2c 100644
> --- a/package/openal/Config.in
> +++ b/package/openal/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
>  
>  config BR2_PACKAGE_OPENAL
>  	bool "openal"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14

This new option needs to be propagated to the reverse dependencies of
BR2_PACKAGE_OPENAL. For example, BR2_PACKAGE_MINETEST_SOUND selects
BR2_PACKAGE_OPENAL without having the gcc >= 5 dependency.

Could you analyze the different places where BR2_PACKAGE_OPENSL is
selected, and make sure to propagate this new dependency ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
