From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 22:48:55 +0200
Subject: [Buildroot] [PATCH 22/23 v5] Makefile: enable generating
	documents from br2-external
In-Reply-To: <5696090514d618d8f3a2a4540436f53f5c3adc5a.1410692671.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <5696090514d618d8f3a2a4540436f53f5c3adc5a.1410692671.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+B5_z9qbbdwRG0sAH50ch+wUcT5mXkQxWwaax3O=48Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, the only way br2-external may generate a document is by
> including that document's recipe from within external.mk.
>
> But external.mk is only parsed when the tree is configured.
>
> This is unlike our internal document (the manual) which can be generated
> from within an unconfigured tree.
>
> So, include the documents from br2-external at the same time we include
> our own document:
>   - expect the same layout as we have:      docs/DOC_NAME/doc-name.mk
>   - do not fail if there is no document:    use "-include", not "include"
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 8f56f1f..3075d0a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -933,5 +933,6 @@ print-version:
>         @echo $(BR2_VERSION_FULL)
>
>  include docs/manual/manual.mk
> +-include $(BR2_EXTERNAL)/docs/*/*.mk
>
>  .PHONY: $(noconfig_targets)
> --
> 1.9.1
>



-- 
Samuel
