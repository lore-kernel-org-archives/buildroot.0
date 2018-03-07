From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 7 Mar 2018 15:15:26 +0000
Subject: [Buildroot] [PATCH 1/1] Fix fbgrab pixel format report
In-Reply-To: <1520431971-767-1-git-send-email-timo.ketola@exertus.fi>
References: <1520431971-767-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <20180307151526.GB14986@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Moikka, Timo!

On Wed,  7 Mar 2018 16:12:51 +0200, "Timo Ketola" <timo@exertus.fi> wrote:
> When verbosive, fbgrab reports pixel format. Green and blue offset and
> msb_right fields are accidentally swapped there. This commit adds a patch
> which straightens them up.
> 
> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

By any chance, have you tried sending the patch upstream? If not, that
would be nice a nice thing to do. As a small nit, could you also add an
?Upstream-Status? tag line next to the ?Signed-off-by? one and resubmit
the patch?

BTW, I have noticed that the manual does NOT mention anything about the
?Upstream-Status? tag at all. Probably it would be a good idea to add
some notes about this.

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
> +
> +Signed-off-by timo.ketola at exertus.fi
> +
> +diff -u a/fbgrab.c b/fbgrab.c
> +--- a/fbgrab.c	2018-03-07 11:42:04.739250433 +0200
> ++++ b/fbgrab.c	2018-03-07 11:43:26.128043877 +0200
> +@@ -169,8 +169,8 @@
> +         fprintf(stderr, "bits_per_pixel: %i\n", fb_varinfo_p->bits_per_pixel);
> +         fprintf(stderr, "grayscale: %s\n", fb_varinfo_p->grayscale ? "true" : "false");
> +         fprintf(stderr, "red:   offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->red.offset, fb_varinfo_p->red.length, fb_varinfo_p->red.msb_right);
> +-        fprintf(stderr, "blue:  offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->blue.offset, fb_varinfo_p->green.length, fb_varinfo_p->green.msb_right);
> +-        fprintf(stderr, "green: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->green.offset, fb_varinfo_p->blue.length, fb_varinfo_p->blue.msb_right);
> ++        fprintf(stderr, "green: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->green.offset, fb_varinfo_p->green.length, fb_varinfo_p->green.msb_right);
> ++        fprintf(stderr, "blue:  offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->blue.offset, fb_varinfo_p->blue.length, fb_varinfo_p->blue.msb_right);
> +         fprintf(stderr, "alpha: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->transp.offset, fb_varinfo_p->transp.length, fb_varinfo_p->transp.msb_right);
> +         fprintf(stderr, "pixel format: %s\n", fb_varinfo_p->nonstd == 0 ? "standard" : "non-standard");
> +     }
> -- 
> 2.7.4

Best regards,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180307/ea1bcc15/attachment.asc>
