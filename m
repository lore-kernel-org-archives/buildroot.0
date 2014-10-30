From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 21:43:23 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: remove version 4.4.x
In-Reply-To: <1414657776-32427-3-git-send-email-andreas@gaisler.com>
References: <1414657776-32427-1-git-send-email-andreas@gaisler.com>
 <1414657776-32427-3-git-send-email-andreas@gaisler.com>
Message-ID: <20141030214323.4b7bb8ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Larsson,

On Thu, 30 Oct 2014 09:29:36 +0100, Andreas Larsson wrote:
> That gcc series is old and is not used as the default version for
> any of the architectures we support, so this commit gets rid of it.
> 
> Signed-off-by: Andreas Larsson <andreas@gaisler.com>
> ---
>  Config.in.legacy                                   |    7 +
>  package/gcc/4.4.7/100-uclibc-conf.patch            |   13 --
>  package/gcc/4.4.7/301-missing-execinfo_h.patch     |   11 --
>  package/gcc/4.4.7/302-c99-snprintf.patch           |   13 --
>  .../gcc/4.4.7/305-libmudflap-susv3-legacy.patch    |   49 -------
>  package/gcc/4.4.7/810-arm-softfloat-libgcc.patch   |   38 ------
>  package/gcc/4.4.7/gcc-44-pr39429.patch             |   24 ----
>  .../powerpc-link-with-math-lib.patch.conditional   |  137 --------------------
>  package/gcc/Config.in.host                         |   24 ----
>  9 files changed, 7 insertions(+), 309 deletions(-)
>  delete mode 100644 package/gcc/4.4.7/100-uclibc-conf.patch
>  delete mode 100644 package/gcc/4.4.7/301-missing-execinfo_h.patch
>  delete mode 100644 package/gcc/4.4.7/302-c99-snprintf.patch
>  delete mode 100644 package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
>  delete mode 100644 package/gcc/4.4.7/810-arm-softfloat-libgcc.patch
>  delete mode 100644 package/gcc/4.4.7/gcc-44-pr39429.patch
>  delete mode 100644 package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional

I moved the Config.in.legacy option to the right place and applied. You
placed the Config.in.legacy option together with the other gcc versions
that were deprecated. But that's not how Config.in.legacy works: it
works by classifying options by the Buildroot version in which they
were deprecated.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
