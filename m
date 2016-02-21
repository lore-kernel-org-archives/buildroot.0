From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:46:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] font-awesome:new package
In-Reply-To: <1455703012-8163-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
References: <1455703012-8163-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
Message-ID: <20160221154659.1bb6af3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Atul Singh,

I've applied your patch to our next branch, but after doing some minor
changes. See below.

On Wed, 17 Feb 2016 15:26:52 +0530, Atul Singh wrote:
> Font Awesome is a full suite of 605 pictographic icons for easy
> scalable vector graphics on websites.
> 
> Changes v1->v2:
>  -Simplified the loop for fetching the target directories(suggested by Thomas).
>  -updated license information in .mk file.
>  -added the package in the Fonts submenu (suggested by Thomas).
>  -Removed the FONT_AWESOME_LICENSE_FILES variable.

The changelog should not be part of the commit log per-se, as we don't
want to keep it forever in the Git history. Instead it should be
written...

> 
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> ---


...here.

>  package/Config.in                      |  1 +
>  package/font-awesome/Config.in         |  7 +++++++
>  package/font-awesome/font-awesome.hash |  2 ++
>  package/font-awesome/font-awesome.mk   | 18 ++++++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/font-awesome/Config.in
>  create mode 100644 package/font-awesome/font-awesome.hash
>  create mode 100644 package/font-awesome/font-awesome.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index a5b31aa..2677a50 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -199,6 +199,7 @@ comment "Fonts"
>  	source "package/bitstream-vera/Config.in"
>  	source "package/cantarell/Config.in"
>  	source "package/dejavu/Config.in"
> +	source "package/font-awesome/Config.in"
>  	source "package/ghostscript-fonts/Config.in"
>  	source "package/inconsolata/Config.in"
>  	source "package/liberation/Config.in"
> diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
> new file mode 100644
> index 0000000..065f554
> --- /dev/null
> +++ b/package/font-awesome/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FONT_AWESOME
> +	bool "font-awesome"
> +	help
> +	  Font Awesome is a full suite of 605 pictographic icons for easy

This line was slightly too long, so I rewrapped.

> +	  scalable vector graphics on websites.
> +
> +	  https://github.com/FortAwesome/Font-Awesome
> diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
> new file mode 100644
> index 0000000..d6b2be7
> --- /dev/null
> +++ b/package/font-awesome/font-awesome.hash
> @@ -0,0 +1,2 @@
> +# Locally Computed

Computed -> computed

> +sha256  7813f416057da622b16229b10fef550e1dc64c5bb59871cd38fa86e76dfdbae8  font-awesome-v4.5.0.tar.gz
> diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
> new file mode 100644
> index 0000000..d552e26
> --- /dev/null
> +++ b/package/font-awesome/font-awesome.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# font-awesome
> +#
> +################################################################################
> +
> +FONT_AWESOME_VERSION = v4.5.0
> +FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
> +FONT_AWESOME_LICENSE = OFLv1.1(font), MIT(CSS, LESS and Sass files)

There should have been a space before the opening parenthesis.

As I said, I've fixed up those small nits and applied. Thanks a lot for
your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
