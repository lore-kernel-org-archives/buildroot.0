From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 6 Oct 2013 20:37:18 +0200
Subject: [Buildroot] [PATCH] docs/manual: add a 'Known issues' chapter
In-Reply-To: <1381081747-20598-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381081747-20598-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMKYZ6eCvf=jy0jQ7xpMdj+TOoX-Jx2xBWCcSp18TAvjyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2013/10/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Add a 'Known issues' chapter, which lists the exceptions I have
> currently in the autobuilder scripts to avoid known problems from
> occuring. I believe it is more useful to document them rather than
> keeping them hidden in my autobuilder script.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/known-issues.txt | 32 ++++++++++++++++++++++++++++++++
>  docs/manual/manual.txt       |  2 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 docs/manual/known-issues.txt
>
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> new file mode 100644
> index 0000000..f731f8f
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
> +  +ltp-testsuite+ package with uClibc. You need to either a glibc or
> +  eglibc based toolchain, or enable the appropriate options in the
> +  uClibc configuration.
> +
> +* The +xfsprogs+ package does not build with the default uClibc
> +  configuration used by the Buildroot toolchain backend. You need to
> +  either a glibc or eglibc based toolchain, or enable the appropriate
> +  options in the uClibc configuration.
>
+
> +* The +mrouted+ package does not build with the default uClibc
> +  configuration used by the Buildroot toolchain backend. You need to
> +  either a glibc or eglibc based toolchain, or enable the appropriate
> +  options in the uClibc configuration.
>

For all these 3 packages that miss options in the default uClibc
configuration,
there are comments in the Config.in files mentioning what are these missing
options.
It is weird to list them for ltp-testsuite, but not for xfsprog or mrouted.


> +
> +* The +libffi+ package is not supported on the SuperH 2 and ARC
> +  architectures.
> +
> +* The +prboom+ package triggers a compiler failure with the SuperH 4
> +  compiler from Soucery CodeBench, version 2012.09.
> +
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index 9685667..9ae658e 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -23,6 +23,8 @@ include::working-with.txt[]
>
>  include::faq-troubleshooting.txt[]
>
> +include::known-issues.txt[]
> +
>  include::going-further.txt[]
>
>  include::developer-guide.txt[]
> --
>

Otherwise, you have my ack:
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131006/374f25c8/attachment-0001.html>
