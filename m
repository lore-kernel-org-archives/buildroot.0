From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Wed, 4 Dec 2019 13:07:08 +0000
Subject: [Buildroot] [PATCH 3/7] sysrepo: libnetconf2 is not needed
In-Reply-To: <9ce249faace5681092cd55ca8a1a046479c66bc5.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <9ce249faace5681092cd55ca8a1a046479c66bc5.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <fcc5b731d0014376b538fcd82cfafd84@kontron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Urspr?ngliche Nachricht-----
> Von: buildroot [mailto:buildroot-bounces at busybox.net] Im Auftrag von Jan
> Kundr?t
> Gesendet: Mittwoch, 4. Dezember 2019 10:35
> An: buildroot at buildroot.org
> Cc: Heiko Thiery; Fabrice Fontaine
> Betreff: [Buildroot] [PATCH 3/7] sysrepo: libnetconf2 is not needed
> 
> The libnetconf2 library is a dependency of Netopeer2. Sysrepo does not have a
> NETCONF server or a NETCONF client, so it does not use this library.
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Acked-by: Heiko Thiery <heiko.thiery@kontron.com>

> ---
>  package/sysrepo/Config.in  | 1 -
>  package/sysrepo/sysrepo.mk | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in index
> 18a09e0c57..df7f0fd68e 100644
> --- a/package/sysrepo/Config.in
> +++ b/package/sysrepo/Config.in
> @@ -8,7 +8,6 @@ config BR2_PACKAGE_SYSREPO
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" #
> host-protobuf
>  	select BR2_PACKAGE_LIBAVL
>  	select BR2_PACKAGE_LIBEV
> -	select BR2_PACKAGE_LIBNETCONF2
>  	select BR2_PACKAGE_LIBYANG
>  	select BR2_PACKAGE_PCRE
>  	select BR2_PACKAGE_PCRE_UCP
> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk index
> 49c908d62d..216e517526 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -9,8 +9,8 @@ SYSREPO_SITE = $(call
> github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
>  SYSREPO_INSTALL_STAGING = YES
>  SYSREPO_LICENSE = Apache-2.0
>  SYSREPO_LICENSE_FILES = LICENSE
> -SYSREPO_DEPENDENCIES = libev libnetconf2 libavl libyang pcre protobuf-c
> host-sysrepo -HOST_SYSREPO_DEPENDENCIES = host-libev host-libnetconf2
> host-libavl host-libyang host-pcre host-protobuf-c
> +SYSREPO_DEPENDENCIES = libev libavl libyang pcre protobuf-c
> +host-sysrepo HOST_SYSREPO_DEPENDENCIES = host-libev host-libavl
> +host-libyang host-pcre host-protobuf-c
> 
>  SYSREPO_CONF_OPTS = \
>  	-DIS_DEVELOPER_CONFIGURATION=OFF \
> --
> 2.21.0
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
