From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Oct 2015 23:48:06 +0200
Subject: [Buildroot] [PATCH] Buildroot support for Intel X1000
In-Reply-To: <1445252572.4143.12.camel@intel.com>
References: <1445252572.4143.12.camel@intel.com>
Message-ID: <56256516.20707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-10-15 13:02, Kinsella, Ray wrote:
> The Intel X1000 is the Pentium class microprocessor that ships with Galileo
> Gen 1/2. This patch adds changes to arch and toolchain-wrapper to omit the lock
> prefix for the X1000.
> 
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Stylistic comments below.

> ---
>  arch/Config.in.x86             | 10 ++++++++++
>  toolchain/toolchain-wrapper.c  |  3 +++
>  toolchain/toolchain-wrapper.mk |  4 ++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 43f6abc..28b8adf 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -34,6 +34,14 @@ config BR2_x86_i486
>  config BR2_x86_i586
>  	bool "i586"
>  	depends on !BR2_x86_64
> +config BR2_x86_x1000
> +	bool "x1000"
> +	depends on !BR2_x86_64
> +	help
> +	    The Intel X1000 is a Pentium class microprocessor in the Quark 
> +	    (sub-Atom) Product Line. The X1000 has a bug on the lock prefix
> +	    requiring that prefix must be stripped at build time. See
> +	    https://en.wikipedia.org/wiki/Intel_Quark

 Now that it has become a full config option including help text, perhaps we
should empty lines around it like we do elsewhere. OTOH that breaks the current
flow of the file...

 Also, perhaps the URL should be on a separate line like we do for packages.

 Regards,
 Arnout


>  config BR2_x86_i686
>  	bool "i686"
>  	depends on !BR2_x86_64
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
