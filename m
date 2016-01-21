From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 23:39:44 +0100
Subject: [Buildroot] [PATCH v4 1/5] package/cups: Un-deprecate,
 and update CUPS to 2.1.2
In-Reply-To: <1453328267-31962-2-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
 <1453328267-31962-2-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160121233944.2b414593@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier,

On Thu, 21 Jan 2016 00:17:43 +0200, Olivier Schonken wrote:
> Remove 0001-fix-static.patch - Fixed upstream
> Remove 0002-fix-stack-protector-check.patch - Fixed upstream
> Remove 0003-mantohtml.patch - Replaced by 0001-Remove-man-from-BUILDDIRS-in-
> configure.patch
> Add 0002-Do-not-use-genstrings.patch
> Add CUPS_PDFTOPS option to Config.in.legacy - This support was moved to the
> cups-filters package.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  Config.in.legacy                                   |  7 +++
>  ...01-Remove-man-from-BUILDDIRS-in-configure.patch | 28 ++++++++++++
>  package/cups/0001-fix-static.patch                 | 28 ------------
>  package/cups/0002-Do-not-use-genstrings.patch      | 30 +++++++++++++
>  package/cups/0002-fix-stack-protector-check.patch  | 25 -----------
>  package/cups/0003-mantohtml.patch                  | 11 -----
>  package/cups/Config.in                             | 16 ++-----
>  package/cups/cups.hash                             |  2 +
>  package/cups/cups.mk                               | 50 ++++++++++++++--------
>  9 files changed, 102 insertions(+), 95 deletions(-)
>  create mode 100644 package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
>  delete mode 100644 package/cups/0001-fix-static.patch
>  create mode 100644 package/cups/0002-Do-not-use-genstrings.patch
>  delete mode 100644 package/cups/0002-fix-stack-protector-check.patch
>  delete mode 100644 package/cups/0003-mantohtml.patch
>  create mode 100644 package/cups/cups.hash

Applied after doing a few changes:

    [Thomas:
     - rewrap patch description in patch 0001
     - adjust patch 0002 to completely remove the call to genstrings
       instead of commenting it, and remove the potentially confusing
       'echo' above it
     - add a third patch that sanitizes the installation process to avoid
       non-working stripping, owernship changes, etc.]

If you could work with upstream to submit those patches (they will have
to be done in a better way to be acceptable upstream), it would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
