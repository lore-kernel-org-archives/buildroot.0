From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 10:13:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/cmake: disable on unsupported
 architectures
In-Reply-To: <1426583299-21207-1-git-send-email-s.martin49@gmail.com>
References: <1426583299-21207-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150317101353.4db3fda2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 17 Mar 2015 10:08:18 +0100, Samuel Martin wrote:

> diff --git a/package/cmake/Config.in b/package/cmake/Config.in
> index 0b5bba9..eee2461 100644
> --- a/package/cmake/Config.in
> +++ b/package/cmake/Config.in
> @@ -10,6 +10,12 @@ config BR2_PACKAGE_CMAKE_CTEST
>  	select BR2_PACKAGE_EXPAT
>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_XZ
> +	depends on !BR2_arcle && !BR2_arceb
> +	depends on !BR2_bfin
> +	depends on !BR2_microblazeel && !BR2_microblazebe
> +	depends on !BR2_nios2
> +	depends on !BR2_sh && !BR2_sh64
> +	depends on !BR2_xtensa

So maybe we should have a positive test instead?

	depends on BR2_arm || BR2_armeb || BR2_...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
