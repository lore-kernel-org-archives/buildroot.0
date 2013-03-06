From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 6 Mar 2013 15:48:03 -0800
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362610654.20183.176.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar>
 <1362500477.20183.74.camel@genx> <20130305194707.474ded42@skate>
 <1362592916.20183.152.camel@genx> <20130306195844.2f8c14b6@skate>
 <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
 <20130306222902.2d736c06@skate> <1362610654.20183.176.camel@genx>
Message-ID: <CAKcgs2wB=t_PY9hSEc2137Axov5=s8ugLnktRkbWgXBaXsVq2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

2013/3/6 John Stile <john@stilen.com>:
> +define DHCPD_CONFIGURE_CMDS
> +       (cd $@D) && \
> +       $(DHCPCD_PATH) $(DHCPCD_ENV) \
> +       ./configure \
> +       $(CONFIG_ARGS) )
> +endef

I think there's a small typo here. It should be:
define DHCPCD_CONFIGURE_CMDS
instead of
define DHCPD_CONFIGURE_CMDS

This might make the difference.

regards,
Gilles.
