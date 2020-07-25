From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 17:02:59 -0700
Subject: [Buildroot] [PATCH v3 4/7] package/cups: bump to version 2.3.3
In-Reply-To: <20200624204347.797088-5-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
 <20200624204347.797088-5-angelo@amarulasolutions.com>
Message-ID: <CAFSsvmo4asAs2xAXoM75Na_sYX+fixokGW7MTDd4-0shmQbcYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

This version bump fixes CVE-2020-3898 and CVE-2019-8842, so this
should be considered
a security fix.

I tested the whole series and it works as expected!

Tested-by: Adam Duskett <aduskett@gmail.com>

On Wed, Jun 24, 2020 at 1:44 PM Angelo Compagnucci
<angelo@amarulasolutions.com> wrote:
>
> This patch bumps cups to version 2.3.3.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  ...01-Remove-man-from-BUILDDIRS-in-configure.patch |  8 +++++---
>  package/cups/0002-Do-not-use-genstrings.patch      | 14 ++++++++------
>  .../0004-Remove-PIE-flags-from-the-build.patch     |  8 +++++---
>  package/cups/cups.hash                             |  2 +-
>  package/cups/cups.mk                               |  2 +-
>  5 files changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> index b1ab7cbace..7fcf7133c8 100644
> --- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> +++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> @@ -6,15 +6,17 @@ Subject: [PATCH] Remove man from BUILDDIRS in configure
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  [Fabrice: updated for 2.3.0]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Michael: updated for 2.3.3]
> +Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>  ---
>   config-scripts/cups-common.m4 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
> -index fbba715..77d0f5c 100644
> +index a460a73..d427acb 100644
>  --- a/config-scripts/cups-common.m4
>  +++ b/config-scripts/cups-common.m4
> -@@ -446,7 +446,7 @@ AC_ARG_WITH(components, [  --with-components       set components to build:
> +@@ -434,7 +434,7 @@ LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
>
>   case "$COMPONENTS" in
>         all)
> @@ -24,5 +26,5 @@ index fbba715..77d0f5c 100644
>
>         core)
>  --
> -2.8.1
> +2.17.1
>
> diff --git a/package/cups/0002-Do-not-use-genstrings.patch b/package/cups/0002-Do-not-use-genstrings.patch
> index b3566b8b15..c7d6735b5f 100644
> --- a/package/cups/0002-Do-not-use-genstrings.patch
> +++ b/package/cups/0002-Do-not-use-genstrings.patch
> @@ -16,23 +16,25 @@ genstrings call.]
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  [Fabrice: updated for 2.3.0]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Michael: updated for 2.3.3]
> +Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>  ---
>   ppdc/Makefile | 2 --
>   1 file changed, 2 deletions(-)
>
>  diff --git a/ppdc/Makefile b/ppdc/Makefile
> -index 68bf6b2..d57a0c9 100644
> +index 32e2e0b..7b18879 100644
>  --- a/ppdc/Makefile
>  +++ b/ppdc/Makefile
> -@@ -242,8 +242,6 @@ genstrings:                genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
> -       $(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
> -               libcupsppdc.a $(LINKCUPSSTATIC)
> -       $(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
> +@@ -186,8 +186,6 @@ genstrings:                genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
> +       $(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
> +               libcupsppdc.a $(LINKCUPSSTATIC)
> +       $(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
>  -      echo Generating localization strings...
>  -      ./genstrings >sample.c
>
>
>   #
>  --
> -2.6.4
> +2.17.1
>
> diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
> index 8401e133e9..c2765dff09 100644
> --- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
> +++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
> @@ -13,15 +13,17 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
>  [Fabrice: updated for 2.3.0]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Michael: updated for 2.3.3]
> +Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>  ---
>   Makedefs.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makedefs.in b/Makedefs.in
> -index 3afef0a..299b297 100644
> +index 5f1d32f..d669ea8 100644
>  --- a/Makedefs.in
>  +++ b/Makedefs.in
> -@@ -148,7 +148,7 @@ IPPFIND_BIN        =       @IPPFIND_BIN@
> +@@ -155,7 +155,7 @@ ALL_CXXFLAGS       =       -I.. -D_CUPS_SOURCE $(CXXFLAGS) \
>                         $(ONDEMANDFLAGS) $(OPTIONS)
>   ALL_DSOFLAGS  =       -L../cups @ARCHFLAGS@ @RELROFLAGS@ $(DSOFLAGS) $(OPTIM)
>   ALL_LDFLAGS   =       -L../cups @LDARCHFLAGS@ @RELROFLAGS@ $(LDFLAGS)  \
> @@ -31,5 +33,5 @@ index 3afef0a..299b297 100644
>   ARFLAGS               =       @ARFLAGS@
>   BACKLIBS      =       @BACKLIBS@
>  --
> -2.7.4
> +2.17.1
>
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> index 8f037c6420..2eb289e209 100644
> --- a/package/cups/cups.hash
> +++ b/package/cups/cups.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated:
> -sha256 1bca9d89507e3f68cbc84482fe46ae8d5333af5bc2b9061347b2007182ac77ce  cups-2.3.1-source.tar.gz
> +sha256 261fd948bce8647b6d5cb2a1784f0c24cc52b5c4e827b71d726020bcc502f3ee  cups-2.3.3-source.tar.gz
>  sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>  sha256 a5d616e6322a9cb1a971e18765025edfca4f3cd9c0eafc32d6d2eb4b8c8787b5  NOTICE
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index cff198b06a..acd8c2066b 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -CUPS_VERSION = 2.3.1
> +CUPS_VERSION = 2.3.3
>  CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
>  CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
>  CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
