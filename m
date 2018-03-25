From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 24 Mar 2018 22:23:58 -0500
Subject: [Buildroot] [PATCH v4 3/9] package/pkg-generic: add the concept
 of extract dependency
In-Reply-To: <20180324142008.10375-4-thomas.petazzoni@bootlin.com>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-4-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpa7mwwM=6C_hMkZahN=AXvMf2JMQ+sVURBGgxB1tHDqXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Mar 24, 2018 at 9:20 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Extract dependencies are dependencies that must be ready before the
> extract step of a package, i.e for tools that are needed to extract
> packages themselves. Current examples of such tools are host-tar,
> host-lzip and host-xz.
>
> They are currently handled through DEPENDENCIES_HOST_PREREQ. However,
> this mechanism has a number of drawbacks:
>
>  - First and foremost, because host-tar/host-lzip/host-xz are not
>    listed in the dependencies of packages, the package infrastructure
>    does not know it should rsync them in the context of per-package
>    SDK.
>
>  - Second, there is no dependency handling *between* them. I.e, we
>    have no mechanism that says host-tar should be built before
>    host-lzip, while it is in fact the case: if you need to build
>    host-lzip, you need to extract a tarball, so you may need host-tar
>    if your system tarball is not capable enough.
>

Forced host-tar to build in my configuration and verified the new
extract dependency built the expected pre-reqs.  Then did a make
toolchain and make busybox to test an explicit package build.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

>
> +* +LIBFOO_EXTRACT_DEPENDENCIES+ lists the dependencies (in terms of
> +  package name) that are required for the current target package to be
> +  extracted. These depnedencies are guaranteed to be compiled and

depnedencies -> dependencies

Matt
