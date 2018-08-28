From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:53:20 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/aircrack-ng: powerpc
 arch requires altivec"
In-Reply-To: <1535411668-36286-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535411668-36286-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1535411668-36286-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180828235320.79831d3a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Aug 2018 18:14:28 -0500, Matt Weber wrote:
> This reverts commit 1f3f1fb8c7324c9a50383b1cafcbd2f9d74a91f9.
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/aircrack-ng/Config.in | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
> index d821c5a..f3e2bc4 100644
> --- a/package/aircrack-ng/Config.in
> +++ b/package/aircrack-ng/Config.in
> @@ -4,9 +4,6 @@ config BR2_PACKAGE_AIRCRACK_NG
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
> -	# https://github.com/aircrack-ng/aircrack-ng/issues/1941
> -	depends on BR2_POWERPC_CPU_HAS_ALTIVEC || \
> -		!(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)

This revert made me realize that the commit itself was wrong: this
architecture dependency had not been propagated to the Config.in
comment in the same file.

But with the revert, this is obviously no longer relevant.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
