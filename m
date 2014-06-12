From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Jun 2014 23:41:09 +0200
Subject: [Buildroot] [PATCH] cosmo: disable package until upstream site
 is fixed
In-Reply-To: <1402608995-762-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402608995-762-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140612214109.GB3502@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-12 23:36 +0200, Thomas Petazzoni spake thusly:
> Fixes:
>   http://autobuild.buildroot.org/results/1ca/1ca98e95b106a948f1c0d0153a290ae1d9adb76d/

And so many more... :-/

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/cosmo/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/cosmo/Config.in b/package/cosmo/Config.in
> index cf5e123..869a107 100644
> --- a/package/cosmo/Config.in
> +++ b/package/cosmo/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_COSMO
>  	bool "cosmo"
>  	# run-time dependency
>  	select BR2_PACKAGE_LPEG
> +	# upstream site does not provide a valid archive
> +	depends on BROKEN
>  	help
>  	  Cosmo is a "safe templates" engine for Lua.
>  
> -- 
> 2.0.0
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
