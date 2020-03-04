From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Mar 2020 14:04:52 +0100
Subject: [Buildroot] [PATCH] Makefile: work around a bug in newly
 released make 4.3
In-Reply-To: <20200304125330.8948-1-yann.morin.1998@free.fr>
References: <20200304125330.8948-1-yann.morin.1998@free.fr>
Message-ID: <20200304140452.777d5919@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Mar 2020 13:53:30 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Several users of rolling-release distributions have been reporting on
> IRC that Buildroot is broken now that they have switched to the newly
> released make 4.3.
> 
> It turns out that the constructs we use to generated and ionclude the
> internal br2-external related fragments is no longer working with
> make-4.3.
> 
> Indeed, an upstream bug report [0] seems to imply that it so far was
> working by chance. There has been no further feedback, whether this is
> really considered a fix or a regression...

What does [0] points to ?

> 
> In the meantime, we add a workaround that fixes the issue, and should
> not break on older make versions either (verified on all relevant
> versions: 3.81, 3.82, 4.0, 4.1, and 4.2).

Could you give more details about how the workaround fixes the issue ?

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 31624f77a2..c22c1d8980 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -188,6 +188,9 @@ ifneq ($(BR2_EXTERNAL_ERROR),)
>  $(error $(BR2_EXTERNAL_ERROR))
>  endif
>  
> +# Workaround bug #57676 in make-4.3

Perhaps an http:// link instead of just #57676 ?

> +$(BASE_DIR)/.br2-external.mk:;
> +
>  # To make sure that the environment variable overrides the .config option,
>  # set this before including .config.
>  ifneq ($(BR2_DL_DIR),)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
