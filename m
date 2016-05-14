From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 May 2016 22:37:25 +0200
Subject: [Buildroot] [PATCH v1] uclibc: enable debug build option
In-Reply-To: <1463077504-3646-1-git-send-email-ps.report@gmx.net>
References: <1463077504-3646-1-git-send-email-ps.report@gmx.net>
Message-ID: <c6b6ac2d-3bef-74e3-144d-2e4ba0e2ac9c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/16 20:25, Peter Seiderer wrote:
> Set uclibc DODEBUG in case BR2_ENABLE_DEBUG is set.
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>  package/uclibc/uclibc.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index b8ccee2..d68385d 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -182,6 +182,15 @@ endef
>  endif
>
>  #
> +# Debug
> +#
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +define UCLIBC_DEBUG_CONFIG
> +	$(call KCONFIG_ENABLE_OPT,DODEBUG=y,$(@D)/.config)
> +endef
> +endif
> +
> +#
>  # Endianness
>  #
>
> @@ -394,6 +403,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>  	$(UCLIBC_SPARC_TYPE_CONFIG)
>  	$(UCLIBC_POWERPC_TYPE_CONFIG)
>  	$(UCLIBC_X86_TYPE_CONFIG)
> +	$(UCLIBC_DEBUG_CONFIG)
>  	$(UCLIBC_ENDIAN_CONFIG)
>  	$(UCLIBC_LARGEFILE_CONFIG)
>  	$(UCLIBC_IPV6_CONFIG)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
