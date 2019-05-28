From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 09:54:52 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: GCC bug 68485
In-Reply-To: <20190527210510.70987-1-giulio.benetti@micronovasrl.com>
References: <20190527210510.70987-1-giulio.benetti@micronovasrl.com>
Message-ID: <126c5b6d-430f-671e-86e4-c8341aad5844@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/05/2019 23:05, Giulio Benetti wrote:
> GCC <= 9.x hangs while building brotli for the Microblaze Arch:
> http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/
> 
> Reported:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
> 
> Still not fixed. Every Microblaze Gcc version <= 9.x is affected.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

 Applied to master (with a little rewording of the commit message), thanks.

 I should have noticed that this was missing :-(

 Regards,
 Arnout

> ---
>  toolchain/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 829ecd442a..d01a96f8a8 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -131,6 +131,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>  	default y if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
> +# exists in gcc 9.x
> +config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
> +	bool
> +	default y if BR2_microblaze
> +
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
>  # longer exists in gcc 8.x.
>  config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
> 
