From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:21:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/network-manager-openvpn: add
 CPE variables
In-Reply-To: <20210325125442.17709-2-heiko.thiery@gmail.com>
References: <20210325125442.17709-1-heiko.thiery@gmail.com>
 <20210325125442.17709-2-heiko.thiery@gmail.com>
Message-ID: <20210328212129.4a2d6d29@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Mar 2021 13:54:44 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> cpe:2.3:a:gnome:network_manager_vpnc ia a valid CPE identifier for this
> package:
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Anetwork_manager_vpnc
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/network-manager-openvpn/network-manager-openvpn.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
> index 1a872dc127..d861ac65ae 100644
> --- a/package/network-manager-openvpn/network-manager-openvpn.mk
> +++ b/package/network-manager-openvpn/network-manager-openvpn.mk
> @@ -11,6 +11,8 @@ NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager
>  NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
>  NETWORK_MANAGER_OPENVPN_LICENSE = GPL-2.0+
>  NETWORK_MANAGER_OPENVPN_LICENSE_FILES = COPYING
> +NETWORK_MANAGER_OPENVPN_CPE_ID_VENDOR = gnome
> +NETWORK_MANAGER_OPENVPN_CPE_ID_PRODUCT = network_manager_vpnc

Are you sure this is correct ? NetworkManager-vpnc is for Cisco client,
not for OpenVPN clients. See
https://gitlab.gnome.org/GNOME/NetworkManager-vpnc vs
https://gitlab.gnome.org/GNOME/NetworkManager-openvpn.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
