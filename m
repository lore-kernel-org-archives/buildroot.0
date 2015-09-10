From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Sep 2015 19:17:37 +0200
Subject: [Buildroot] [PATCH] system: make systemd's kernel headers
 comment fit
In-Reply-To: <1441904157-19302-1-git-send-email-arnout@mind.be>
References: <1441904157-19302-1-git-send-email-arnout@mind.be>
Message-ID: <20150910171737.GA6584@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-09-10 18:55 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The comment line that explains that systemd needs a glibc toolchain and
> kernel headers >= 3.10 doesn't fit in the dialog box, which makes it
> look as if headers >= 3.1 are needed.
> 
> Abbreviate the comment a little by removing an 'an'. It still doesn't
> fit completely (only one trailing * is shown), but at least it's
> readable.
> 
> While we're at it, change the quoting style to " like we always use.
> 
> Reported-by: eschu on IRC
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  system/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/system/Config.in b/system/Config.in
> index fad829d..03521fd 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -90,7 +90,7 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
>  	select BR2_PACKAGE_SYSTEMD
>  
> -comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
> +comment "systemd needs (e)glibc toolchain, headers >= 3.10"
>  	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
>  		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
>  
> -- 
> 2.5.1
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
