From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 19 Jan 2015 20:42:31 +0100
Subject: [Buildroot] ][PATCH V3] dvd+rw-tools: new package
References: <54BB54A4.8080301@ou.edu>
Message-ID: <XnsA427D2A8DC928berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Steve Kenton <skenton@ou.edu> wrote in 
news:54BB54A4.8080301 at ou.edu:

> +config BR2_PACKAGE_DVDRW_TOOLS
> +     bool "dvdrw-tools"
> +     select BR2_PACKAGE_XORRISO
> +     help
> +       The dvd+rw-tools are used to master Blu-ray Disc
> +       and DVD Disc media, both +RW/+R and -RW/-R. The
> +       +RW in the name is a historical artifact. This
> +       package contains the widely used growisofs program.
> +     
> +       http://fy.chalmers.se/~appro/linux/DVD+RW/tools
> +
> +comment "dvdrw-tools needs a toolchain w/ wchar, largefile"
> +     depends on !BR2_USE_WCHAR || !BR2_LARGEFILE

Hi,

xorriso has more dependencies than dvd+rw-tools, namely

depends on BR2_TOOLCHAIN_HAS_THREADS
depends on BR2_USE_MMU # fork()

which should also be followed in dvdrw-tools.

Regards, Bernd
