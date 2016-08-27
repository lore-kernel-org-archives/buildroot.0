From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:14:15 +0200
Subject: [Buildroot] [PATCH 03/16 v3] doc/asciidoc: add possibility to
 define document dependencies
In-Reply-To: <8b101d01b6a1c1aaadde0649c82fba5db2c511f1.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <8b101d01b6a1c1aaadde0649c82fba5db2c511f1.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827161415.5767677b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:23 +0200, Yann E. MORIN wrote:

> diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
> index 6e21786..0c10fd1 100644
> --- a/docs/manual/adding-packages-asciidoc.txt
> +++ b/docs/manual/adding-packages-asciidoc.txt
> @@ -63,6 +63,9 @@ information is (assuming the document name is +foo+) :
>    to one or more directories containing so-called resources (like CSS or
>    images). By default, empty.
>  
> +* +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
> +  host-packages) that must be built before building this document.
> +
>  There are also additional hooks (see xref:hooks[] for general information
>  on hooks), that a document may set to define extra actions to be done at
>  various steps:
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index 6ab5ad2..ede6ed1 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -140,7 +140,7 @@ endef
>  ################################################################################
>  define ASCIIDOC
>  # Single line, because splitting a foreach is not easy...
> -$(1)-check-dependencies: asciidoc-check-dependencies
> +$(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)

My concern is that $(2)_DEPENDENCIES has nothing to do with *checking*
dependencies, so it's a bit weird to see this added to a target called
<something>-check-dependencies.

Could you refresh me on how this $(1)-check-dependencies target is
used? I had a quick look at the code around and couldn't remember, and
wanted to look at some other patches in your series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
