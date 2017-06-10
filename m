From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Jun 2017 12:46:40 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <20170606175659.GA2566@waldemar-brodkorb.de>
References: <20170606175659.GA2566@waldemar-brodkorb.de>
Message-ID: <ff243a9f-0788-c622-9911-63694ff5858f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Waldemar,

 As noted elsewhere, I'm positive about this patch, just a few additional
comments on top of Thomas's.

On 06-06-17 19:56, Waldemar Brodkorb wrote:
> We do not support uClibc-ng/musl C library version choice support,
> do the same for GNU C Library.
> Add me as Maintainer for the package.

 Whenever a Config.in symbol is removed, the commit message should explain why
legacy handling is not needed:

Legacy handling is not needed: we only take away choice from the user, existing
configs will still work the same. The only thing may change is the glibc
version, but version changes are "normal" for packages.

> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  DEVELOPERS                                         |   1 +
>  .../glibc/0001-sh-Fix-building-with-gcc5-6.patch   |  56 ++++++++++
>  package/glibc/2.23/0001-fix-CVE-2016-3075.patch    |  47 --------
>  package/glibc/2.23/0002-gcc6.patch                 |  88 ---------------
>  ...-fix-wrong-vfork-aliases-in-libpthread.so.patch |  76 -------------
>  ...more-fixes-to-the-vfork-aliases-in-libpth.patch | 122 ---------------------
>  .../2.23/0005-sh-Fix-building-with-gcc5-6.patch    |  56 ----------
>  .../2.24/0001-sh-Fix-building-with-gcc5-6.patch    |  56 ----------
>  .../2.25/0001-sh-Fix-building-with-gcc5-6.patch    |  56 ----------
>  package/glibc/Config.in                            |  29 +----
>  package/glibc/glibc.hash                           |   2 -
>  package/glibc/glibc.mk                             |   2 +-
>  12 files changed, 59 insertions(+), 532 deletions(-)
>  create mode 100644 package/glibc/0001-sh-Fix-building-with-gcc5-6.patch

 Please use 'git format-patch -M' to enable rename detection, so that we can
easily see that nothing changed in the patch.


 Regards,
 Arnout

>  delete mode 100644 package/glibc/2.23/0001-fix-CVE-2016-3075.patch
>  delete mode 100644 package/glibc/2.23/0002-gcc6.patch
>  delete mode 100644 package/glibc/2.23/0003-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
>  delete mode 100644 package/glibc/2.23/0004-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
>  delete mode 100644 package/glibc/2.23/0005-sh-Fix-building-with-gcc5-6.patch
>  delete mode 100644 package/glibc/2.24/0001-sh-Fix-building-with-gcc5-6.patch
>  delete mode 100644 package/glibc/2.25/0001-sh-Fix-building-with-gcc5-6.patch
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
