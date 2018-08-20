From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 20:15:27 +0200
Subject: [Buildroot] [PATCH] synopsys/hsdk: Boot log cleanup
In-Reply-To: <635f39ab160206f29d9b15f142c7176679444aaf.camel@synopsys.com>
References: <20180820173938.23761-1-Evgeniy.Didin@synopsys.com>
 <20180820194801.6cbb1bc8@windsurf>
 <635f39ab160206f29d9b15f142c7176679444aaf.camel@synopsys.com>
Message-ID: <20180820201527.0e40a481@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 18:13:15 +0000, Evgeniy Didin wrote:

> For HSDK board we setup bootargs via device tree, see https://elixir.bootlin.com/linux/latest/source/arch/arc/boot/dts/hsdk.dts#L25
> "console=ttyS3" was mistakenly placed in u-boot bootargs which are appended to Kernel bootargs.

OK. This must be an ARC-specific behavior, because on ARM, the U-Boot
bootargs *replace* the DT bootargs.

Thanks for the additional explanation.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
