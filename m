From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 15:48:21 +0200
Subject: [Buildroot] [PATCH] Correct path error in
 package/freescale-imx/Config.in
In-Reply-To: <1368177210-3899-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368177210-3899-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <20130510154821.49afc23a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Henk Fijnvandraat,

On Fri, 10 May 2013 11:13:30 +0200, Henk Fijnvandraat wrote:
> Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
> ---
>  package/freescale-imx/Config.in |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 1f60192..8d0e347 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -11,6 +11,6 @@ menuconfig BR2_PACKAGE_IMX
>  
>  
>  if BR2_PACKAGE_IMX
> -source "package/imx-lib/Config.in"
> +source "package/freescale-imx/imx-lib/Config.in"
>  source "package/freescale-imx/firmware-imx/Config.in"
>  endif

You shouldn't send just a fixup patch like this. When you make a
mistake in a patch series, you have to send a new version of the entire
patch series. Alternatively, you can reply to your own patches, say
that you made a mistake and explain which one, and say that you'll
resend the patch series a little bit later, once people will have had
the time to review your patches, so that you can resend with more
comments taken into account.

Also, when you send the same patch series multiple times, there should
be a version number in the patch titles, and a small changelog in the
cover letter. To generate your patches:

	git format-patch --cover --subject-prefix="PATCH vX"

where X will be replaced by the version of your patches.

Then, edit 0000-cover-letter.patch to include a global description of
your patch series, and the list of changes from one revision to
another. To do this, I generally keep a file called
<branch>-cover-letter.txt for each branch I'm currently working on, in
which I keep the cover letter that I update before sending a new
version. This way, I don't have to rewrite the entire cover letter
everytime.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
