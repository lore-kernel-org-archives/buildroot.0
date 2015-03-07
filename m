From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 7 Mar 2015 12:25:13 +0100
Subject: [Buildroot] [PATCH v4 1/3] pkg-cmake: allow to build package in
	a subdirectory
In-Reply-To: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
References: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMM+qoL4J6DRORRNTcAEZRYrtx0TT=VS31t5sFS3CmjYaXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

On Thu, Mar 5, 2015 at 12:03 PM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> For some cmake based packages, like GNURadio, it's forbidden to do the
> compilation directly in the sources directory. This patch add a new
> variable to specify, if needed, the name of a sub-directory used to compile.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Tested-by: Samuel Martin <s.martin49@gmail.com>
> Acked-by: Samuel Martin <s.martin49@gmail.com>
> ---
> Changes v2 -> v3:
>  * Update docs to add detail about LIBFOO_BUILDDIR
> Changes v1 -> v2:
>  * Allow to overload $(2)_BUILDDIR instead of adding a new variable and test
> ---
>  docs/manual/adding-packages-cmake.txt | 7 ++++++-
>  package/pkg-cmake.mk                  | 8 +++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
> index d92b209..05738f0 100644
> --- a/docs/manual/adding-packages-cmake.txt
> +++ b/docs/manual/adding-packages-cmake.txt
> @@ -79,7 +79,7 @@ First, all the package metadata information variables that exist in
>  the generic infrastructure also exist in the CMake infrastructure:
>  +LIBFOO_VERSION+, +LIBFOO_SOURCE+, +LIBFOO_PATCH+, +LIBFOO_SITE+,
>  +LIBFOO_SUBDIR+, +LIBFOO_DEPENDENCIES+, +LIBFOO_INSTALL_STAGING+,
> -+LIBFOO_INSTALL_TARGET+.
> ++LIBFOO_INSTALL_TARGET+, +LIBFOO_BUILDDIR+.
>
>  A few additional variables, specific to the CMake infrastructure, can
>  also be defined. Many of them are only useful in very specific cases,
> @@ -91,6 +91,11 @@ typical packages will therefore only use a few of them.
>    the tree extracted by the tarball. If +HOST_LIBFOO_SUBDIR+ is not
>    specified, it defaults to +LIBFOO_SUBDIR+.
>
> +* +LIBFOO_BUILDDIR+ may overload the default build directory when a
> +  package prevents from in-source-tree build. For example,
> +  FOO_BUILDDIR = $(FOO_SRCDIR)/.build, will be used to compile foo
> +  package in .build subdirectory.
> +

Nitpicking a bit ;-)
I would add a few words about host package, whose HOST_FOO_BUILDDIR
also need to be set if the package does not support in-source-tree
build.

Otherwise it's good to me.

Regards,


-- 
Samuel
