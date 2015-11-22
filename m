From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 21:48:09 +0100
Subject: [Buildroot] [PATCH 2/3] package/gcc: comment on why we override
 the generic configure commands
In-Reply-To: <71e3b6c662031621f10fc3e1160ae1738204839b.1448202976.git.yann.morin.1998@free.fr>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <71e3b6c662031621f10fc3e1160ae1738204839b.1448202976.git.yann.morin.1998@free.fr>
Message-ID: <56522A09.2090200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-11-15 15:39, Yann E. MORIN wrote:
> The explanations given in the commit log of 7d6c79 (Compile static
> versions of gcc libraries) do not explain why we have to provide custom
> configure commands, instead of just adding --enable-static to the
> configure options.
> 
> Add a comment in the code that explains why that is so. Add a pointer to
> the ML archives with the explanations, too.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/gcc/gcc-final/gcc-final.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 7802855..dbdb615 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -27,6 +27,15 @@ HOST_GCC_FINAL_SUBDIR = build
>  
>  HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
>  
> +# We want to always build the static variants of all the gcc libraries,
> +# of which libstdc++, libgomp, libmudflap...
> +# To do so, we can not just pass --enable-static to override the generic
> +# --disable-static flag, otherwise gcc fails to build some of those
> +# libraries, see;
> +#   http://lists.busybox.net/pipermail/buildroot/2013-October/080412.html
> +#
> +# So we must completely override the generic commands and provide our own.
> +#
>  define  HOST_GCC_FINAL_CONFIGURE_CMDS
>  	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
>  		$(HOST_CONFIGURE_OPTS) \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
