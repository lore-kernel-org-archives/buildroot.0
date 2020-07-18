From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:56:29 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/meson: bump to version 0.55.0
In-Reply-To: <20200717080356.3094739-1-james.hilliard1@gmail.com>
References: <20200717080356.3094739-1-james.hilliard1@gmail.com>
Message-ID: <20200718155629.34b85f3a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Jul 2020 02:03:56 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop fix rpath patch which is no longer needed.
> 
> Drop g-ir-scanner/g-ir-compiler override patch which is now upstream.
> 
> Rebase remaining patches.
> 
> Meson now requires single quotes for cross-compilation.conf, replace
> double quotes with single quotes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - cleanup make-sq-comma-list syntax
> Changes v2 -> v3:
>   - remove rpath patch
> ---
>  ...-RPATH-if-install_rpath-is-not-empty.patch | 36 ---------
>  ...ic-libs-when-default-library-static.patch} |  8 +-
>  ...encies-base.py-add-pkg_config_stati.patch} |  8 +-
>  ...-g-ir-scanner-and-g-ir-compiler-bina.patch | 74 -------------------
>  package/meson/meson.hash                      |  4 +-
>  package/meson/meson.mk                        |  2 +-
>  package/pkg-meson.mk                          | 12 +--
>  support/misc/utils.mk                         |  4 +
>  8 files changed, 21 insertions(+), 127 deletions(-)
>  delete mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
>  rename package/meson/{0002-Prefer-ext-static-libs-when-default-library-static.patch => 0001-Prefer-ext-static-libs-when-default-library-static.patch} (91%)
>  rename package/meson/{0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch => 0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch} (95%)
>  delete mode 100644 package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
