From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 08:41:43 +0200
Subject: [Buildroot] [PATCH v2] lz4: improve static only build support
In-Reply-To: <e5fee55fc78a363b247f0eb8594aa9f40d3a1526.1524199966.git.baruch@tkos.co.il>
References: <e5fee55fc78a363b247f0eb8594aa9f40d3a1526.1524199966.git.baruch@tkos.co.il>
Message-ID: <20180420084143.3b20bd3a@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 07:52:46 +0300, Baruch Siach wrote:
> The current method of supporting static only build, removal of all lines
> that match the SHARED regex from lib/Makefile, is crude and fragile.
> Instead, patch lib/Makefile to allow disable of shared libraries.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks for the new version, I've applied, but I have one question below.

> ---
> v2: Leave DESTDIR and PREFIX alone (Thomas P)
> ---
>  ...ib-allow-to-disable-shared-libraries.patch | 59 +++++++++++++++++++
>  package/lz4/lz4.mk                            | 12 ++--
>  2 files changed, 64 insertions(+), 7 deletions(-)
>  create mode 100644 package/lz4/0002-lib-allow-to-disable-shared-libraries.patch
> 
> diff --git a/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch b/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch
> new file mode 100644
> index 000000000000..4f89e85577b3
> --- /dev/null
> +++ b/package/lz4/0002-lib-allow-to-disable-shared-libraries.patch
> @@ -0,0 +1,59 @@
> +From 95bde2a4ae4a92e984a5783ca1f09f44bf04fadb Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Thu, 19 Apr 2018 12:28:11 +0300
> +Subject: [PATCH] lib: allow to disable shared libraries
> +
> +Just like BUILD_STATIC=no disables static libraries, BUILD_SHARED=no
> +disabled shared libraries. This is useful to support toolchains that do
> +not support shared libraries.

Why aren't we using BUILD_STATIC=no when BR2_SHARED_LIBS=y, to disable
the build of the static library ?

Admittedly, it isn't a huge improvement, but for consistency it would
be good to do that.

Thanks again,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
