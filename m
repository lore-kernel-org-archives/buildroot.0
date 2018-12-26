From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:31:41 +0100
Subject: [Buildroot] [PATCH v3 2/3] doc/manual: document the waf
 packages may need to select host-waf
In-Reply-To: <20181223171950.3979-2-casantos@datacom.com.br>
References: <20181223171950.3979-1-casantos@datacom.com.br>
 <20181223171950.3979-2-casantos@datacom.com.br>
Message-ID: <20181226223141.5ba89c26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

Minor nit: title should use the prefix docs/manual.

On Sun, 23 Dec 2018 15:19:49 -0200, Carlos Santos wrote:
> Now that waf has a blind Config.in.host we can require that packages
> setting <PKG>_NEEDS_EXTERNAL_WAF to YES slso select host-waf.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  docs/manual/adding-packages-waf.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
> index 43b557c070..f38c3a6f55 100644
> --- a/docs/manual/adding-packages-waf.txt
> +++ b/docs/manual/adding-packages-waf.txt
> @@ -64,7 +64,10 @@ also be defined.
>    Buildroot to use the bundled +waf+ executable. If set to +NO+, the
>    default, then Buildroot will use the waf executable provided in the
>    package source tree; if set to +YES+, then Buidlroot will download,
> -  install waf as a host tool and use it to build the package.
> +  install waf as a host tool and use it to build the package. Packages
> +  that need the host waf tool must select +BR2_PACKAGE_HOST_WAF+ in

Perhaps: "Packages in this situation must select..."

> +  their Config.in. It is not necessary to add host-waf to
> +  +LIBFOO_DEPENDENCIES+, since this is done atomatically.

atomatically -> automatically.

(Note: I would have fixed these minors nits myself when applying, but I
sent some other questions/comments on PATCH 1/3 anyway.)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
