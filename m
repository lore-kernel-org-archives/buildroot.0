From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 23:07:36 +0200
Subject: [Buildroot] [PATCHv2 13/21] Makefile: implement a package based
 source-check target
In-Reply-To: <1428856685-4403-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150413210736.GM29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> This commit switches the implementation of the global source-check
> target to use a package infrastructure based mechanism, using the
> $(1)-all-source-check target added in the previous commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested against a randpackageconfig]

Regards,
Yann E. MORIN.

> ---
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6937dd3..7d94ee8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -617,8 +617,7 @@ external-deps:
>  	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
>  
>  # check if download URLs are outdated
> -source-check:
> -	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
> +source-check: $(foreach p,$(PACKAGES),$(p)-all-source-check)
>  
>  legal-info-clean:
>  	@rm -fr $(LEGAL_INFO_DIR)
> -- 
> 2.1.0
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
