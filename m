From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:56:33 +0200
Subject: [Buildroot] [PATCH 1/3] package/brltty: bump to version 6.0
In-Reply-To: <20190928120835.29302-1-fontaine.fabrice@gmail.com>
References: <20190928120835.29302-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928225633.30dace74@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 14:08:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove first patch (already in version)
> - Update hash of README: small updates in year, version
> - Remove --without-viavoice option (not available anymore)
> - Disable espeak-ng (not available in buildroot yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ... 0001-Fix-linking-error-on-mips64el.patch} |  0
>  .../0001-buildsys-fix-cross-compilation.patch | 41 -------------------
>  package/brltty/brltty.hash                    |  4 +-
>  package/brltty/brltty.mk                      | 10 ++---
>  4 files changed, 7 insertions(+), 48 deletions(-)
>  rename package/brltty/{0002-Fix-linking-error-on-mips64el.patch => 0001-Fix-linking-error-on-mips64el.patch} (100%)
>  delete mode 100644 package/brltty/0001-buildsys-fix-cross-compilation.patch

Series applied, thanks. Note that to be better in this series, you
should have added unconditional --disable-expat --without-rgx-package
in the first patch. Indeed, if I applied only your first patch, the
expat and pcre optional dependencies would not be correctly handled.

But that's really nitpicking, since we anyway have lots of optional
dependencies in many packages that are not correctly handled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
