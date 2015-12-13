From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 19:05:32 +0100
Subject: [Buildroot] [PATCH] package/netsniff: fix missing depend on
 statements
In-Reply-To: <1450023577-5019-1-git-send-email-s.martin49@gmail.com>
References: <1450023577-5019-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20151213190532.3fc1ab96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 13 Dec 2015 17:19:37 +0100, Samuel Martin wrote:
> Add missing architecture dependencies inherited from liburcu.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/0a9/0a90d7c8f523b90b8a4ca6312ab4835547590fb2/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/netsniff-ng/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
> index 8c48f39..65b2a0f 100644
> --- a/package/netsniff-ng/Config.in
> +++ b/package/netsniff-ng/Config.in
> @@ -11,14 +11,17 @@ config BR2_PACKAGE_NETSNIFF_NG
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64 # liburcu

The list of architecture dependencies from liburcu is already
duplicated in liburcu (two times), in lttng-libust (two times),
lttng-tools (two times) and now in netsniff (three times).

Isn't it time to switch to BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
