From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2019 23:08:20 +0100
Subject: [Buildroot] [PATCH] systemd: Remove instance name usage in a
 non-template unit file
In-Reply-To: <BL0PR0102MB341236C6A4CD78A8F7710AC5F37D0@BL0PR0102MB3412.prod.exchangelabs.com>
References: <BL0PR0102MB341236C6A4CD78A8F7710AC5F37D0@BL0PR0102MB3412.prod.exchangelabs.com>
Message-ID: <38ec152c-e716-eadd-1fb6-f79ef46565dd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/02/2019 17:35, Gervais, Francois wrote:
> Getty startup can fail due to the instance name specifier
> being used in a non-template unit file.
> 
> Fixes:
> No getty prompt on boot
> 
> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>

 Applied to master, thanks. I've extended the commit message a little to explain
what exactly goes wrong.

 Peter, this applies to 2018.11.x as well. Not to 2018.02.x.

 Regards,
 Arnout

> ---
>  package/systemd/0001-fix-getty-unit.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
> index d546e1ab32..a12569f493 100644
> --- a/package/systemd/0001-fix-getty-unit.patch
> +++ b/package/systemd/0001-fix-getty-unit.patch
> @@ -30,7 +30,7 @@ index 3c553240a..fd5ad9456 100644
>   # option to preserve environment (-p), followed by '--' for safety, and then
>   # the entered username.
>  -ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud console 115200,38400,9600 $TERM
> -+ExecStart=-/sbin/getty -L %I 115200 vt100
> ++ExecStart=-/sbin/getty -L console 115200 vt100
>   Type=idle
>   Restart=always
>   UtmpIdentifier=cons
> 
