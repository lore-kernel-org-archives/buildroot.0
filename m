From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:50:22 +0100
Subject: [Buildroot] [PATCH/next] libpagekite: new package
In-Reply-To: <20180216152125.16975-1-arnout@mind.be>
References: <20180216152125.16975-1-arnout@mind.be>
Message-ID: <20181216125022.5af57eec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Feb 2018 16:21:25 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> libpagekite is a C implementation of the backend of the PageKite relay
> protocol. It allows external access to embedded devices without public
> IP address.
> 
> There is a bundled version of libev but we prefer to use the global
> libev library.
> 
> Although the configure script has a --without-openssl option, it
> doesn't actually build without openssl.
> 
> Patch 0001-configure.ac-fix-handling-of-with.patch is needed because
> we want to explicitly pass --with and --without options, even if they
> are the default. The way the AC_ARG_WITH macros were used, --with and
> --without both had the effect of enabling the option.
> 
> Patch 0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch is
> not needed for Buildroot, but it is part of the same upstream PR and
> would generate a conflict for the next patch.
> 
> Patch 0003-configure.ac-use-pkg-config-for-openssl.patch is needed to
> pass -lz (needed by openssl) in static compilation.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Config.in                                  |   1 +
>  .../0001-configure.ac-fix-handling-of-with.patch   |  76 ++++++++++++
>  ...re.ac-use-AS_HELP_STRING-for-with-openssl.patch |  28 +++++
>  ...3-configure.ac-use-pkg-config-for-openssl.patch | 137 +++++++++++++++++++++
>  package/libpagekite/Config.in                      |  26 ++++
>  package/libpagekite/libpagekite.hash               |   7 ++
>  package/libpagekite/libpagekite.mk                 |  29 +++++
>  7 files changed, 304 insertions(+)
>  create mode 100644 package/libpagekite/0001-configure.ac-fix-handling-of-with.patch
>  create mode 100644 package/libpagekite/0002-configure.ac-use-AS_HELP_STRING-for-with-openssl.patch
>  create mode 100644 package/libpagekite/0003-configure.ac-use-pkg-config-for-openssl.patch
>  create mode 100644 package/libpagekite/Config.in
>  create mode 100644 package/libpagekite/libpagekite.hash
>  create mode 100644 package/libpagekite/libpagekite.mk

Applied with the following changes:

    [Thomas:
     - As noticed by Romain Naour, fix the prompt of the package in the
       Config.in
     - Add entry to DEVELOPERS file
     - Drop the dependency on BR2_bfin, since this architecture has been
       dropped from Buildroot.]

Please make sure to submit the various patches upstream! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
