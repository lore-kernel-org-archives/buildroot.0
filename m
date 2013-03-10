From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 11:27:01 +0100
Subject: [Buildroot] [PATCH 3/4] directfb: expanding the help strings
In-Reply-To: <1362908858-6340-4-git-send-email-c.schoenert@gmail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-4-git-send-email-c.schoenert@gmail.com>
Message-ID: <20130310112701.5ac2f9bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 10 Mar 2013 10:47:37 +0100, Carsten Schoenert wrote:
> From: Carsten Schoenert <c.schoenert@gmail.com>
> 
> Adding a helper string for the PXA3xx and graphics driver from Marvell
> and the EP9x graphics driver from Cirrus Logic.
> 
> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
> ---
>  package/directfb/Config.in |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index a184568..3d22e15 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -49,10 +49,27 @@ config BR2_PACKAGE_DIRECTFB_MATROX
>  config BR2_PACKAGE_DIRECTFB_PXA3XX
>  	bool "compile pxa3xx graphics driver"
>  	depends on BR2_arm
> +    help
> +      The Marvell PXA3xx Processor Family is a system-on-chip based
> +      on XScale? microarchitecture. The PXA3xx processor provide
> +      high-performance multimedia, low-power capabilities, and rich
> +      peripheral integration. The PXA3xx Processor Family provide
> +      enhanced features compared to the PXA27x Processor Family, and
> +      are the first Marvell applications processors to integrate a
> +      hardware video accelerator unit.
> +
> +      http://www.marvell.com/application-processors/pxa-family/

Indentation is wrong. It should be one tab for "help" and one tab + two
spaces for the help text.

In addition to that, I'm not sure the wording of the help text is so
useful. Something like "This option enables a graphics driver specific
to the graphics hardware of the Marvell PXA3xx processor family", would
be a bit more useful.

>  config BR2_PACKAGE_DIRECTFB_EP9X
>  	bool "compile ep9x graphics driver"
>  	depends on BR2_arm
> +    help
> +      The EP93xx ARMv9 based processors from Cirrus Logic are highly
> +      integrated systems-on-a-chip that pave the way for a multitude
> +      of next-generation consumer and industrial electronic products.
> +
> +      http://cirrus.com/en/products/arm9.html

Same comments.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
