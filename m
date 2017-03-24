From: Jeroen Roovers <jer@airfi.aero>
Date: Fri, 24 Mar 2017 06:08:32 +0100
Subject: [Buildroot] [PATCH] openvpn: bump version to 2.4.1
In-Reply-To: <20170323173750.24070-1-Vincent.Riera@imgtec.com>
References: <20170323173750.24070-1-Vincent.Riera@imgtec.com>
Message-ID: <CANCHnQqqceRgA9B9L=5J4rdwC6a_TMig-JORnByM0hBOwwRHOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2.4.1 adds --enable-lz4 with a matching dependency on package/lz4 /
BR2_PACKAGE_LZ4.

On 23 March 2017 at 18:37, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> --disable-eurephia configure option doesn't exist, so remove it.
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/openvpn/openvpn.hash | 2 +-
>  package/openvpn/openvpn.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 600c250..a03345e 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 6f23ba49a1dbeb658f49c7ae17d9ea979de6d92c7357de3d55cd4525e1b2f87e  openvpn-2.4.0.tar.xz
> +sha256 fde9e22c6df7a335d2d58c6a4d5967be76df173c766a5c51ece57fd044c76ee5  openvpn-2.4.1.tar.xz
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 5e3df59..a2e21f9 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -OPENVPN_VERSION = 2.4.0
> +OPENVPN_VERSION = 2.4.1
>  OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
>  OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
>  OPENVPN_DEPENDENCIES = host-pkgconf openssl
> @@ -22,8 +22,7 @@ OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
>  ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
>  OPENVPN_CONF_OPTS += \
>         --enable-small \
> -       --disable-plugins \
> -       --disable-eurephia
> +       --disable-plugins
>  endif
>
>  # BusyBox 1.21+ places the ip applet in the "correct" place
> --
> 2.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
