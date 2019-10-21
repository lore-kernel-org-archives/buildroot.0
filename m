From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 21 Oct 2019 07:59:07 -0500
Subject: [Buildroot] [PATCH 1/1] package/valijson: bump version to 0.2
In-Reply-To: <1571639828-3765-1-git-send-email-santosh.multhalli@rockwellcollins.com>
References: <1571639828-3765-1-git-send-email-santosh.multhalli@rockwellcollins.com>
Message-ID: <CANQCQpYkSPq_w_+-4oyJ_c4YrBbpZ5qvkH5C8WaMAvs9oeynZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Santosh,

On Mon, Oct 21, 2019 at 1:37 AM Santosh Multhalli
<santosh.multhalli@rockwellcollins.com> wrote:
>

Could you add some notes here describing the new curlpp dependency and
make file change?

> Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
> ---
>  package/valijson/Config.in     | 3 ++-
>  package/valijson/valijson.hash | 2 +-
>  package/valijson/valijson.mk   | 6 +++---
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/package/valijson/Config.in b/package/valijson/Config.in
> index 10721b3..cf9954c 100644
> --- a/package/valijson/Config.in
> +++ b/package/valijson/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_VALIJSON
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         select BR2_PACKAGE_BOOST
>         select BR2_PACKAGE_BOOST_REGEX
> +        select BR2_PACKAGE_CURLPP

See above, probably need to describe this in the commit description.

>         help
>           Valijson is a header-only JSON Schema Validation library for
>           C++. Valijson provides a simple validation API that allows
> @@ -15,4 +16,4 @@ config BR2_PACKAGE_VALIJSON
>           https://github.com/tristanpenman/valijson
>
>  comment "valijson needs a toolchain w/ C++, threads, wchar  support"
> -       depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +       depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR

Was this formatting change found manually?  If so, could you run
./utils/check-package package/valijson/* to validate against the
schema?

> diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
> index cd34ecb..f245750 100644
> --- a/package/valijson/valijson.hash
> +++ b/package/valijson/valijson.hash
> @@ -1,2 +1,2 @@
>  # Locally Computed:
> -sha256  d22c1f8fe27d43e5a27aad1d3cbe9f1318ec28ccfa913e615663ed2bd6a5d063  valijson-0.1.tar.gz
> +sha256  77dbebb40dab2e834557c2fcc39122cdb2d0fe26bf591c2b3e0df5a316a45592  valijson-0.2.tar.gz

Suggest adding a license file hash (for example, see
package/libcurl/libcurl.hash)

> diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
> index a804334..24e720e 100644
> --- a/package/valijson/valijson.mk
> +++ b/package/valijson/valijson.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>
> -VALIJSON_VERSION = 0.1
> +VALIJSON_VERSION = 0.2
>  VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
>  VALIJSON_LICENSE = BSD-2-Clause
>  VALIJSON_LICENSE_FILES = LICENSE
>  VALIJSON_INSTALL_STAGING = YES
>  VALIJSON_INSTALL_TARGET = NO
> -VALIJSON_DEPENDENCIES = boost
> -VALIJSON_CONF_OPTS = -DINSTALL_HEADERS=TRUE
> +VALIJSON_DEPENDENCIES = boost curlpp
> +VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE

See above, probably need to describe this in the commit description.

Thanks for the bump!
