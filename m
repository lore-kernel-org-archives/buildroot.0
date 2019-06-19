From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 19 Jun 2019 10:34:18 +0200
Subject: [Buildroot] [PATCH] board: solidrun: add Clearfog GT-8K
In-Reply-To: <20190619075150.4qfrc7pgrtlawenu@sapphire.tkos.co.il>
References: <0131577d7afceede1aa59bf7b98dc3bda9249df5.1560673127.git.baruch@tkos.co.il>
 <20190617212014.25208cc9@windsurf>
 <20190619075150.4qfrc7pgrtlawenu@sapphire.tkos.co.il>
Message-ID: <7116874d-4321-49d8-89dd-ff77d519d6e7@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The CONFIG_NET_DSA symbol has
>
>   depends on BRIDGE || BRIDGE=n
>
> The arm64 defconfig has
>
>   CONFIG_BRIDGE=m
>
> So CONFIG_NET_DSA transforms to 'm' in the final kernel configuration. 
> CONFIG_NET_DSA_MV88E6XXX depends on CONFIG_NET_DSA, so it is set to 'm' as 
> well.
>
> The mv88e6xxx is a mdio_bus device that does not provide a 
> modalias sysfs node 
> under /sys/devices. So the S10mdev script does not load it automatically on 
> boot.

Hi Baruch,
my involvement with this platform is limited to just the Clearfog Base 
because that's what we're using internally. I therefore cannot really 
comment on the patch.

That said, I think that this module vs. built-in is something which can go 
to the commit message.

With kind regards,
Jan
