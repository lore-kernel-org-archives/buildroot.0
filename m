From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 26 Apr 2013 09:25:33 +0200
Subject: [Buildroot] [PATCH v2 1/3] post-build: show each script
 filename before execution
In-Reply-To: <87zjwnadmz.fsf@dell.be.48ers.dk>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
 <1365439816-6935-2-git-send-email-luca@lucaceresoli.net>
 <87zjwnadmz.fsf@dell.be.48ers.dk>
Message-ID: <517A2BED.1010304@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
>   Luca> This also simplifies code by removing the ifneq/endif clauses.
>   Luca> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>   Luca> ---
>   Luca>  Makefile |    4 +---
>   Luca>  1 file changed, 1 insertion(+), 3 deletions(-)
>
>   Luca> diff --git a/Makefile b/Makefile
>   Luca> index c95bb1e..75f0f0c 100644
>   Luca> --- a/Makefile
>   Luca> +++ b/Makefile
>   Luca> @@ -509,11 +509,9 @@ endif
>   Luca>  			$${dir}/ $(TARGET_DIR); \
>   Luca>  	done
>   
>   Luca> -ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
>   Luca> -	@$(call MESSAGE,"Executing post-build script\(s\)")
>   Luca>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>   Luca> +		$(call MESSAGE,"Executing  post-build script $(s)"); \
>   Luca>  		$(s) $(TARGET_DIR)$(sep))
>
> Double space after 'executing'. Committed with that fixed, thanks.

Ouch, thanks.

Luca
