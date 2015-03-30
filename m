From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 23:43:58 +0200
Subject: [Buildroot] [PATCH 22/35] Makefile: use the package infra based
 external-deps
In-Reply-To: <1427650429-9293-23-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-23-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150330214358.GK4318@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> This commit changes the global 'external-deps' target to use the newly
> introduced per-package <pkg>-all-external-deps, instead of relying on
> the 'source' target with a custom DL_MODE.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Still our incorrect dependencies showing up, though; but expected...

Regards,
Yann E. MORIN.

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 0709751..8fca4b8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -617,8 +617,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>  
>  source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
>  
> +_external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
>  external-deps:
> -	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
> +	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
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
