From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 10 Jun 2021 21:25:19 +0200
Subject: [Buildroot] [PATCH 1/1] mtd-utils-2.1.2: ubihealthd depends on
 ubifs support
In-Reply-To: <20210609234819.1860554-2-mmayer@broadcom.com>
References: <20210609234819.1860554-1-mmayer@broadcom.com>
 <20210609234819.1860554-2-mmayer@broadcom.com>
Message-ID: <CAEyMn7YoGJVmJV-c=YmSFa4PdQUMML_=c_EyfAXEUZEFujs+6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Markus,

Am Do., 10. Juni 2021 um 01:54 Uhr schrieb Markus Mayer via buildroot
<buildroot@busybox.net>:
>
> ubihealthd is only being built, if mtd-utils are being built
> --with-ubifs. Reflect that dependency within buildroot.
>
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  package/mtd/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index c7ad3b3cdc9c..64a7ae19a7e2 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -139,6 +139,7 @@ config BR2_PACKAGE_MTD_UBIFORMAT
>
>  config BR2_PACKAGE_MTD_UBIHEALTHD
>         bool "ubihealthd"
> +       depends on BR2_PACKAGE_MTD_UBIFS_UTILS
>         default y
>
>  config BR2_PACKAGE_MTD_UBIMKVOL

Thanks

-- 
Heiko
