From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:49:30 +0200
Subject: [Buildroot] [PATCH 1/2] package/quota: bump to version 4.05
In-Reply-To: <20190329172528.22787-1-fontaine.fabrice@gmail.com>
References: <20190329172528.22787-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331144930.3e7ea77e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Mar 2019 18:25:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add COPYING and its hash to license files
> - Drop all patches (not needed anymore or already in version)
> - Drop autoreconf
> - Drop --disable-strip-binaries (not available anymore)
> - Drop all "hacks" as package now use pkg-config and automake
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/quota/0001-tools-getrpcbynumber.patch |  42 ----
>  package/quota/0002-fix-static-linking.patch   |  55 -----
>  .../quota/0003-remove-non-posix-types.patch   | 200 ------------------
>  package/quota/0004-import-sys-cdefs.patch     |  18 --
>  package/quota/0005-include-fcntl.patch        |  20 --
>  package/quota/quota.hash                      |  10 +-
>  package/quota/quota.mk                        |  25 +--
>  7 files changed, 11 insertions(+), 359 deletions(-)
>  delete mode 100644 package/quota/0001-tools-getrpcbynumber.patch
>  delete mode 100644 package/quota/0002-fix-static-linking.patch
>  delete mode 100644 package/quota/0003-remove-non-posix-types.patch
>  delete mode 100644 package/quota/0004-import-sys-cdefs.patch
>  delete mode 100644 package/quota/0005-include-fcntl.patch

Both applied, thanks!

I think the QUOTA_LIBS stuff with TARGET_NLS_LIBS could be removed by
patching quota's Makefile.am to properly use $(INTLLIBS). Perhaps this
could be a useful contribution to upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
