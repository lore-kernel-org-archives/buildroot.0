From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 18:04:17 +0100
Subject: [Buildroot] [PATCH v5 36/36]
 package/libemotion-generic-players: new package
In-Reply-To: <1445720476-21517-37-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-37-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025170417.GH11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> diff --git a/package/libemotion-generic-players/Config.in b/package/libemotion-generic-players/Config.in
> new file mode 100644
> index 0000000..71bca42
> --- /dev/null
> +++ b/package/libemotion-generic-players/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBEMOTION_GENERIC_PLAYERS
> +	bool "libemotion generic players"
> +	select BR2_PACKAGE_VLC # needs libvlc
> +	depends on BR2_PACKAGE_EFL
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # vlc
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 # vlc

Please put the depends before the selects. ;-)

Also, you forgot a *lot* of VLC dependencies. Please propagate all of
them.

> +	help
> +	  A media object library for Evas and Ecore.
> +
> +	  https://www.enlightenment.org
> +	  https://docs.enlightenment.org/stable/efl/emotion_main.html
> +
> +comment "libemotion generic players needs a (e)glibc toolchain"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_USE_MMU
> diff --git a/package/libemotion-generic-players/libemotion-generic-players.hash b/package/libemotion-generic-players/libemotion-generic-players.hash
> new file mode 100644
> index 0000000..80c8123
> --- /dev/null
> +++ b/package/libemotion-generic-players/libemotion-generic-players.hash
> @@ -0,0 +1,2 @@
> +# From https://download.enlightenment.org/rel/libs/emotion_generic_players/emotion_generic_players-1.15.0.tar.xz.sha256
> +sha256	9f6d5e9041ac7c014d663dac56d1b39ac42a45abe954d09d0edbf6e759e55f5f	emotion_generic_players-1.15.0.tar.xz
> diff --git a/package/libemotion-generic-players/libemotion-generic-players.mk b/package/libemotion-generic-players/libemotion-generic-players.mk
> new file mode 100644
> index 0000000..70b8ba3
> --- /dev/null
> +++ b/package/libemotion-generic-players/libemotion-generic-players.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# libemotion-generic-players
> +#
> +################################################################################
> +
> +LIBEMOTION_GENERIC_PLAYERS_VERSION = 1.15.0
> +LIBEMOTION_GENERIC_PLAYERS_SOURCE = emotion_generic_players-$(LIBEMOTION_GENERIC_PLAYERS_VERSION).tar.xz
> +LIBEMOTION_GENERIC_PLAYERS_SITE = http://download.enlightenment.org/rel/libs/emotion_generic_players
> +LIBEMOTION_GENERIC_PLAYERS_LICENSE = GPLv2

This is BSD-2c, not GPLv2.

> +LIBEMOTION_GENERIC_PLAYERS_LICENSE_FILES = COPYING
> +
> +LIBEMOTION_GENERIC_PLAYERS_INSTALL_STAGING = YES
> +
> +LIBEMOTION_GENERIC_PLAYERS_DEPENDENCIES = libefl vlc

Missing host-pkgconf.

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 2.4.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
