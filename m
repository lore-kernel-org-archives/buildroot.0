From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Dec 2015 00:35:56 +0100
Subject: [Buildroot] [PATCH 2/2] package/gawk: add optional readline
 dependency
In-Reply-To: <f37416a8d0f491f30efbc89ddd3a2ce82e56b65c.1449181275.git.yann.morin.1998@free.fr>
References: <cover.1449181275.git.yann.morin.1998@free.fr>
 <f37416a8d0f491f30efbc89ddd3a2ce82e56b65c.1449181275.git.yann.morin.1998@free.fr>
Message-ID: <5660D1DC.4010509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-12-15 23:22, Yann E. MORIN wrote:
> The gawk debugger can optionally use readline for user input during
> the debugging session (for the usual autocompletion and stuff).
> 
> Enable readline support when the readline package is enabled; let
> ./configure automatically find it. Forcibly disable readline support
> when the readline package is disabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/gawk/gawk.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
> index 74c1fe4..4145025 100644
> --- a/package/gawk/gawk.mk
> +++ b/package/gawk/gawk.mk
> @@ -23,6 +23,13 @@ else
>  GAWK_CONF_OPTS += --without-mpfr
>  endif
>  
> +# When enabled, let ./configure find it automatically

 Same thing about the comment.

 Regards,
 Arnout

> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +GAWK_DEPENDENCIES += readline
> +else
> +GAWK_CONF_OPTS += --without-readline
> +endif
> +
>  # We don't have a host-busybox, and we don't want to use readline or mpfr
>  HOST_GAWK_DEPENDENCIES =
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
