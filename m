From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Dec 2015 23:31:59 +0100
Subject: [Buildroot] [PATCH] package/mke2img: set sparse_super for
 revision 1
In-Reply-To: <1440760370-61713-1-git-send-email-benoit@wsystem.com>
References: <1440760370-61713-1-git-send-email-benoit@wsystem.com>
Message-ID: <20151201223159.GA13900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, All,

On 2015-08-28 13:12 +0200, Beno?t Th?baudeau spake thusly:
> The sparse_super feature is more efficient in terms of speed and
> available space, so set it by default if supported, i.e. for revision 1.
> 
> This gives a huge speed gain for large resize2fs operations, especially
> for expansion.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mke2img/mke2img | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
> index 5e2f62f..806cb1f 100755
> --- a/package/mke2img/mke2img
> +++ b/package/mke2img/mke2img
> @@ -76,7 +76,7 @@ main() {
>  
>      # Upgrade to rev1 if needed
>      if [ ${rev} -ge 1 ]; then
> -        tune2fs_O_opts+=",filetype"
> +        tune2fs_O_opts+=",filetype,sparse_super"
>      fi
>  
>      # Add a journal for ext3 and above
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
