From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 18:54:32 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/xenomai: clean up wrappers
 cleanup
In-Reply-To: <740557da18601121db22a52afb494063a7184bc6.1576743874.git.jan.kiszka@siemens.com>
References: <cover.1576743874.git.jan.kiszka@siemens.com>
 <740557da18601121db22a52afb494063a7184bc6.1576743874.git.jan.kiszka@siemens.com>
Message-ID: <20191219175432.GK26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2019-12-19 09:24 +0100, Jan Kiszka spake thusly:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> There is no posix.wrappers anymore, but cobalt and modechk. Those only
> play a role when building in combination with wrap-link.sh.

If that change already existed with the current 3.0.9, then this patch
should come before current patch 2.

If the change was done in 3.0.10, then this patch should be folded with
patch 2, which introduces 3.0.10.

In any case, it must come before the patch that introduces the from-git
posibility, which should be last.

No need to respin if there only re-ordering; just reply and I can do th
reordering appropriately.

Regards,
Yann E. MORIN.

> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  package/xenomai/xenomai.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index df7ca69f45..d7fc0e42ed 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -70,6 +70,9 @@ define XENOMAI_REMOVE_UNNEEDED_FILES
>  	for i in xeno xeno-config xeno-info wrap-link.sh ; do \
>  		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
>  	done
> +	for i in cobalt modechk ; do \
> +		rm -f $(TARGET_DIR)/usr/lib/$$i.wrappers ; \
> +	done
>  	for i in autotune corectl hdb rtnet nomaccfg rtcfg rtifconfig \
>  		rtiwconfig rtping rtroute tdmacfg rtps slackspot version; do \
>  		rm -f $(TARGET_DIR)/usr/sbin/$$i ; \
> @@ -129,9 +132,6 @@ XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
>  define XENOMAI_REMOVE_SKINS
>  	for i in $(XENOMAI_REMOVE_LIBS_LIST) ; do \
>  		rm -f $(TARGET_DIR)/usr/lib/lib$$i.* ; \
> -		if [ $$i == "posix" ] ; then \
> -			rm -f $(TARGET_DIR)/usr/lib/posix.wrappers ; \
> -		fi ; \
>  	done
>  endef
>  
> -- 
> 2.16.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
