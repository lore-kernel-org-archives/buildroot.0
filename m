From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 5 May 2014 16:11:25 +0200
Subject: [Buildroot] [PATCH v2] freetype: freetype-patch: depends on
	host-automake
In-Reply-To: <1399298902-19863-1-git-send-email-fabio.porcedda@gmail.com>
References: <1399298902-19863-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC_Ueja8WJ+PJWci2WRMWZLVYGSED2TN21ENOoPoZv2KBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 5, 2014 at 4:08 PM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> The "make freetype-patch" fails because does not found autogen.sh,
> because autogen.sh available only for the configure stage.
> To fix this add host-automake as a prerequisite to freetype-patch.
>
> This change also fix the support to top-level parallel make.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> ---
> v2:
>  - Add host-automake as a order-only-prerequisite because it is a
>    phony target.
>
>  package/freetype/freetype.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index c7c9a06..a6ae0a0 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -83,3 +83,7 @@ HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
>
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> +
> +# freetype-patch uses autogen.sh so add it as a order-only-prerequisite
> +# because it is a phony target.
> +$(FREETYPE_TARGET_PATCH): | host-automake
> --
> 1.9.1
>

I've sent an updated patch:

http://patchwork.ozlabs.org/patch/345730/

Regards
-- 
Fabio Porcedda
