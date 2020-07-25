From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 17:01:07 -0700
Subject: [Buildroot] [PATCH v3 0/7] Cups revamp
In-Reply-To: <20200624204347.797088-1-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
Message-ID: <CAFSsvmoHvo-VboerGVcZhTSNT5=mw79re3qKv+F_XpZSUWVc0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

The cups bump in this series also fixes CVE-2020-3898 and
CVE-2019-8842, and as such
should be considered a security patch as well.

With that being said, I tested the changes and they all work as expected.

Tested-by: Adam Duskett <ADuskett@gmail.com>

On Wed, Jun 24, 2020 at 1:44 PM Angelo Compagnucci
<angelo@amarulasolutions.com> wrote:
>
> s series fixes various nitpicks we found using cups and do some
> bumps.
>
> Changelog:
> v1->v2:
> * Adding missing patch "Add lp user as default cups user"
> v1->v2:
> * Fixes to Signed-of
> * Decoupling service file fixing from bumps
> * Better explaining backported patches
>
> Angelo Compagnucci (7):
>   package/cups-filters: fix cups-browsed service
>   package/cups-filters: bump to version 1.27.5
>   package/cups: fix cups service
>   package/cups: bump to version 2.3.3
>   package/cups: Add lp user as default cups user
>   package/cups: Add udev rules to assign usb printers group to lp
>   package/cups: adding python support
>
>  package/cups-filters/S82cups-browsed          | 48 +++++++++++++++++++
>  package/cups-filters/cups-filters.hash        |  2 +-
>  package/cups-filters/cups-filters.mk          | 15 +++++-
>  ...move-man-from-BUILDDIRS-in-configure.patch |  8 ++--
>  package/cups/0002-Do-not-use-genstrings.patch | 14 +++---
>  ...0004-Remove-PIE-flags-from-the-build.patch |  8 ++--
>  package/cups/70-usb-printers.rules            |  3 ++
>  package/cups/S81cupsd                         | 48 +++++++++++++++++++
>  package/cups/cups.hash                        |  2 +-
>  package/cups/cups.mk                          | 37 +++++++++++++-
>  10 files changed, 167 insertions(+), 18 deletions(-)
>  create mode 100644 package/cups-filters/S82cups-browsed
>  create mode 100644 package/cups/70-usb-printers.rules
>  create mode 100644 package/cups/S81cupsd
>
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
