From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 11:27:57 +0200
Subject: [Buildroot] [PATCH 2/2] liburcu: needs MMU
In-Reply-To: <5feff8d883fff7c5e9929d9b191d776c27de3cfa.1476867634.git.baruch@tkos.co.il>
References: <ef30f526d3d31123695b867262dac86030da8af2.1476867634.git.baruch@tkos.co.il>
 <5feff8d883fff7c5e9929d9b191d776c27de3cfa.1476867634.git.baruch@tkos.co.il>
Message-ID: <20161019112757.483622d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 12:00:34 +0300, Baruch Siach wrote:

> diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
> index 49510da4956c..915b17ab9d6d 100644
> --- a/package/liburcu/Config.in
> +++ b/package/liburcu/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  config BR2_PACKAGE_LIBURCU
>  	bool "liburcu"
>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> +	depends on BR2_USE_MMU # fork() in test

You want to put this in BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS so that you
don't have to propagate it to reverse dependencies of liburcu (which
BTW your patch forgot to do).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
