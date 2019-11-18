From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 17:21:59 +0100
Subject: [Buildroot] [PATCH v1] docs/manual/quickstart: Update output
 directory contents documentation.
In-Reply-To: <20191118152814.12813-1-michael.drake@codethink.co.uk>
References: <20191118152814.12813-1-michael.drake@codethink.co.uk>
Message-ID: <20191118172159.215fd006@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Thanks for this new iteration!

On Mon, 18 Nov 2019 15:28:14 +0000
Michael Drake <michael.drake@codethink.co.uk> wrote:

> The documentation for the output/host/ directory has been updated

A commit log should not be written using present perfect, but at the
present. Simply: "This commit updates the documentation to reflect ..."
or something like that. I suppose you're a native English speaker, so
you'll be much better than I can be at finding the right formulation.

> to mention that it contains the sysroot for the target toolchain,
> as well as the host tools required for running buildroot.
> 
> The staging/ documentation has been updated to reflect that it is

Here as well "has been updated" is confusing.

> a link to the target toolchain sysroot in the host/ directory.

We still need your Signed-off-by here.

> ---
>  docs/manual/quickstart.txt | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
> index 74158ae249..642482a9f4 100644
> --- a/docs/manual/quickstart.txt
> +++ b/docs/manual/quickstart.txt
> @@ -87,15 +87,21 @@ This directory contains several subdirectories:
>    target). This directory contains one subdirectory for each of these
>    components.
>  
> -* +staging/+ which contains a hierarchy similar to a root filesystem
> -  hierarchy. This directory contains the headers and libraries of the
> -  cross-compilation toolchain and all the userspace packages selected
> -  for the target. However, this directory is 'not' intended to be
> -  the root filesystem for the target: it contains a lot of development
> -  files, unstripped binaries and libraries that make it far too big
> -  for an embedded system. These development files are used to compile
> -  libraries and applications for the target that depend on other
> -  libraries.
> +* +host/+ contains both the tools built for the host, and the sysroot
> +  of the target toolchain.  The former is an installation of tools
> +  compiled for the host that are needed for the proper execution of
> +  Buildroot, including the cross-compilation toolchain.  The latter
> +  is a hierarchy similar to a root filesystem hierarchy.  It contains
> +  the headers and libraries of the cross-compilation toolchain and all
> +  the userspace packages selected for the target.

As of today, it is in fact not true that the sysroot contains all
userspace packages selected for the target. Only packages that have
_INSTALL_STAGING = YES are installed in staging. Perhaps we should
rephrase this last sentence to something like:

	It contains the headers and libraries of all user-space
	packages that provide and install libraries used by other
	packages.

>  However, this
> +  directory is 'not' intended to be the root filesystem for the target:
> +  it contains a lot of development files, unstripped binaries and
> +  libraries that make it far too big for an embedded system. These
> +  development files are used to compile libraries and applications for
> +  the target that depend on other libraries.
> +
> +* +staging/+ is a symlink to the target toolchain sysroot inside
> +  +host/+, which exists for backwards compatibility.

Other than that, looks good to me. If your SoB line had been present, I
would have applied this version of patch and done the small tweaks
suggested here myself, but we really need your SoB.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
