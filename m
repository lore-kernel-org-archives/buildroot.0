From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 26 May 2013 17:12:16 +0200
Subject: [Buildroot] [PATCH] Depend autotools targets on host-ccache
 when BR2_CCACHE is enabled.
In-Reply-To: <201209061737.32826.rasasi78@gmail.com>
References: <201209061737.32826.rasasi78@gmail.com>
Message-ID: <CAHXCMM+ho8PGrmePj9jU6vMurz1HeQXv1N99ZbLPusFJQxv4sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Raul,

2012/9/6 Ra?l S?nchez Siles <rasasi78@gmail.com>:
> In this case, autotools targets rely on $(TARGET_CONFIGURE_OPTS) which includes
> ccached compiler.
>
> Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
> ---
>  package/pkg-autotools.mk |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 785daab..e858ffc 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -200,6 +200,10 @@ $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
>  $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
>  endif
>
> +ifeq ($(BR2_CCACHE),y)
> +$(2)_DEPENDENCIES += host-ccache
> +endif
> +

This should not be necessary since host-ccache is added to the
BASE_TARGETS list in the Makefile at the root of buildroot.

Anyway, what was the issue and the 'make ...' call sequence that lead to it?

Regards,

-- 
Samuel
