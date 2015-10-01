From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 1 Oct 2015 14:29:44 -0500
Subject: [Buildroot] [PATCH] libssh: bump to version 0.7.2
In-Reply-To: <2490c4cadb0735ae8a6a4cd26accc6071540d9bf.1443724248.git.baruch@tkos.co.il>
References: <2490c4cadb0735ae8a6a4cd26accc6071540d9bf.1443724248.git.baruch@tkos.co.il>
Message-ID: <CAMQcK5LhGU92=TX+JK_uBVBFYNK9fJf5ZNFQRgQ3LV8vquqYOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Baruch,

On Thu, Oct 1, 2015 at 1:30 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Also, require threads support. cmake detects threads support correctly, but
> libssh build system uses this information incorrectly.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libssh/Config.in   | 5 +++--
>  package/libssh/libssh.hash | 6 +++---
>  package/libssh/libssh.mk   | 4 ++--
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/package/libssh/Config.in b/package/libssh/Config.in
> index 30aabd621fb6..3357fb9e9252 100644
> --- a/package/libssh/Config.in
> +++ b/package/libssh/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSSH
>         bool "libssh"
>         depends on BR2_USE_MMU # fork()
>         depends on !BR2_STATIC_LIBS
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>         # Either OpenSSL or libgcrypt are mandatory
>         select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
>         help
> @@ -12,6 +13,6 @@ config BR2_PACKAGE_LIBSSH
>
>           http://www.libssh.org/
>
> -comment "libssh needs a toolchain w/ dynamic library"
> +comment "libssh needs a toolchain w/ dynamic library, threads"
>         depends on BR2_USE_MMU
> -       depends on BR2_STATIC_LIBS
> +       depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS

It appears that this patch an your previous patch should be a series.
Was this your intention?

This patch assume that your previous patch has been applied in order
to bump the version. Your previous patch being "libssh: needs shared
library support" [1].

Thanks,
-Ryan

[1] - http://lists.busybox.net/pipermail/buildroot/2015-October/140551.html

[...]

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
