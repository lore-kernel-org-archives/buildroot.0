From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 17 Nov 2020 22:36:23 +0000
Subject: [Buildroot] [PATCH v1] package/libcamera: fix
 BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling
In-Reply-To: <20201117212519.7559-1-ps.report@gmx.net>
References: <20201117212519.7559-1-ps.report@gmx.net>
Message-ID: <df6d1be3-f447-1cb2-b495-af7335c59f62@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 17/11/2020 21:25, Peter Seiderer wrote:
> Fix BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS handling, change from
> 'depends on BR2_m68k' to 'depends on !BR2_m68k'.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libcamera/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index aadea56d19..b9c243084e 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
>  	bool
>  	default y
>  	# Invalid packing size of ControlValue struct on m68k
> -	depends on BR2_m68k
> +	depends on !BR2_m68k

Oh dear, this was definitely negated in the patch I submitted [0], but
looks like it landed as this in [1], which was incorrect.

[0]
https://lists.libcamera.org/pipermail/libcamera-devel/2020-September/012519.html

[1]
https://git.buildroot.net/buildroot/commit/?id=66526e3518e01a3fe16dede165c7890d194b7816

Fix looks good to me.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


>  
>  menuconfig BR2_PACKAGE_LIBCAMERA
>  	bool "libcamera"
> 

-- 
Regards
--
Kieran
