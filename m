From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Apr 2013 16:29:13 +0200
Subject: [Buildroot] [PATCH] Allow extra options to be passed to ubifs
 creation tools
In-Reply-To: <5134BD81.1070406@mimc.co.uk>
References: <5134BD81.1070406@mimc.co.uk>
Message-ID: <20130423162913.7f42ef7f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mark Jackson,

It would be good if the commit title was:

	fs/ubifs: allow extra options to be passed to ubifs creation tools

On Mon, 04 Mar 2013 15:28:01 +0000, Mark Jackson wrote:
> Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
> ---
>  fs/ubifs/Config.in |   14 ++++++++++++++
>  fs/ubifs/ubi.mk    |    2 ++
>  fs/ubifs/ubifs.mk  |    4 +++-
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
> index a5ef5f2..f707737 100644
> --- a/fs/ubifs/Config.in
> +++ b/fs/ubifs/Config.in
> @@ -77,6 +77,13 @@ config BR2_TARGET_ROOTFS_UBIFS_LZMA
>  
>  endchoice
>  
> +config BR2_TARGET_ROOTFS_UBIFS_OPTS
> +	string "Additional mkfs.ubifs options"
> +	default ""

I believe that the default "" is not needed, since this is the default
(empty value).

> +	depends on BR2_TARGET_ROOTFS_UBIFS

If you have some time, you could send a follow-up patch that factorizes
all the "depends on BR2_TARGET_ROOTFS_UBIFS" by enclosing the UBI
options in a "if BR2_TARGET_ROOTFS_UBIFS .. endif" block. But if you do
it, do it as a separate patch.

> +	help
> +	  Any additional mkfs.ubifs options you may want to include.
> +
>  config BR2_TARGET_ROOTFS_UBI
>  	depends on BR2_TARGET_ROOTFS_UBIFS
>  	bool "Embed into an UBI image"
> @@ -98,3 +105,10 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
>  	help
>  	  Tells ubinize that the flash supports sub-pages and the sub-page
>  	  size. Use 0 if subpages are not supported on flash chip.
> +
> +config BR2_TARGET_ROOTFS_UBI_OPTS
> +	string "Additional ubinize options"
> +	default ""

Ditto for default.

> +	depends on BR2_TARGET_ROOTFS_UBI

... and for the separate patch to factor out the depends on here.

Once the minor details above (title and removal of default "") are
fixed, you can resend a v2 with my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
