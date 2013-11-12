From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 12 Nov 2013 08:59:10 -0600
Subject: [Buildroot] [PATCH 0/7] RFC: Move to github as source for
 ARC-specific packages
In-Reply-To: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
Message-ID: <CAEBucnCw-KQ9bgZazwgs9PkV9MvRHsQ4Wh8LicJrF48Xo4p89A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Nov 12, 2013 7:26 AM, "Mischa Jonker" <Mischa.Jonker@synopsys.com> wrote:
>
> Hi,
>
> This set of patches gets rid of the Synopsys website for downloading
> ARC-specific versions of binutils, gdb, gcc, uClibc. Instead, our github
> site is used, and the git-protocol where possible (all packages except
gcc).
>
> Although our toolchain release is not completely finished, and a couple
> of issues are still being worked on, I would like to get some feedback
already
> on this patch set: after all, it's easy to update the git ID's associated
> with the final release when that is ready (hopefully within a week or
two).
>
> The new toolchain release fixes a number of auto-builder issues.
>
> Thanks,
>
> Mischa
>
> Mischa Jonker (7):
>   gdb: arc: Use git instead of website
>   binutils: arc: Use git instead of website
>   gcc: arc: Download from github instead of Synopsys website
>   uclibc: arc: Use git instead of website
>   gcc: remove ARC-specific patches
>   uclibc: remove ARC-specific patches
>   Revert "arc: Add option for ARC-specific download site"
>
>  arch/Config.in.arc                                 |    4 -
>  package/binutils/Config.in.host                    |    2 +-
>  package/binutils/binutils.mk                       |    3 +-
>  package/gcc/4.8-arc/100-uclibc-conf.patch          |   15 --
>  package/gcc/4.8-arc/301-missing-execinfo_h.patch   |   13 --
>  package/gcc/4.8-arc/302-c99-snprintf.patch         |   13 --
>  .../gcc/4.8-arc/305-libmudflap-susv3-legacy.patch  |   49 -------
>  package/gcc/4.8-arc/disable_gc_sections.patch      |  145
--------------------
>  package/gcc/4.8-arc/fix_branch_out_of_range.patch  |   30 ----
>  package/gcc/Config.in.host                         |    2 +-
>  package/gcc/gcc.mk                                 |   11 +-
>  package/gdb/Config.in.host                         |    2 +-
>  package/gdb/gdb.mk                                 |    9 +-
>  package/uclibc/0.9.33-arc/fix-fstat-for-be.patch   |   32 -----
>  .../uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch  |   37 -----
>  package/uclibc/0.9.33-arc/fix-susv3-legacy.patch   |   36 -----
>  .../0.9.33-arc/uclibc-arc-add-__kernel_long.patch  |   29 ----
>  package/uclibc/Config.in                           |    9 +-
>  package/uclibc/uclibc.mk                           |    5 +-
>  19 files changed, 23 insertions(+), 423 deletions(-)
>  delete mode 100644 package/gcc/4.8-arc/100-uclibc-conf.patch
>  delete mode 100644 package/gcc/4.8-arc/301-missing-execinfo_h.patch
>  delete mode 100644 package/gcc/4.8-arc/302-c99-snprintf.patch
>  delete mode 100644 package/gcc/4.8-arc/305-libmudflap-susv3-legacy.patch
>  delete mode 100644 package/gcc/4.8-arc/disable_gc_sections.patch
>  delete mode 100644 package/gcc/4.8-arc/fix_branch_out_of_range.patch
>  delete mode 100644 package/uclibc/0.9.33-arc/fix-fstat-for-be.patch
>  delete mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy-bcmp.patch
>  delete mode 100644 package/uclibc/0.9.33-arc/fix-susv3-legacy.patch
>  delete mode 100644
package/uclibc/0.9.33-arc/uclibc-arc-add-__kernel_long.patch
>
> --
> 1.7.9.5
>
>

Just a quick comment.  When downloading from github do not use the git://
protocol use http:// as shown in section 6.2.8 of the buildroot manual.

Thanks,
Spenser _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131112/5b3a82b2/attachment-0001.html>
