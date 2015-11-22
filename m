From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 21:46:40 +0100
Subject: [Buildroot] [PATCH 1/3] core/pkg-autotools: align host
 configure commands to target one
In-Reply-To: <f288b50c4267ceb0ca24aa1a7937d8f5fa894ed5.1448202976.git.yann.morin.1998@free.fr>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <f288b50c4267ceb0ca24aa1a7937d8f5fa894ed5.1448202976.git.yann.morin.1998@free.fr>
Message-ID: <565229B0.7030603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-11-15 15:39, Yann E. MORIN wrote:
> The host configure commands are not indented the same way as the target
> ones. Besides, there are leading spaces (instead of TABs) on one line.
> 
> Replicate the same indentation as used for the target commands.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 [Verified that it's whitespace only change.]


 Regards,
 Arnout

> ---
>  package/pkg-autotools.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 4787914..502eeea 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -214,12 +214,12 @@ else
>  # installed.
>  define $(2)_CONFIGURE_CMDS
>  	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
> -	        $$(HOST_CONFIGURE_OPTS) \
> -		CFLAGS="$$(HOST_CFLAGS)" \
> -		LDFLAGS="$$(HOST_LDFLAGS)" \
> -		$$($$(PKG)_CONF_ENV) \
> -		CONFIG_SITE=/dev/null \
> -		./configure \
> +	$$(HOST_CONFIGURE_OPTS) \
> +	CFLAGS="$$(HOST_CFLAGS)" \
> +	LDFLAGS="$$(HOST_LDFLAGS)" \
> +	$$($$(PKG)_CONF_ENV) \
> +	CONFIG_SITE=/dev/null \
> +	./configure \
>  		--prefix="$$(HOST_DIR)/usr" \
>  		--sysconfdir="$$(HOST_DIR)/etc" \
>  		--localstatedir="$$(HOST_DIR)/var" \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
