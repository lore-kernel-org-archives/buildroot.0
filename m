From: Laurent Cans <laurent.cans@gmail.com>
Date: Fri, 4 Jun 2021 17:32:27 +0200
Subject: [Buildroot] [PATCH next] package/aircrack-ng: requires RC4
 support in openssl
In-Reply-To: <b6e89a157a624095c2c285f4b142404f5272b5de.1622792160.git.baruch@tkos.co.il>
References: <b6e89a157a624095c2c285f4b142404f5272b5de.1622792160.git.baruch@tkos.co.il>
Message-ID: <CAA1eMkFHtmkqK=i4MDq-84PzwSXNkO8s11n-zG60-815wbZfJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le ven. 4 juin 2021 ? 09:36, Baruch Siach <baruch@tkos.co.il> a ?crit :
>
> Enable RC4 in openssl to fix build failure when openssl is the crypto
> backend of aircrack-ng.
>
> Fixes:
> http://autobuild.buildroot.net/results/007b7d88aed3902fb8ed10ee5c0ff0dc1899756d/
> http://autobuild.buildroot.net/results/da464dd449bb950104122535eabf8a4e914d0a9e/
> http://autobuild.buildroot.net/results/d10fec8378c334e896d9e38afe00193ef747192f/
>
> Cc: Laurent Cans <laurent.cans@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/aircrack-ng/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
> index f3e2bc4ef12b..eb997e8d1bdb 100644
> --- a/package/aircrack-ng/Config.in
> +++ b/package/aircrack-ng/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_AIRCRACK_NG
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on !BR2_STATIC_LIBS # dlfcn.h
>         select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
> +       select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
>         help
>           A set of tools for auditing wireless networks
>
> --
> 2.30.2
>

Acked-by: Laurent Cans <laurent.cans@gmail.com>

Laurent
