From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 18 Apr 2014 15:20:43 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: target-generatelocales: add
	toolchain dependency
In-Reply-To: <1397826452-30281-2-git-send-email-fabio.porcedda@gmail.com>
References: <1397826452-30281-1-git-send-email-fabio.porcedda@gmail.com>
 <1397826452-30281-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC_P8JkmnhAv68yTO8Dnb2oGED64nMgyvG4bbx7huf1+Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 18, 2014 at 3:07 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> The target depends on the toolchain so add it as a dependency.
> This also fix the support to top-level parallel make.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 53282ae..e204038 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -598,7 +598,7 @@ ifneq ($(GENERATE_LOCALE),)
>  # data comes preferably from the toolchain, or if the toolchain does
>  # not have them (Linaro toolchains), we use the ones available on the
>  # host machine.
> -target-generatelocales: host-localedef
> +target-generatelocales: host-localedef toolchain
>         $(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
>         $(Q)for locale in $(GENERATE_LOCALE) ; do \
>                 inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
> --
> 1.9.2
>

I've done like that because i think that the "target-generatelocales"
depends only on the toolchain target, doesn't it?

Regards
-- 
Fabio Porcedda
