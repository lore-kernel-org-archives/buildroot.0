From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:28:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: do not force c99 mode
In-Reply-To: <20200505163657.45865-1-fontaine.fabrice@gmail.com>
References: <20200505163657.45865-1-fontaine.fabrice@gmail.com>
Message-ID: <20200507232846.1a11376d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 May 2020 18:36:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Do not force c99 mode to be able to remove both patches and because it
> does not seem to be motivated. Indeed, even if the second patch was
> sucessfully upstreamed. The first one can't be upstreamed as it raises
> the following build falure on Solaris 11 (due to mixing c99 and
> _POSIX_C_SOURCE):
> 
>  #if defined(STDC_C99) && (defined(_XOPEN_OR_POSIX) && !defined(XPG6))
>  #error "Compiler or options invalid for pre-UNIX 03 X/Open applications \
>  and pre-2001 POSIX applications"
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...perly-get-struct-timespec-definition.patch | 38 -------------------
>  ...gure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch | 38 -------------------
>  package/mbuffer/mbuffer.mk                    |  3 --
>  3 files changed, 79 deletions(-)
>  delete mode 100644 package/mbuffer/0001-globals.c-properly-get-struct-timespec-definition.patch
>  delete mode 100644 package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
