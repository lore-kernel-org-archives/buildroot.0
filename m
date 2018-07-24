From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 24 Jul 2018 15:48:42 +0200
Subject: [Buildroot] [PATCH 1/1] network-manager: add optional
 dependency on polkit
In-Reply-To: <20180724105013.7137-1-apanfilov@spectracom.com>
References: <20180724105013.7137-1-apanfilov@spectracom.com>
Message-ID: <20180724134841.GA11682@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Artem,

> Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
> ---
>  package/network-manager/network-manager.mk | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index a520aad9c0..9774921838 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -82,6 +82,10 @@ else
>  NETWORK_MANAGER_CONF_OPTS += --disable-ovs
>  endif

> +ifeq ($(BR2_PACKAGE_POLKIT),y)
> +NETWORK_MANAGER_DEPENDENCIES += polkit
> +endif
Shouldn't we pass --enable-polkit=yes to configure?
Or is it enough that it's detected here?

> +
>  # uClibc by default doesn't have backtrace support, so don't use it
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>  NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace


Kind regards,
Petr
