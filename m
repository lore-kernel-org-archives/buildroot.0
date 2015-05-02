From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 23:54:33 +0200
Subject: [Buildroot] [PATCH] toolchain/external: better report RPC error
 for custom toolchains
In-Reply-To: <1430601397-2268-1-git-send-email-yann.morin.1998@free.fr>
References: <1430601397-2268-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55454799.9000003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 23:16, Yann E. MORIN wrote:
> Currently, we instruct users to enable/disable BR2_TOOLCHAIN_HAS_NATIVE_RPC
> but that is a blind option. The only option users can set/unset is
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC.
> 
> Use that in the error message.
> 
> Notes: the only way for this message to appear is for a custom external
> toolchain, either downloaded or pre-installed, so even though we check
> the vailidity of the toolchain with BR2_TOOLCHAIN_HAS_NATIVE_RPC, we do
      validity

> report on BR2_TOOLCHAIN_EXTERNAL_INET_RPC.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  toolchain/helpers.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index cb3b61a..30eb065 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -197,11 +197,11 @@ check_glibc_feature = \
>  check_glibc_rpc_feature = \
>  	IS_IN_LIBC=`test -f $(1)/usr/include/rpc/rpc.h && echo y` ; \
>  	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" != "y" -a "$${IS_IN_LIBC}" = "y" ] ; then \
> -		echo "RPC support available in C library, please enable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
> +		echo "RPC support available in C library, please enable BR2_TOOLCHAIN_EXTERNAL_INET_RPC" ; \
>  		exit 1 ; \
>  	fi ; \
>  	if [ "$(BR2_TOOLCHAIN_HAS_NATIVE_RPC)" = "y" -a "$${IS_IN_LIBC}" != "y" ] ; then \
> -		echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_HAS_NATIVE_RPC" ; \
> +		echo "RPC support not available in C library, please disable BR2_TOOLCHAIN_EXTERNAL_INET_RPC" ; \
>  		exit 1 ; \
>  	fi
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
