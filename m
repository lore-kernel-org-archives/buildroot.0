From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 16:19:21 +0100
Subject: [Buildroot] [PATCH v4] Allow a single DHCP configuration via
 the system configuration submenu
In-Reply-To: <1421413719-10383-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1421413719-10383-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20150116161921.5fa45e55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Fri, 16 Jan 2015 14:08:39 +0100, J?r?my Rosen wrote:

> +config BR2_SIMPLE_DHCP
> +	string "Name of the physical network interface to run DHCP on"
> +	default ""
> +	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD && (BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
> +	help
> +	  The name of the network interface to configure automatically.
> +	  A DHCP request will automatically happen on startup on the selected
> +	  interface.
> +
> +	  If left empty, no automatic DHCP requests will take place.
> +
> +	  For more complicated network setups use an overlay to overwrite
> +	  /etc/network/interfaces or add a networkd configuration file.
> +
> +comment "automatic network configuration via DHCP is not compatible with networkd"
> +	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
> +
> +comment "automatic network configuration via DHCP needs ifupdown or busybox"
> +	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)

I'm still not really happy with this. It's
really /etc/network/interfaces as a whole that doesn't make sense in a
context where you don't have Busybox ifupdown, or the full blown
ifupdown, no? Not just the DHCP part of it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
