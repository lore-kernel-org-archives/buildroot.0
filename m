From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:17:41 +0200
Subject: [Buildroot] [RFC: PATCH 2/3] system: allow auto net
 configuration with networkd
In-Reply-To: <1474113519-24713-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474113519-24713-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1474113519-24713-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160917141741.19bfecde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 13:58:38 +0200, Eric Le Bihan wrote:
> Allow automatic network configuration via systemd-networkd if selected.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Looks good to me, with one possible suggestion.

> -comment "automatic network configuration via DHCP needs ifupdown or busybox"
> -	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN)
> +comment "automatic network configuration via DHCP needs ifupdown or busybox or networkd"
> +	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || BR2_PACKAGE_SYSTEMD_NETWORKD)

I think I'd remove this comment entirely, I'm not sure it's very useful.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
