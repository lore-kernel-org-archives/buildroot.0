From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 7 Oct 2013 08:53:24 +0200
Subject: [Buildroot] [git commit] docs/manual: add a 'Known issues'
	chapter
In-Reply-To: <20131006184759.C85899B948@busybox.osuosl.org>
References: <20131006184759.C85899B948@busybox.osuosl.org>
Message-ID: <CAAXf6LXSg7-1AwOiAu5_mJwuuNhTbMLY9T9cyJH9j7Kw3CFDKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 6, 2013 at 8:34 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=4aa9fb945fde3b74ecc1a6887bf597466cd67a0d
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Add a 'Known issues' chapter, which lists the exceptions I have
> currently in the autobuilder scripts to avoid known problems from
> occuring. I believe it is more useful to document them rather than
> keeping them hidden in my autobuilder script.
>
> [Peter: s/either/either use/]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  docs/manual/known-issues.txt |   32 ++++++++++++++++++++++++++++++++
>  docs/manual/manual.txt       |    2 ++
>  2 files changed, 34 insertions(+), 0 deletions(-)
>
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> new file mode 100644
> index 0000000..4ef8c05
> --- /dev/null
> +++ b/docs/manual/known-issues.txt
> @@ -0,0 +1,32 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +Known issues
> +============
> +
> +* The +ltp-testsuite+ package does not build with the default uClibc
> +  configuration used by the Buildroot toolchain backend. The LTP
> +  testsuite uses several functions that are considered obsolete, such
> +  as sigset() and others. uClibc configuration options such as
> +  DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
> +  UCLIBC_SV4_DEPRECATED are needed if one wants to build the
> +  +ltp-testsuite+ package with uClibc. You need to either use a glibc
> +  or eglibc based toolchain, or enable the appropriate options in the
> +  uClibc configuration.
> +
> +* The +xfsprogs+ package does not build with the default uClibc
> +  configuration used by the Buildroot toolchain backend. You need to
> +  either use a glibc or eglibc based toolchain, or enable the
> +  appropriate options in the uClibc configuration.
> +
> +* The +mrouted+ package does not build with the default uClibc
> +  configuration used by the Buildroot toolchain backend. You need to
> +  either use a glibc or eglibc based toolchain, or enable the
> +  appropriate options in the uClibc configuration.
> +
> +* The +libffi+ package is not supported on the SuperH 2 and ARC
> +  architectures.
> +
> +* The +prboom+ package triggers a compiler failure with the SuperH 4
> +  compiler from Soucery CodeBench, version 2012.09.

s/Soucery/Sourcery/

Best regards,
Thomas
