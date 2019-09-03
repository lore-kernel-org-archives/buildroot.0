From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Sep 2019 08:20:47 +0300
Subject: [Buildroot] [PATCH 1/1] libuwsc: new package
In-Reply-To: <KL1PR0201MB21194E30E14A3D58B3090993FAB90@KL1PR0201MB2119.apcprd02.prod.outlook.com>
References: <KL1PR0201MB21194E30E14A3D58B3090993FAB90@KL1PR0201MB2119.apcprd02.prod.outlook.com>
Message-ID: <20190903052047.vensyjfkuve7pgxf@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jianhui Zhao,

Thanks for your contribution.

I have a few comments below.

On Tue, Sep 03, 2019 at 04:54:00AM +0000, ? ?? wrote:
> Signed-off-by: Jianhui Zhao <zhaojh329@outlook.com>

Your sign-off name should match the patch author name which is taken from the 
email From: header by default.

> ---
> ?package/Config.in ? ? ? ? ?| ?1 +
> ?package/libuwsc/Config.in ?| ?8 ++++++++
> ?package/libuwsc/libuwsc.mk | 13 +++++++++++++

You should add a .hash file listing hashes of tarball and license file.

> ?3 files changed, 22 insertions(+)
> ?create mode 100644 package/libuwsc/Config.in
> ?create mode 100644 package/libuwsc/libuwsc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 710ed12be0..d1ea644cd2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1622,6 +1622,7 @@ menu "Networking"
> ? ? ? ? source "package/libupnp18/Config.in"
> ? ? ? ? source "package/libupnpp/Config.in"
> ? ? ? ? source "package/liburiparser/Config.in"
> + ? ? ? source "package/libuwsc/Config.in"
> ? ? ? ? source "package/libvncserver/Config.in"
> ? ? ? ? source "package/libwebsock/Config.in"
> ? ? ? ? source "package/libwebsockets/Config.in"
> diff --git a/package/libuwsc/Config.in b/package/libuwsc/Config.in
> new file mode 100644
> index 0000000000..ae99b6d2dc
> --- /dev/null
> +++ b/package/libuwsc/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBUWSC
> + ? ? ? bool "libuwsc"
> + ? ? ? select BR2_PACKAGE_LIBEV
> + ? ? ? help
> + ? ? ? ? A Lightweight and fully asynchronous WebSocket client
> + ? ? ? ? library based on libev.
> +
> + ? ? ? ? https://github.com/zhaojh329/libuwsc
> diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
> new file mode 100644
> index 0000000000..354a866739
> --- /dev/null
> +++ b/package/libuwsc/libuwsc.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# libuwsc
> +#
> +################################################################################
> +
> +LIBUWSC_VERSION = 3.3.2
> +LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
> +LIBUWSC_LICENSE = MIT

Please add

  LIBUWSC_LICENSE_FILES = LICENSE

> +LIBUWSC_INSTALL_STAGING = YES
> +LIBUWSC_DEPENDENCIES = libev

README.md mentions optional dependency on openssl, mbedtls and wolfssl for 
SSL. It would be nice to optionally support that when one of them is enabled.

> +
> +$(eval $(cmake-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
