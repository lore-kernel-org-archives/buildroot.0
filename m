From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Sep 2014 00:08:07 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-infra: put optional step_user def
 and assignment in one block
In-Reply-To: <1410578043-10682-1-git-send-email-danomimanchego123@gmail.com>
References: <1410578043-10682-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140914220807.GE21222@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-09-12 23:14 -0400, Danomi Manchego spake thusly:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Like the manual says in 'The .mk file' section ...
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d04fd36..4b6d818 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -56,11 +56,11 @@ endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  
>  # User-supplied script
> +ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>  define step_user
>  	@$(foreach user_hook, $(BR2_INSTRUMENTATION_SCRIPTS), \
>  		$(EXTRA_ENV) $(user_hook) "$(1)" "$(2)" "$(3)"$(sep))
>  endef
> -ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>  GLOBAL_INSTRUMENTATION_HOOKS += step_user
>  endif
>  
> -- 
> 1.9.1
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
