From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 24 Jan 2016 21:06:43 +0100
Subject: [Buildroot] [PATCH v4 5/5] package/cups-filters: Add new
 package cups-filters 1.7.0
In-Reply-To: <1453328267-31962-6-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
 <1453328267-31962-6-git-send-email-olivier.schonken@gmail.com>
Message-ID: <CAHXCMMJAdZz2pC3D7zNADL9jww-DP_M=uK-RwMogrFRhTmsERg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier,

On Wed, Jan 20, 2016 at 11:17 PM, Olivier Schonken
<olivier.schonken@gmail.com> wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  Config.in.legacy                       |  1 +
>  package/Config.in                      |  1 +
>  package/cups-filters/Config.in         | 41 ++++++++++++++++++++++++
>  package/cups-filters/cups-filters.hash |  2 ++
>  package/cups-filters/cups-filters.mk   | 57 ++++++++++++++++++++++++++++++++++
>  5 files changed, 102 insertions(+)
>  create mode 100644 package/cups-filters/Config.in
>  create mode 100644 package/cups-filters/cups-filters.hash
>  create mode 100644 package/cups-filters/cups-filters.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 793b116..cf509af 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -147,6 +147,7 @@ comment "Legacy options removed in 2016.02"
>
>  config BR2_PACKAGE_CUPS_PDFTOPS
>         bool "Pdftops support has been removed from Cups"
> +       select BR2_PACKAGE_CUPS_FILTERS_PDFTOPS
>         select BR2_LEGACY
>         help
>           Pdftops support has been removed from the cups package
> diff --git a/package/Config.in b/package/Config.in
> index 8883bbf..9f52194 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1310,6 +1310,7 @@ menu "Networking applications"
>         source "package/crda/Config.in"
>         source "package/ctorrent/Config.in"
>         source "package/cups/Config.in"
> +       source "package/cups-filters/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/dhcp/Config.in"
>  endif
> diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
> new file mode 100644
> index 0000000..1acfbe8
> --- /dev/null
> +++ b/package/cups-filters/Config.in
> @@ -0,0 +1,41 @@
> +config BR2_PACKAGE_CUPS_FILTERS
> +       bool "cups-filters"
> +       # needs fork()
> +       depends on BR2_USE_MMU
> +       depends on !BR2_STATIC_LIBS
> +       select BR2_PACKAGE_CUPS
> +       select BR2_PACKAGE_LIBGLIB2
> +       select BR2_PACKAGE_IJS
> +       select BR2_PACKAGE_LCMS2
> +       select BR2_PACKAGE_POPPLER
> +       select BR2_PACKAGE_QPDF
> +       help
> +         This project provides backends, filters, and other software that was
> +         once part of the core CUPS distribution but is no longer maintained
> +         by Apple Inc. In addition it contains additional filters and software
> +         developed independently of Apple, especially filters for the PDF-
> +         centric printing workflow introduced by OpenPrinting and a daemon
> +         to browse Bonjour broadcasts of remote CUPS printers to make these
> +         printers available locally and to provide backward compatibility to
> +         the old CUPS broadcasting and browsing of CUPS 1.5.x and older.
> +         From CUPS 1.6.0 on, this package is required for using printer drivers
> +         with CUPS under Linux. With CUPS 1.5.x and earlier this package can be
> +         used optionally to switch over to PDF-based printing.
> +
> +         http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
> +
> +comment "cups-filters needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS

Nitpicking: if you move this comment before the config, the options in
the below if-block will be intented in menuconfig (just to make the
the look and feel better ;-]).

Otherwize, it looks good!

Regards,

-- 
Samuel
