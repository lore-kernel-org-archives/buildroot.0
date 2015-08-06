From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 22:48:29 +0200
Subject: [Buildroot] [PATCH] imagemagick depends on pango even if not
 available
In-Reply-To: <55C3A446.8080307@mclink.it>
References: <55C3A446.8080307@mclink.it>
Message-ID: <20150806224829.61effbfa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

Thanks for your contribution! See below for some comments/questions.

On Thu, 6 Aug 2015 20:15:34 +0200, Mauro Condarelli wrote:
> Hi,
> it seems imagemagick package does not force dependency on pango, but fails if it's not found.

Can you give more details on how it fails?

> $ git diff
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 1594f69..e8c7ab7 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -44,6 +44,13 @@ else
>   IMAGEMAGICK_CONF_OPTS += --without-fontconfig
>   endif
> 
> +ifeq ($(BR2_PACKAGE_PANGO),y)
> +IMAGEMAGICK_CONF_OPTS += --with-pango
> +IMAGEMAGICK_DEPENDENCIES += pango
> +else
> +IMAGEMAGICK_CONF_OPTS += --without-pango
> +endif

This patch is not making pango a mandatory dependency of imagemagick.
It only makes it an optional dependency;

Again, can you give more details about the problem you're seeing?

The patch looks good (i.e pango is an optional dependency of
imagemagick), but the description is not. Can you clarify?

Thanks!

Thoma

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
