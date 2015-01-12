From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Jan 2015 22:17:13 +0100
Subject: [Buildroot] [PATCH 1/2] linux/linux.mk: added https:// pattern
 for kernel patches
In-Reply-To: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
References: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
Message-ID: <20150112211713.GA9000@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivo, All,

On 2015-01-12 17:37 +0100, Ivo Slanina spake thusly:
> Patches located at https:// scheme URL were threated as directories,
> causing build failures.
> 
> Fixed by adding https:// pattern.
> 
> Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>

Yep, sounds legit. ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 680521c..d02b02b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -147,7 +147,7 @@ endif # BR2_LINUX_KERNEL_VMLINUX
>  define LINUX_DOWNLOAD_PATCHES
>  	$(if $(LINUX_PATCHES),
>  		@$(call MESSAGE,"Download additional patches"))
> -	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCHES)),\
> +	$(foreach patch,$(filter ftp://% http://% https://%,$(LINUX_PATCHES)),\
>  		$(call DOWNLOAD,$(patch))$(sep))
>  endef
>  
> @@ -155,7 +155,7 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
>  
>  define LINUX_APPLY_PATCHES
>  	for p in $(LINUX_PATCHES) ; do \
> -		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
> +		if echo $$p | grep -q -E "^ftp://|^http://|^https://" ; then \
>  			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` ; \
>  		elif test -d $$p ; then \
>  			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch ; \
> -- 
> 1.7.10.4
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
