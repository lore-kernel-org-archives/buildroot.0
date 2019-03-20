From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 23:04:39 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/meson: bump version to
 0.50.0"
In-Reply-To: <20190320215411.11874-1-fontaine.fabrice@gmail.com>
References: <20190320215411.11874-1-fontaine.fabrice@gmail.com>
Message-ID: <c5c64720-173b-f5f0-1eb0-0309f4bdd463@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/03/2019 22:54, Fabrice Fontaine wrote:
> This reverts commit 114e9dcd28e1001b74689215ec669b8940dc3ea9.
> Indeed, there is major issue with this version because c_std is not
> passed anymore when cross-compiling:
> https://github.com/mesonbuild/meson/issues/5097
> 
> As a result, some meson packages (at least systemd, libmpdclient,
> glib-networking) fail to build
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9eae2181fb3fcfe12481e5496b7d87c0dcd109eb
>  - http://autobuild.buildroot.org/results/e828c7925d9247e14d8a8694febfee8ce6c86e81
>  - http://autobuild.buildroot.org/results/031aee7cf12ad882727eb2da5e953fd8813b52e2
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 There should be an empty line before the Sob.

 Applied to master with that fixed, thanks.

 Regards,
 Arnout


> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index e3d740b17c..fadef6df8a 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.50.0/meson-0.50.0.tar.gz.asc
> -sha256 2a1bc42dda58206fb922cda5e1ca95cc03ad126321d26acc47d3493ec4e7021f meson-0.50.0.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.49.2/meson-0.49.2.tar.gz.asc
> +sha256 ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd meson-0.49.2.tar.gz
>  sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index fbfef7002f..49e27f5527 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MESON_VERSION = 0.50.0
> +MESON_VERSION = 0.49.2
>  MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>  MESON_LICENSE = Apache-2.0
>  MESON_LICENSE_FILES = COPYING
> 
