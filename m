From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 7 Jul 2020 10:51:39 -0500
Subject: [Buildroot] [PATCH 1/3 v2] package/kmod: explicitly disable
 compression when not enabled
In-Reply-To: <7067f36377f52c1a5022a9988be2ee7e70ce48ac.1588511382.git.yann.morin.1998@free.fr>
References: <cover.1588511382.git.yann.morin.1998@free.fr>
 <7067f36377f52c1a5022a9988be2ee7e70ce48ac.1588511382.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpYwWseH-9LFoOceLqyAgVYF_Mm7EHs379q0VAB+Rdfisw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kris,


On Sun, May 3, 2020 at 8:12 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/kmod/kmod.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index e2dfea5c7b..cdbfc5a469 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -35,11 +35,15 @@ endif
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  KMOD_DEPENDENCIES += zlib
>  KMOD_CONF_OPTS += --with-zlib
> +else
> +KMOD_CONF_OPTS += --without-zlib
>  endif
>
>  ifeq ($(BR2_PACKAGE_XZ),y)
>  KMOD_DEPENDENCIES += xz
>  KMOD_CONF_OPTS += --with-xz
> +else
> +KMOD_CONF_OPTS += --without-xz
>  endif
>
>  ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Reflecting this for your review
