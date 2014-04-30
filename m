From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 21:16:32 +0200
Subject: [Buildroot] [PATCH v2] agg: new package
In-Reply-To: <1398351989-24238-1-git-send-email-julien.boibessot@free.fr>
References: <1398351989-24238-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <CAAXf6LXQ-L1GxM5AqBkzgP11+Arn_Jg6dAZnuiM6GxqN+fRDzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Thu, Apr 24, 2014 at 5:06 PM,  <julien.boibessot@free.fr> wrote:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
>
>
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> ---
>  This library will be needed by gnash (soon coming Flash player).
>
>  Changes since v1:
>  * Took Arnout/Thomas/Yann remarks into account:
>    - add comments for AGG_AUTORECONF usage and sdl-prefix redefinition,
>    - fixes license (comments welcome),
>    - add a patch to fixes autoreconf problems previously hacked directly in agg.mk
>    - changed commit Subject
>
>  package/Config.in                         |    1 +
>  package/agg/Config.in                     |   13 +++++++++
>  package/agg/agg-make-autoreconfable.patch |   25 ++++++++++++++++++
>  package/agg/agg.mk                        |   39 +++++++++++++++++++++++++++++
>  4 files changed, 78 insertions(+), 0 deletions(-)
>  create mode 100644 package/agg/Config.in
>  create mode 100644 package/agg/agg-make-autoreconfable.patch
>  create mode 100644 package/agg/agg.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 688ed4d..3b34a67 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -556,6 +556,7 @@ source "package/lockdev/Config.in"
>  endmenu
>
>  menu "Graphics"
> +source "package/agg/Config.in"
>  source "package/atk/Config.in"
>  source "package/cairo/Config.in"
>  source "package/fltk/Config.in"
> diff --git a/package/agg/Config.in b/package/agg/Config.in
> new file mode 100644
> index 0000000..a842098
> --- /dev/null
> +++ b/package/agg/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_AGG
> +       bool "agg"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       select BR2_PACKAGE_SDL
> +       help
> +         The Anti-Grain Geometry project. A High Quality 2D Graphics Rendering
> +         Engine for C++.
> +         We select the SDL backend by default.
> +
> +         http://www.antigrain.com/index.html
> +
> +comment "agg needs a toolchain with C++ support"
> +       depends on !BR2_INSTALL_LIBSTDCPP

The comment should be 'agg needs a toolchain w/ C++'
(the comment string is defined strictly for uniformity and
limited-terminal-width reasons, see
http://buildroot.uclibc.org/downloads/manual/manual.html#dependencies-target-toolchain-options)

> diff --git a/package/agg/agg-make-autoreconfable.patch b/package/agg/agg-make-autoreconfable.patch

Patches should be named foo-0001-description.patch

[..]
> diff --git a/package/agg/agg.mk b/package/agg/agg.mk
> new file mode 100644
> index 0000000..4802d3e
> --- /dev/null
> +++ b/package/agg/agg.mk
> @@ -0,0 +1,39 @@
> +###############################################################################
> +#
> +# agg
> +#
> +###############################################################################

These should be 80 # signs, not 79.

Best regards,
Thomas
