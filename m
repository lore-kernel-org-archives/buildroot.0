From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 19 Oct 2011 11:41:19 +0200
Subject: [Buildroot] [PATCH] Add libmodbus package
In-Reply-To: <1319014336-22698-1-git-send-email-julien.boibessot@free.fr>
References: <1319014336-22698-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <CAGm1_ksV6r8NOby7Xa_aN1xnji7DdnU+2zawP0ToUGEkdoHNOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 19, 2011 at 10:52 AM,  <julien.boibessot@free.fr> wrote:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
>
>
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> ---
> ?Based on previous work of Marek Belisko and comments of Thomas Petazzoni.
>
> ?package/Config.in ? ? ? ? ? ? ?| ? ?1 +
> ?package/libmodbus/Config.in ? ?| ? ?8 ++++++++
> ?package/libmodbus/libmodbus.mk | ? 11 +++++++++++
> ?3 files changed, 20 insertions(+), 0 deletions(-)
> ?create mode 100644 package/libmodbus/Config.in
> ?create mode 100644 package/libmodbus/libmodbus.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 3b2769d..c4a5ee5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -332,6 +332,7 @@ source "package/libidn/Config.in"
> ?source "package/libmicrohttpd/Config.in"
> ?source "package/neon/Config.in"
> ?source "package/libmnl/Config.in"
> +source "package/libmodbus/Config.in"
> ?source "package/libnl/Config.in"
> ?source "package/libpcap/Config.in"
> ?source "package/libosip2/Config.in"
> diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
> new file mode 100644
> index 0000000..ccf1190
> --- /dev/null
> +++ b/package/libmodbus/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBMODBUS
> + ? ? ? bool "libmodbus"
> + ? ? ? help
> + ? ? ? ? libmodbus is a free software library to send/receive data according
> + ? ? ? ? to the Modbus protocol. This library is written in C and supports
> + ? ? ? ? RTU (serial) and TCP (Ethernet) communications.
> +
> + ? ? ? ? http://libmodbus.org
> diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
> new file mode 100644
> index 0000000..6af855f
> --- /dev/null
> +++ b/package/libmodbus/libmodbus.mk
> @@ -0,0 +1,11 @@
> +#############################################################
> +#
> +# libmodbus
> +#
> +#############################################################
> +LIBMODBUS_VERSION = 3.0.1
> +LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
> +LIBMODBUS_SOURCE = libmodbus-$(LIBMODBUS_VERSION).tar.gz
> +LIBMODBUS_INSTALL_STAGING = YES
> +
> +$(eval $(call AUTOTARGETS,package,libmodbus))
> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

please change

$(eval $(call AUTOTARGETS,package,libmodbus))

to

$(eval $(call AUTOTARGETS))

Yegor
