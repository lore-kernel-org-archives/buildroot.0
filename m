From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 14 Feb 2014 14:46:55 +0100
Subject: [Buildroot] [PATCH v13 7/7] sdl: add support for top-level
	parallel make
In-Reply-To: <1392371709-26662-8-git-send-email-fabio.porcedda@gmail.com>
References: <1392371709-26662-1-git-send-email-fabio.porcedda@gmail.com>
 <1392371709-26662-8-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAGduivxVTtgVf4sxtqCGXrL4SvZ1f2fdEcxd=aV0QMRYokBUqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio, all
On Fri, Feb 14, 2014 at 10:55 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> To be sure that host-autoconf dependency is already built move the
> call to autogen.sh from SDL_POST_PATCH_HOOKS to SDL_PRE_CONFIGURE_HOOKS.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/sdl/sdl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
> index ba5fbca..cf3366d 100644
> --- a/package/sdl/sdl.mk
> +++ b/package/sdl/sdl.mk
> @@ -17,7 +17,7 @@ define SDL_RUN_AUTOGEN
>         cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
>  endef
>
> -SDL_POST_PATCH_HOOKS += SDL_RUN_AUTOGEN
> +SDL_PRE_CONFIGURE_HOOKS += SDL_RUN_AUTOGEN
>  SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
>
>
> --
> 1.8.5.2
>
I agree with Thomas, it make much more sense in this hook.
I will then resend my patch adding the host variant of sdl.

Acked-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
