From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Mar 2018 09:30:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] fbgrab: add patch fixing pixel
 format report
In-Reply-To: <1520493725-1146-1-git-send-email-timo.ketola@exertus.fi>
References: <1520493725-1146-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <20180308093034.002c8987@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Mar 2018 09:22:05 +0200, Timo Ketola wrote:
> When verbosive, fbgrab reports pixel format. Green and blue offset and
> msb_right fields are accidentally swapped there. This commit adds a patch
> which straightens them up.
> 
> Upstream-Status: Submitted [Gunnar Monell <gmo@linux.nu>]

We normally put the Upstream-Status in the patch itself, i.e

> 
> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
> ---
> No changes in the payload. Only added Upstream-status (Adrian) and
> adjusted subject line (Thomas).
> ---
>  package/fbgrab/0100-fix-pixfmt-report.patch | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 package/fbgrab/0100-fix-pixfmt-report.patch
> 
> diff --git a/package/fbgrab/0100-fix-pixfmt-report.patch b/package/fbgrab/0100-fix-pixfmt-report.patch
> new file mode 100644
> index 0000000..18bcf96
> --- /dev/null
> +++ b/package/fbgrab/0100-fix-pixfmt-report.patch
> @@ -0,0 +1,22 @@
> +Fix pixel format report
> +
> +When fbgrab tells about the framebuffer pixel format, blue and green
> +are accidentally swapped in 'length' and 'msb_right' columns. Let's
> +order everything as RGB.

... here.

> +
> +Signed-off-by timo.ketola at exertus.fi

This Signed-off-by line doesn't follow the usual format, it should have
been:

Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

(But your patch has been applied already anyway).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
