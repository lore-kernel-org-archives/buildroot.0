From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Oct 2014 12:27:53 +0200
Subject: [Buildroot] [PATCH 25/25 v6] docs/manual: document the asciidoc
	infra
In-Reply-To: <b0043d14369f4ce8fe60762c8b48c85a72a55894.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <b0043d14369f4ce8fe60762c8b48c85a72a55894.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXX5NkLrUUTjOV1YKOBpo07ZAug43FbMKte7VSdeu=z3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sat, Sep 27, 2014 at 12:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>
> ---
> Chamges v5 -> v6:
>   - fix names of hooks
>   - remove trailing spaces
> ---

Found some other comments below:

>  docs/manual/adding-packages-asciidoc.txt | 119 +++++++++++++++++++++++++++++++
>  docs/manual/adding-packages.txt          |   2 +
>  2 files changed, 121 insertions(+)
>  create mode 100644 docs/manual/adding-packages-asciidoc.txt
>
> diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
[..]
> +
> +==== +asciidoc-document+ tutorial
> +
> +Whereas package infrastructures are suffixed with +-package+, the document
> +infrastructures are suffixed with +-document+. So, the AsciiDoc infrastructure
> +is named +asciidoc-document+.
> +
> +Here is an example to render a simple AsciiDoc document.
> +
> +----
> +01: ################################################################################
> +02: #
> +03: # foo-document
> +04: #
> +05: ################################################################################
> +06:
> +07: FOO_SOURCES = $(sort $(wildcard $(pkgdir)/*))
> +08: $(eval $(call asciidoc-document))
> +----
> +
> +On line 7, the Makefile declares what the sources of the document are.
> +Currently, it is expected that the document's sources are only local;
> +Buildroot will not attempt to download anything to render a document.
> +Thus, you must indicate where the sources are. Usually, the string
> +above is sufficient for a document with no sub-directory structure.
> +
> +Finally, on line 8, we call the +asciidoc-document+ function, which
> +generates all the Makefile code necessary to render the document.

'Finally' is a bit an exaggeration here, as there was only one
described line above it :)

> +
> +==== +asciidoc-document+ reference
> +
> +The list of variables that can be set in a +.mk+ file to give metadata
> +information is (assuming the document name is +foo+) :
> +
> +* +FOO_SOURCES+, mandatory, defines the source files for the document.
> +
> +* +FOO_RESOURCES+, optional, may contain a space-separated list of paths
> +  to one or more directories containing so-called resources (CSS,
> +  images...) By default, empty.

Shouldn't there be a dot after the closing parentheses, to finish the sentence?

> +
> +There are also additional hooks (see xref:hooks[] for general information
> +on hooks), that a document may set to define extra actions to be done at
> +various steps:
> +
> +* +FOO_POST_RSYNC_HOOKS+ to run additional commands after the sources
> +  have been copied by Buildroot. This can be used for, for example,
> +  generating part of the manual with information extracted from the

I would write:
This can for example be used for ...

Best regards,
Thomas
