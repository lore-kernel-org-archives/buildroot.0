From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:06:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: fix comment
 dependencies
In-Reply-To: <1417727462-10875-1-git-send-email-romain.naour@openwide.fr>
References: <1417727462-10875-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141207220617.63156059@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu,  4 Dec 2014 22:11:02 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/binutils/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/binutils/Config.in b/package/binutils/Config.in
> index 50c38b6..fb037ef 100644
> --- a/package/binutils/Config.in
> +++ b/package/binutils/Config.in
> @@ -22,5 +22,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
>  endif
>  
>  comment "binutils needs a toolchain w/ wchar"
> -	depends on !BR2_aarch64 && !BR2_nios2
> -	depends on BR2_USE_WCHAR
> +	depends on !BR2_aarch64 || !BR2_nios2

I've kept that one as it was, as explained by Yann.

> +	depends on !BR2_USE_WCHAR

Committed, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
