From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 07:48:05 +0200
Subject: [Buildroot] [PATCH] Fix ARM uclibc build with
	!BR2_UCLIBC_ARM_BX.
In-Reply-To: <1375829638-7603-1-git-send-email-jmaggard10@gmail.com>
References: <1375829638-7603-1-git-send-email-jmaggard10@gmail.com>
Message-ID: <CAAXf6LUkvoMptwKz=caS0Mr-FhGfB8FHhXt+V=6w9HqSw96B8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 7, 2013 at 12:53 AM, Justin Maggard <jmaggard10@gmail.com> wrote:
> When BR2_UCLIBC_ARM_BX is not set, UCLIBC_OPT_UNSET gets called with an extra
> argument.  Remove it.
>
> Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
> ---
>  package/uclibc/uclibc.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 644c531..36a5001 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -85,7 +85,7 @@ define UCLIBC_ARM_BX_CONFIG
>  endef
>  else
>  define UCLIBC_ARM_BX_CONFIG
> -       $(call UCLIBC_OPT_UNSET,USE_BX,y,$(@D))
> +       $(call UCLIBC_OPT_UNSET,USE_BX,$(@D))
>  endef
>  endif

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
