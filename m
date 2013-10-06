From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 20:36:34 +0200
Subject: [Buildroot] [PATCH] docs/manual: add a 'Known issues' chapter
In-Reply-To: <1381081747-20598-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Oct 2013 19:49:07 +0200")
References: <1381081747-20598-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4byfdql.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Add a 'Known issues' chapter, which lists the exceptions I have
 Thomas> currently in the autobuilder scripts to avoid known problems from
 Thomas> occuring. I believe it is more useful to document them rather than
 Thomas> keeping them hidden in my autobuilder script.

The uClibc dependencies are already documented in Config.in, but ok.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  docs/manual/known-issues.txt | 32 ++++++++++++++++++++++++++++++++
 Thomas>  docs/manual/manual.txt       |  2 ++
 Thomas>  2 files changed, 34 insertions(+)
 Thomas>  create mode 100644 docs/manual/known-issues.txt

 Thomas> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
 Thomas> new file mode 100644
 Thomas> index 0000000..f731f8f
 Thomas> --- /dev/null
 Thomas> +++ b/docs/manual/known-issues.txt
 Thomas> @@ -0,0 +1,32 @@
 Thomas> +// -*- mode:doc; -*-
 Thomas> +// vim: set syntax=asciidoc:
 Thomas> +
 Thomas> +Known issues
 Thomas> +============
 Thomas> +
 Thomas> +* The +ltp-testsuite+ package does not build with the default uClibc
 Thomas> +  configuration used by the Buildroot toolchain backend. The LTP
 Thomas> +  testsuite uses several functions that are considered obsolete, such
 Thomas> +  as sigset() and others. uClibc configuration options such as
 Thomas> +  DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
 Thomas> +  UCLIBC_SV4_DEPRECATED are needed if one wants to build the
 Thomas> +  +ltp-testsuite+ package with uClibc. You need to either a glibc or

s/either/either use/

In all 3 sections.

 Thomas> +* The +prboom+ package triggers a compiler failure with the SuperH 4
 Thomas> +  compiler from Soucery CodeBench, version 2012.09.

I believe we have a lot of other situations with packages triggering
internal compiler errors, especially for microblaze and avr32.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
