From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 10 Apr 2019 11:03:07 +0200
Subject: [Buildroot] [PATCH 05/10] infra/utils: add helper to generate
 comma-separated lists
In-Reply-To: <429526964a369072244a0f2f5f4e99eff58220b7.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <429526964a369072244a0f2f5f4e99eff58220b7.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVF1hstXKtV5vvuoDm8YeG2r6yoDqFeJFeJZtSF8WO9TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El dom., 7 abr. 2019 a las 13:51, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Add a helper macro that, from a space-separated list of items, returns a
> comma-separated list of the quoted items.
>
> This will be usefull when we need to generate lists in JSON, later...

useful

>
> Code suggested by Thomas P.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/misc/utils.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/support/misc/utils.mk b/support/misc/utils.mk
> index c44319338e..0903679e62 100644
> --- a/support/misc/utils.mk
> +++ b/support/misc/utils.mk
> @@ -70,6 +70,10 @@ finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
>  # notfirstword(wordlist): returns all but the first word in wordlist
>  notfirstword = $(wordlist 2,$(words $(1)),$(1))
>
> +# build a comma-separated list of quoted items, from a space-separated
> +# list of unquoted items:   a b c d  -->  "a", "b", "c", "d"
> +make-comma-list = $(subst $(space),$(comma) ,$(patsubst %,"%",$(strip $(1))))

I think it would be more obvious here to replace with $(subst
$(space),$(comma)$(space),...)
rather than relying on the space added after '$(comma)'.


> +
>  # Needed for the foreach loops to loop over the list of hooks, so that
>  # each hook call is properly separated by a newline.
>  define sep
> --
> 2.14.1
>
