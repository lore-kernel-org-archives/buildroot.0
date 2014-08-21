From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 21 Aug 2014 21:39:23 +0200
Subject: [Buildroot] [PATCH 1/6] gendoc infra: cosmetic fixes
In-Reply-To: <1408529004-18632-2-git-send-email-s.martin49@gmail.com>
References: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
 <1408529004-18632-2-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LV204uXKcNd4vvvRvQy+9jism=gFS-HZpOUrwfyYnomcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Wed, Aug 20, 2014 at 12:03 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> - wrap lines to 80 characters
> - fix space/tab mixup
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/manual.mk | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 8d401a2..13ed0b4 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -71,8 +71,8 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
>         $$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
>         $$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
>                 -D $$(@D) $$(@D)/.build/$(1).txt \
> -               --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
>         -$$(Q)rm -rf $$(@D)/.build
> +               --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"

Something went wrong here: you changed spaces in tabs on the
'--asciidoc-opts' line, but not on the '-D' line.
Moreover, you moved the --asciidoc-opts below, where it does not make
sense nor will work.

Best regards,
Thomas
