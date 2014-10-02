From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Oct 2014 12:21:05 +0200
Subject: [Buildroot] [PATCH 23/25 v6] doc/asciidoc: always use UTC
In-Reply-To: <de84d86d9a8fe394f9481b0b17eae6667c18ec07.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <de84d86d9a8fe394f9481b0b17eae6667c18ec07.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LU2KNsD4N9_XnTiwbKT8VRDdBZMk1Knkvm-V87q_s3HDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, the manual is rendered with the timezone of the user running
> the rendering. This timezone can fluctuate, depending on the date, due
> to DST (Daylight Saving Time). Currently, the manual is rendered in
> either CET or CEST (Central European Time, or its DST variant.)
>
> So, a manual rendered during the summer or the winter would refer to a
> non-constant timezone. If the machine and/or user doing the rendering
> also changes, there is no guarantee the timezone would still be CET/CEST.
> This is not a hard issue, since the user can still deduce the time in
> UTC, but is just incoherent.
>
> Just force the timezone to be UTC when doing the rendering of the
> manual, so we are not dependent on the machine or user doign the

doing

> rendering.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  package/doc-asciidoc.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index 6185982..04c6299 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -93,6 +93,8 @@ define $(2)_$(4)_INSTALL_CMDS
>  endef
>  endif
>
> +$$(O)/docs/$(1)/$(1).$(6): export TZ=UTC
> +
>  ifeq ($(6)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
>  $$(O)/docs/$(1)/$(1).$(6):
>         $$(warning PDF generation is disabled because of a bug in \
> --
> 1.9.1
>

Although I don't mind such a change, I fail to understand the use case
here. Is this only regarding the printed date at the beginning of the
manual?

With the typo in the commit msg fixed:

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
