From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 09:59:29 +0200
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
Message-ID: <20160726095929.63583d2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 07:00:37 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
> http://autobuild.buildroot.net/results/964/964d8f694bc7d05b35411eabfbadf40bbf6337ae/
> http://autobuild.buildroot.net/results/0f2/0f2cddf89af3ad4330556acd04ab6cb080370e24/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ipkg/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ipkg/Config.in b/package/ipkg/Config.in
> index 4b2078d9cd70..d93e1d17b3dd 100644
> --- a/package/ipkg/Config.in
> +++ b/package/ipkg/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_IPKG
>  	bool "ipkg"
> +	depends on BR2_USE_MMU # fork()

I think this needs more investigation, because:

BR2_bfin=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_IPKG=y
# BR2_TARGET_ROOTFS_TAR is not set

which is a noMMU configuration, is able to build ipkg just fine.



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
