From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:22:25 +0100
Subject: [Buildroot] [PATCH 02/15] toolchain/helpers: make LFS mandatory
 for uclibc
In-Reply-To: <1426270934-15499-3-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
 <1426270934-15499-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314222225.GG4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:22 -0300, Gustavo Zacarias spake thusly:
> As discussed on the mailing list drop the non-largefile option for
> toolchains.
> The size delta is minimal and it just complicates package dependencies.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(you can keep my rev-tag is you decide to go with my proposal in patch
1, to make the empty option name mean mandatory.)

Regards,
Yann E. MORIN.

> ---
>  toolchain/helpers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index ef657ee..c11e1d7 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -278,7 +278,7 @@ check_uclibc = \
>  	fi; \
>  	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
>  	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
> -	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
> +	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,m,$${UCLIBC_CONFIG_FILE},Large file support) ;\
>  	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
>  	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_NATIVE_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
>  	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
> -- 
> 2.0.5
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
